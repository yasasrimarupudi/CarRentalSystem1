package com.infosys.CarRentalSystem.dao;

import com.infosys.CarRentalSystem.bean.Car;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CarRepository extends JpaRepository<Car, String> {
	@Query("select a from Car a where available = true")
	public List<Car> getAvailableCars();
}