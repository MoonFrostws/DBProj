package com.example.apartment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.apartment.entity.Apartment;
import com.example.apartment.repository.ApartmentRepository;

import java.util.List;

@Service
public class ApartmentService {

    @Autowired
    private ApartmentRepository apartmentRepository;

    public List<Apartment> findAvailableApartments() {
        List<Apartment> apartments = apartmentRepository.findByStatus("Vacant");
        apartments.forEach(apartment -> {
            System.out.println("ApartmentID: " + apartment.getApartmentID());
            System.out.println("BuildingNumber: " + apartment.getBuildingNumber());
            System.out.println("FloorNumber: " + apartment.getFloorNumber());
            System.out.println("NumberOfRooms: " + apartment.getNumberOfRooms());
        });
        return apartments;
    }


}
