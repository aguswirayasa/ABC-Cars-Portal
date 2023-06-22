package com.abc.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.entity.User;



@Repository
@Transactional
public interface UserRepository extends JpaRepository<User, Long> {
	User findByUserName(String userName);
	
	@Modifying
    @Query("UPDATE User u SET u.firstName = ?1, u.lastName = ?2, u.userName = ?3, u.mobile = ?4, u.city = ?5, u.country = ?6, u.email = ?7 WHERE u.id = ?8")
    void updateUser(String firstName, String lastName, String userName, String mobile, String city, String country, String email, Long id);


    @Transactional
    @Modifying
    @Query("UPDATE User u SET u.profileImage = :profileImage WHERE u.id = :id")
    void updateUserProfile(@Param("id") Long id, @Param("profileImage") byte[] profileImage);

}
