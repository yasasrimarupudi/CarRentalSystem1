package com.infosys.CarRentalSystem.dao;

import com.infosys.CarRentalSystem.bean.CarBooking;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface CarBookingDao {
    public void save(CarBooking carBooking);
    public CarBooking findById(String id);
    public String generateBookingId();
    public List<CarBooking> findAll();
    public List<CarBooking> findAllByUsername(String username);
}