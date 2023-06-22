package com.abc.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import com.abc.entity.User;
import com.abc.repository.RoleRepository;
import com.abc.repository.UserRepository;



@Service
public class UserService {
	
	@Autowired
	UserRepository repo;
	
	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	public void saveUser(User user) {
		
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("Users")));
		
		repo.save(user);
		
	}
	public String updateUser(User user) {
		String response = "";
		try {
			repo.updateUser(user.getFirstName(), 
					user.getLastName(), user.getUserName(), 
					user.getMobile(), user.getCity(), user.getCountry(), 
					user.getEmail(), user.getId());
			System.out.println("update success");
			response = "update success";
		} catch (Exception e) {
			// TODO: handle exception
			response = "update failed";
			System.out.println(e);
			System.out.println("update failed");
		}
		return response;
	}
	
	public User findUserByUsername(String username) {
		return repo.findByUserName(username);
		
	}
	public Optional<User> findUserById(Long id) {
		return repo.findById(id);
		
	}
	public void addProfilePicture(Long id,byte[]profileImage) {
		repo.updateUserProfile(id, profileImage);
	}
	public List<User> showAllUser(){
		return repo.findAll();
	}
	public void assignNewRole(User user, String role) {
		
		user.getRoles().clear();
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles(role)));
		repo.save(user);
	}
	public void deleteUser(long uid) {
		
		repo.deleteById(uid);
	}
}
