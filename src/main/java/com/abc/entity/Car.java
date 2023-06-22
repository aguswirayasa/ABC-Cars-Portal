package com.abc.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;


@Entity
public class Car {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	 @OneToMany(mappedBy = "car")
	private Set<CarBidding> biddings = new HashSet<CarBidding>();
	 
		@OneToMany(mappedBy = "car", cascade = CascadeType.ALL, orphanRemoval = true)
		private List<CarBidding> bidding = new ArrayList<>();

	
	private String year;

	private String make;

	private String model;

	private String price;
	
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User seller;
	
	private String sellStatus;
	
	private String mileage;
	
	private String fuelType;
	
	private String transmission;
	

	
	
	
	@Lob
	private byte[] carImage;
	
	@CreatedDate
	private String postDate;
 
	
	
	

	public Car() {
		super();
	}


	public Car(Long id, String make, String model,String year) {
		super();
		this.id = id;
		this.year = year;
		this.make = make;
		this.model = model;
	}


	public Car(String year, String make, String model) {
		super();
		this.year = year;
		this.make = make;
		this.model = model;
	}


	@PrePersist
	private void onCreate() {

		DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");

		postDate = dateOnly.format(new Date());

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<CarBidding> getBiddings() {
		return biddings;
	}

	public void setBiddings(Set<CarBidding> biddings) {
		this.biddings = biddings;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}



	public User getSeller() {
		return seller;
	}

	public void setSeller(User seller) {
		this.seller = seller;
	}

	public String getSellStatus() {
		return sellStatus;
	}

	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}

	public byte[] getCarImage() {
		return carImage;
	}

	public void setCarImage(byte[] carImage) {
		this.carImage = carImage;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getCarYearAndName() {
	return year + " " + make + " " + model;
}
	public String getCarPrice() {
		return "$"+price;
	}


	public String getFuelType() {
		return fuelType;
	}

	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}

	public String getTransmission() {
		return transmission;
	}

	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}

	public String getMileage() {
		return mileage;
	}

	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	
	
}
