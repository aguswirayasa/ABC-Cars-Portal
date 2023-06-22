package com.abc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.abc.entity.Car;
import com.abc.entity.CarBidding;
import com.abc.entity.User;
import com.abc.service.CarService;
import com.abc.service.UserService;


@Controller
public class AdminController {
	
	@Autowired
	UserService us;
	
	@Autowired
	CarService cs;
	
	@RequestMapping(value="/manage-user", method=RequestMethod.GET)
	public String manageUser(Model model) {
		List<User> user = us.showAllUser();
		User userModel = new User();
		model.addAttribute("user",user);
		model.addAttribute("userModel",userModel);
		return "user-management";
	}
	@RequestMapping(value="/manage-car", method=RequestMethod.GET)
	public String manageCar(Model model) {
		Car carModel = new Car();
		List<Car> cars = cs.getAllCars();
		List<String> carsImage = new ArrayList<>();
		for (Car car : cars) {
		    byte[] imageBytes = car.getCarImage();
		    String base64String = Base64.getEncoder().encodeToString(imageBytes);
		    carsImage.add(base64String);
		}
		List<CarBidding> bidding = cs.getAllBids();
		model.addAttribute("carImage",carsImage);
		model.addAttribute("cars",cars);
		model.addAttribute("car",carModel);
		model.addAttribute("bookings",bidding);
		return "manage-car";
	}
	@RequestMapping(value="/edit-car", method=RequestMethod.POST)
	public String editCar(@ModelAttribute("car")Car car,@RequestParam("file")MultipartFile file){
		
		  try {
		        if (!file.isEmpty()) {
		            car.setCarImage(file.getBytes());
		            System.out.println("file is not null");
		        } else {
		            byte[] carImage = cs.findCarImageById(car.getId());
		            car.setCarImage(carImage);
		            System.out.println("file is null");
		        }
		    } catch (IOException e) {
		        // handle the exception
		    	System.out.println(e);
		    }
		cs.editCar(car);;
		return "redirect:/car-detail?id="+car.getId();
	}
	
    @GetMapping("delete")
    public String deleteUser(@RequestParam long uid) {
    	
    	us.deleteUser(uid);
    	
    	return "redirect:manage-user";
    }
    
    @PostMapping("edit")
    public String editUser(
    		@ModelAttribute("userModel") User u) {
    	
    	Optional<User> user_info = us.findUserById(u.getId());
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    	
    	user.setFirstName(u.getFirstName());
    	user.setLastName(u.getLastName());
    	user.setUserName(u.getUserName());
    	user.setEmail(u.getEmail());
    	user.setMobile(u.getMobile());
    	user.setCity(u.getCity());
    	user.setCountry(u.getCountry());
    	
    	us.updateUser(user);
    	System.out.println("Edit User Successful");
    	System.out.println(user);
    	
    	return "redirect:manage-user";
    }
    
    @PostMapping("assign_role")
    public String assignRole(@RequestParam long uid,
    		@RequestParam("role") String role,
    		@ModelAttribute("user") User u) {
    	
    	Optional<User> user_info = us.findUserById(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    
    	us.assignNewRole(user, role);
    	System.out.println(user);
    	 return "redirect:manage-user";
    }
    
}
