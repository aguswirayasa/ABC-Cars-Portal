package com.abc.controller;

import java.io.IOException;
import java.io.Reader;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.entity.Car;
import com.abc.entity.CarBidding;
import com.abc.entity.User;
import com.abc.service.CarService;
import com.abc.service.UserService;

@Controller
public class CarController {
	
	@Autowired
	CarService cs;
	
	@Autowired
	UserService us;
	
	
	@RequestMapping("/car-listing")
	public String listCar(Model model) {
		List<Car> allCars = cs.getAllCars();
		List<String> carsImage = new ArrayList<>();
		Car carModel = new Car();
		for (Car car : allCars) {
		    byte[] imageBytes = car.getCarImage();
		    String base64String = Base64.getEncoder().encodeToString(imageBytes);
		    carsImage.add(base64String);
		}
		model.addAttribute("carList",allCars);
		model.addAttribute("carImage",carsImage);
		model.addAttribute("car",carModel);
		return "car-listing";
	}
	
	@RequestMapping(value="/post-car",method=RequestMethod.POST)
	public String postCar(@ModelAttribute("car")Car car,@RequestParam("file") MultipartFile file,Model model,RedirectAttributes ra,Principal principal) throws IOException {
		String msg="";
		try {
			User user = us.findUserByUsername(principal.getName());
			car.setSeller(user);
			car.setCarImage(file.getBytes());
			car.setSellStatus("Sell");
			cs.save(car);
			msg="Your car have been posted successfully";
			ra.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("post failed");
			msg="Post Failed";
			ra.addFlashAttribute("msg", msg);
		}
		return "redirect:car-listing";
	}
	
	@RequestMapping("/about-us")
	public String showAboutUs() {
		return "about-us";
	}
	@RequestMapping("/contact-us")
	public String showContactUs() {
		return "contact-us";
	}
	@RequestMapping("/car-detail")
	public String showCarDetail(@RequestParam("id")Long id,Model model) {
		Optional<Car> car = cs.findCarById(id);
		if (car!=null) {
			User carPoster = car.get().getSeller();
			byte[] userPhotos = carPoster.getProfileImage();
		    String carImage = Base64.getEncoder().encodeToString(car.get().getCarImage());
		    if (userPhotos!=null) {
		    	String userPhoto = Base64.getEncoder().encodeToString(userPhotos);				
		    	model.addAttribute("userPhoto",userPhoto);
			}
		    model.addAttribute("carImage",carImage);
			model.addAttribute("carPoster", carPoster);
			model.addAttribute("carDetails", car.get());
		}
		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(car.get());

		List<CarBidding> bdata = cs.getAllBids().stream().filter(byCar).collect(Collectors.toList());

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		return "car-detail";
	}
	
	@RequestMapping(value="delete-car",method=RequestMethod.GET)
	public String deletePostCar(@RequestParam long id) {
		
		cs.deleteCarById(id);
		
		return "redirect:manage-car";
		
	}
	@RequestMapping(value="delete-post",method=RequestMethod.GET)
	public String deleteCarUser(@RequestParam long id) {
		
		cs.deleteCarById(id);
		
		return "redirect:profile";
		
	}
	@RequestMapping(value="bid",method=RequestMethod.POST)
	public String carBidding(@ModelAttribute("bidding") CarBidding bid,
			@RequestParam(value = "cid", required = false) long id, Principal principal, Model model,
			@RequestParam("bidderPrice") double price) {

		// Get User name
		String uname = principal.getName();

		User user = us.findUserByUsername(uname);

		// get Car
		Optional<Car> car_info = cs.findCarById(id);
		System.out.println(car_info);

		Car cardata = car_info.get();

		bid.setBidderName(user.getFullName());
		bid.setUser(user);
		bid.setCar(cardata);

		// before saving, check if user has placed a bid before
		List<CarBidding> userBid = cs.findUserBid(user, cardata);
		System.out.println(userBid);

		if (userBid.size() > 0) {

			long bidId = userBid.stream().findAny().get().getId();
			Optional<CarBidding> bid_info = cs.getBidInfo(bidId);
			System.out.println(bid_info);

			CarBidding bidData = bid_info.get();

			bidData.setBidderPrice(price);

			cs.saveBid(bidData);
			
			
		} else {
			cs.saveBid(bid);
			
		}

		// show car data

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = cs.getAllBids().stream().filter(byCar).collect(Collectors.toList());
		System.out.println(bdata);

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		
		Set<CarBidding> highBid = new HashSet<CarBidding>();
		highBid.add(bdata.get(0));
		
		//cardata.getBiddings().clear();
		cardata.setBiddings(highBid);
		cs.save(cardata);
		System.out.println(cardata.getBiddings());

		return "redirect:/bid-and-book?id="+id;
	}

