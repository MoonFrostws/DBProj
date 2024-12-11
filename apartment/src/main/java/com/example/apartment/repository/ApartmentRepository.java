package com.example.apartment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.apartment.entity.Apartment;
import java.util.List;

public interface ApartmentRepository extends JpaRepository<Apartment, Integer> {

    List<Apartment> findByStatus(String status);
}

