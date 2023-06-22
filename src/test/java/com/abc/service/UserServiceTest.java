package com.abc.service;

import java.util.HashSet;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.abc.entity.User;
import com.abc.repository.RoleRepository;
import com.abc.repository.UserRepository;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTest {
		
		@InjectMocks
		UserService userService;
		
		@Mock
		RoleRepository roleRepository;
		
		@Mock
		PasswordEncoder passwordEncoder;
		
		@Mock
		UserRepository userRepository;
		
		@Before
		public void setUp() {
			MockitoAnnotations.initMocks(this);
		}
		
		 @Test public void findUserByNameTest() { 
		 User user = new User(); 
		 String username = "kobo"; 
		 user.setUserName(username);
		 Mockito.when(userRepository.findByUserName(username)).thenReturn(user); 
		 User loginUser = userService.findUserByUsername(username); 
		 Assert.assertEquals(user,loginUser); }
		
		

	}