	@RequestMapping(value="book",method=RequestMethod.POST)
	public String carBooking(@ModelAttribute("booking") CarBidding book,
			@RequestParam(value = "cid", required = false) long id, Principal principal, 
			Model model, @RequestParam("bookDate") String date) {

		// Get User name
		String uname = principal.getName();

		User user = us.findUserByUsername(uname);

		// get Car
		Optional<Car> car_info = cs.findCarById(id);
		System.out.println(car_info);

		Car cardata = car_info.get();

		book.setUser(user);
		book.setCar(cardata);
		book.setBidderName(user.getFullName());
		book.setBookStatus("Pending");

		// before saving, check if user has placed a bidding before to add booking date
		List<CarBidding> userBooking = cs.findUserBid(user, cardata);
		System.out.println(userBooking);

		if (userBooking.size() > 0) {

			long bookId = userBooking.stream().findAny().get().getId();
			Optional<CarBidding> book_info = cs.getBidInfo(bookId);
			System.out.println(book_info);

			CarBidding bookdata = book_info.get();
			
			bookdata.setBookDate(date);

			cs.saveBid(bookdata);
		} else {
			
			cs.saveBid(book);
		}

		// show car data

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = cs.getAllBids().stream().filter(byCar).collect(Collectors.toList());
		System.out.println(bdata);

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		
		Set<CarBidding> highBid = new HashSet<CarBidding>();
		highBid.add(bdata.get(0));
		
		//cardata.getBiddings().clear();
		cardata.setBiddings(highBid);
		cs.save(cardata);
		System.out.println(cardata.getBiddings());
		

		return "redirect:/bid-and-book?id="+id;
	}
	@RequestMapping(value="bid-and-book",method=RequestMethod.GET)
	public String viewCarBidAndBook(@RequestParam("id") long id, Model model) {

		Optional<Car> car_info = cs.findCarById(id);

		Car cardata = car_info.get();

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = cs.getAllBids().stream().filter(byCar).collect(Collectors.toList());

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}

		return "bid-book";
	}

	@PostMapping("booking_status")
	public String setCarBookingStatus(@RequestParam long bid,
			@ModelAttribute("book") CarBidding book) {
		
		Optional<CarBidding> car_info = cs.getBidInfo(bid);
		System.out.println("bid id is"+bid);
		CarBidding car_booking = car_info.get();
		System.out.println(car_booking);
		
		car_booking.setBookStatus(book.getBookStatus());
		
		cs.saveBid(car_booking);
		
		return "redirect:/manage-car";
	}
	
	@PostMapping("sale_status")
	public String setCarSaleStatus(@RequestParam long cid,
			@ModelAttribute("car") Car car) {
		
		Optional<Car> car_info = cs.findCarById(cid);
		Car car_sale = car_info.get();
		System.out.println(car_sale);
		
		car_sale.setSellStatus(car.getSellStatus());
		
		cs.save(car_sale);
		
		return "redirect:/manage-car";
	}
	@RequestMapping(value="search",method=RequestMethod.GET)
	public String searchCar(@RequestParam("keyword")String keyword,Model model) {
		List<Car> searchResult = null;
		String[] parts = keyword.split(" ");
		if (parts.length>=2) {			
			String word = parts[0];
			String year = parts[1];
			searchResult = cs.searchCar(word, year);
			System.out.println("with year");
		}else {
			String year = null;
			searchResult = cs.searchCar(keyword, year);
			System.out.println("no year");
		}
		if (searchResult.isEmpty()) {
			model.addAttribute("msg","No Result found for keyword: "+keyword);
		}else {
			List<String> carsImage = new ArrayList<>();
			for (Car car : searchResult) {
			    byte[] imageBytes = car.getCarImage();
			    String base64String = Base64.getEncoder().encodeToString(imageBytes);
			    carsImage.add(base64String);
			}
			model.addAttribute("result",searchResult);
			model.addAttribute("carImage",carsImage);
		}

		return "search-result";
		
	}

}
