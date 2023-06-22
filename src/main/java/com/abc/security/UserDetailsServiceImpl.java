package com.abc.security;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.abc.entity.Role;
import com.abc.entity.User;
import com.abc.repository.UserRepository;

;


@Service
@Transactional
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public UserDetailsServiceImpl() {
    }

    /*
     * Default Authentication mechanism calls this method to get UserDetails by the name given at the time of login.
     * This method returns UserDetails with password and roles he/she plays.
     * Spring then verifies the password given by the user with this password and authenticates the user.
     */
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
    	System.out.println("finding user");
        User user = userRepository.findByUserName(userName);
        if(user == null) {
        	System.out.println("user not found for username: "+userName);
            throw new UsernameNotFoundException("user " + userName + " is not valid. Please re-enter.");
        }
        org.springframework.security.core.userdetails.User.UserBuilder userBuilder = org.springframework.security.core.userdetails.User.builder();
        
        String[] roleNames= user.getRoles().stream().map(Role::getName).toArray(String[]::new);
        
        System.out.println("Role Name is "+roleNames);
        System.out.println(user.getFirstName()+" "+user.getLastName());
        System.out.println(user.getPassword());
        
        return userBuilder.username(user.getUserName())
                        .password(user.getPassword())
                        .roles(roleNames)
                        .build();
    }
}
