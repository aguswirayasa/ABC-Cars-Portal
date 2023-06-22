package com.abc.service;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.abc.entity.Car;
import com.abc.entity.CarBidding;
import com.abc.entity.User;
import com.abc.repository.BidRepository;
import com.abc.repository.CarRepository;

@RunWith(MockitoJUnitRunner.class)
public class CarServiceTest {
	@InjectMocks
	CarService carService;
	
	@Mock
	CarRepository carRepository;
	
	@Mock
	BidRepository bidRepository;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void saveCarTest() {
	  
	    Car car = new Car();
	    car.setMake("Toyota");
	    car.setModel("Camry");
	    car.setYear("2020");
	    car.setPrice("50.000");

	    String msg = carService.save(car);

	    Assert.assertEquals("car saved successfully", msg);
	}
	
	@Test
	public void testSearchCar() {
		Car car = new Car();
		String keyword = "Toyota";
		String year = "2020";
		car.setMake(keyword);
		car.setYear(year);
		
		List<Car> searchCar = new ArrayList<Car>();
		searchCar.add(car);
		
		Mockito.when(carRepository.searchCars(keyword, year)).thenReturn(searchCar);
		List<Car> search = carService.searchCar(keyword, year);
		Assert.assertEquals(searchCar, search);
	}
	
	@Test
	public void testCarBidding() {
		CarBidding bid = new CarBidding();
		Double price = 50000.00;
		bid.setBidderName("James Smith");
		bid.setBidderPrice(price);
		String msg = carService.saveBid(bid);
		Assert.assertEquals("bid successfull", msg);

}
	
}
