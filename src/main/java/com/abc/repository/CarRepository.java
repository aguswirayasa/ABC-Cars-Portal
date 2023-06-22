package com.abc.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.entity.Car;

@Transactional
@Repository
public interface CarRepository extends JpaRepository<Car, Long>{
	List<Car> findBySellerId(Long uid);
	
    @Query("SELECT c.carImage FROM Car c WHERE c.id = :carId")
    byte[] findCarImageById(@Param("carId") Long carId);
   
    @Query("SELECT c FROM Car c WHERE LOWER(c.model) LIKE %:keyword% AND (:year is null OR c.year = :year) OR LOWER(c.make) LIKE %:keyword% AND (:year is null OR c.year = :year)")
    List<Car> searchCars(@Param("keyword") String keyword, @Param("year") String year);

    @Modifying
    @Query("UPDATE Car c SET c.make = :make, c.model = :model, c.price = :price, c.year = :year, c.carImage = :carImage, c.fuelType = :fuelType, c.transmission = :transmission, c.mileage = :mileage WHERE c.id = :id")
    void updateCar(@Param("id") Long id, @Param("make") String make, @Param("model") String model, @Param("price") String price, @Param("year") String year, @Param("carImage") byte[] carImage, @Param("fuelType") String fuelType, @Param("transmission") String transmission, @Param("mileage") String mileage);


}
