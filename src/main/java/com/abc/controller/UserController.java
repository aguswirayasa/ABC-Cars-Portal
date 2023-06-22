package com.abc.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class UserController {
	
	@Autowired
	UserService us;
	
	@Autowired
	CarService cs;
	
	@RequestMapping("/profile")
	public String getProfile(Model model, Principal principal) {
		User user = us.findUserByUsername(principal.getName());
		if (user!=null) {			
			if (user.getProfileImage()!=null) {
				String userPhoto = Base64.getEncoder().encodeToString(user.getProfileImage());
				model.addAttribute("userPhoto",userPhoto);			
			}
		}else {
			return "redirect:/logout";
		}
		model.addAttribute("user",user);
		
    	//Get user car posts
				
			List<Car> cars = cs.findCarPosts(user.getId());
			Car carModel = new Car();
			List<String> carsImage = new ArrayList<>();
			for (Car car : cars) {
				byte[] imageBytes = car.getCarImage();
				String base64String = Base64.getEncoder().encodeToString(imageBytes);
				carsImage.add(base64String);
			}
			model.addAttribute("cars", cars);
			model.addAttribute("carImage",carsImage);
			model.addAttribute("car", carModel);
		
    
    	
    	//Get user bidding or booking or both
    	List<CarBidding> bids = cs.getUserBids(user);
    	System.out.println(bids);
    	
    	
    	
    	model.addAttribute("bids", bids);
		return "profile";
	}
	@RequestMapping("/view-user")
	public String getUserProfile(Model model,@RequestParam("uid")Long uid) {
		Optional<User> getUser = us.findUserById(uid);
		User user = getUser.get();
		if (user.getProfileImage()!=null) {
			String userPhoto = Base64.getEncoder().encodeToString(user.getProfileImage());
			model.addAttribute("userPhoto",userPhoto);			
		}
		model.addAttribute("user",user);
		
		//Get user car posts
		List<Car> cars = user.getCars();
		System.out.println(cars);
		Car car = new Car();
		model.addAttribute("cars", cars);
		model.addAttribute("car", car);
		
		//Get user bidding or booking or both
		List<CarBidding> bids = cs.getUserBids(user);
		System.out.println(bids);
		
		model.addAttribute("bids", bids);
		return "profile";
	}
	@RequestMapping(value="/profile/save", method=RequestMethod.POST)
	public String updateProfile(@ModelAttribute("user")User user) {
		us.updateUser(user);
		return "redirect:/profile";
	}
	@RequestMapping(value="/profile/add-picture", method=RequestMethod.POST)
	public String addProfilePicture(@RequestParam("photo")MultipartFile photo,@ModelAttribute("user")User user) {
		try {
			us.addProfilePicture(user.getId(), photo.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/profile";
	}
	@RequestMapping(value="/error", method=RequestMethod.GET)
	public String error() {
		return "error";
	}
}
