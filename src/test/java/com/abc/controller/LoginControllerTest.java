package com.abc.controller;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.ui.ConcurrentModel;
import org.springframework.ui.Model;

import com.abc.entity.User;
import com.abc.service.UserService;



@RunWith(MockitoJUnitRunner.class)
public class LoginControllerTest {
	@InjectMocks
	LoginController loginController;
	
	@Mock
	UserService us;
	
	  @Autowired
	  private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception{
		MockitoAnnotations.initMocks(this);
	}
	
	  @Test
	  public void testSaveUser() throws Exception {
	    // create a user object
	    User user = new User();
	    user.setFirstName("kobo");
	    user.setLastName("kanaeru");
	    user.setUserName("kobo");
	    user.setPassword("kobo123");
	    Model model = new ConcurrentModel();
	    String res = loginController.saveUser(user, model);

	    // mock the saveUser() method to return the same user object
	    try {
	    	us.saveUser(user);
		} catch (Exception e) {
			// TODO: handle exception
		}
	   Assert.assertEquals("register", res);
	 

	  }
	
}
