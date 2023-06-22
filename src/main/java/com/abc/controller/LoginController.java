package com.abc.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.abc.entity.User;
import com.abc.security.UserDetailsServiceImpl;
import com.abc.service.UserService;


@Controller
public class LoginController {
	
	@Autowired
	UserDetailsServiceImpl service;
	
	 private static final Logger logger = LogManager.getLogger(LoginController.class);
	
	@Autowired
	UserService us;
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/home",method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	@RequestMapping(value = "/login_success",method = RequestMethod.GET)
	public String succes() {
		return "redirect:/car-listing";
	}
	@RequestMapping(value = "/login_error",method = RequestMethod.GET)
    public String onLoginError(Model model) {
        String error_msg = "Incorrect username or password. Try Again.";
        model.addAttribute("error", error_msg);
        return "login";
    }
    
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String onLogoutSuccess(Model model) {
    	
    	String success_logout = "Successfully logged Out!";
        model.addAttribute("logout", success_logout);
    	
    	return "login";
    }
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String register(Model model) {
		
		User user = new User();
		model.addAttribute("user", user);
		return "register";
	}
	
	@RequestMapping(value = "/save",method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user")User user,Model model) {
		logger.info("before calling Service to save user info");
		try {
			us.saveUser(user);
	    	String success_register = "Registeration Successful";
	    	model.addAttribute("success_register", success_register);			
		} catch (Exception e) {
			// TODO: handle exception
		   	String error_register = "Registeration failed,please try again!";
	    	model.addAttribute("error_register", error_register);
		}
		logger.info("after calling Service to save user info");
		return "register";
	}
		
	
	
}
