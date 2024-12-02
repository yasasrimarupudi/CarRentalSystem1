package com.infosys.CarRentalSystem.dao;

import com.infosys.CarRentalSystem.bean.Car;

import java.util.List;

public interface CarDao {
    public void save(Car car);
    public Car findById(String id);
    public List<Car> findAll();
    public void deleteCarById(String id);
	public List<Car> getAvailableCars();
	public void updateCarAvailability(String carNumber, boolean availability);
}