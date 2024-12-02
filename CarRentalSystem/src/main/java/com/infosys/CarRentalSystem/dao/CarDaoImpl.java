package com.infosys.CarRentalSystem.dao;

import java.util.List;
import java.util.Optional;

import com.infosys.CarRentalSystem.bean.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarDaoImpl implements CarDao {
    @Autowired
    private CarRepository repository;

    @Override
    public void save(Car car) {
        repository.save(car);
    }

    @Override
    public Car findById(String id) {
        // Handle the Optional in case the car is not found
        return repository.findById(id).orElse(null);  // Or throw a custom exception if preferred
    }

    @Override
    public List<Car> findAll() {
        return repository.findAll();
    }

    @Override
    public void deleteCarById(String id) {
        repository.deleteById(id);
    }

    @Override
    public List<Car> getAvailableCars() {
        // Assuming there is a method in CarRepository to find available cars
        return repository.getAvailableCars();
    }
    @Override
    public void updateCarAvailability(String carNumber, boolean availability) {
        Car car = findById(carNumber);
        if (car != null) {
            car.setAvailable(availability);  // Assuming 'available' is a boolean field in the Car class
            repository.save(car);  // Save the updated car back to the repository
        }
    }
}