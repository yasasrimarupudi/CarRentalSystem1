package com.infosys.CarRentalSystem.dao;
// dao - data access object

import com.infosys.CarRentalSystem.bean.CarUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarUserRepository extends JpaRepository<CarUser, String> {

}