package com.infosys.CarRentalSystem.dao;

import com.infosys.CarRentalSystem.bean.CarBooking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CarBookingRepository extends JpaRepository<CarBooking, String> {
    @Query("SELECT max(bookingId) from CarBooking")
    public String getLastId();

    public List<CarBooking> findAllByUsername(String username);
}