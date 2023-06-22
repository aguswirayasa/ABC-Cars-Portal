package com.abc.service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.entity.Car;
import com.abc.entity.CarBidding;
import com.abc.entity.User;
import com.abc.repository.BidRepository;
import com.abc.repository.CarRepository;




@Service
public class CarService {
	@Autowired
	private CarRepository carRepository;
	@Autowired
	private BidRepository bidRepository;

	public List<Car> getAllCars() {
		return carRepository.findAll();
	}

	public String save(Car car) {
		try {
			carRepository.save(car);
			return "car saved successfully";
		} catch (Exception e) {
			return "car saved failed";
		}
		
		
	}
	public void editCar(Car car) {
		
		carRepository.updateCar(car.getId(), car.getMake(), car.getModel(),car.getPrice(), car.getYear(), car.getCarImage(), car.getFuelType(), car.getTransmission(), car.getMileage());;
	}
	
	public Optional<Car> findCarById(Long id) {
		return carRepository.findById(id);
	}
	public List<Car> findCarPosts(long uid){
		return carRepository.findBySellerId(uid);
	}
	public List<CarBidding> getUserBids(User user){
		return bidRepository.findByUser(user);
	}
	public byte[] findCarImageById(Long id) {
		return carRepository.findCarImageById(id);
	}
	public void deleteCarById(Long id) {
		carRepository.deleteById(id);
	}

	public List<CarBidding> findUserBid(User user, Car car) {
		return bidRepository.findByUserAndCar(user, car);
	}

	public Optional<CarBidding> getBidInfo(long id) {
		return bidRepository.findById(id);
	}
	
	public String saveBid(CarBidding bid) {
		try {
			bidRepository.save(bid);
			return "bid successfull";
		} catch (Exception e) {
			return "bid failed";
		}
	}
	public List<CarBidding> getAllBids() {

		List<CarBidding> allBid = bidRepository.findAll();

		List<CarBidding> sortedList = allBid.stream()
				.sorted(Comparator.comparingDouble(CarBidding::getBidderPrice).reversed()).collect(Collectors.toList());
		
		return sortedList;
	}
	public List<Car> searchCar(String keyword,String year){
	
		return carRepository.searchCars(keyword, year);

}}
