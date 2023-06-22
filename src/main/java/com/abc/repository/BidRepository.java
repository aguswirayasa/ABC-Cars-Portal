package com.abc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.entity.Car;
import com.abc.entity.CarBidding;
import com.abc.entity.User;


@Repository
public interface BidRepository extends JpaRepository<CarBidding, Long>{
	List<CarBidding> findByUserAndCar(User user, Car car);
	
	List<CarBidding> findByUser(User user);
}
