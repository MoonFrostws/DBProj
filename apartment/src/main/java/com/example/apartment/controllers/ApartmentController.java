package com.example.apartment.controllers;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.apartment.entity.Apartment;
import com.example.apartment.service.ApartmentService;
import java.util.List;

@RestController
@RequestMapping("/api/apartments")
@CrossOrigin(origins = "http://localhost:8000")

public class ApartmentController {
    @GetMapping



    public String defaultEndpoint() {
        return "Apartment API is working!";
    }

    private final ApartmentService apartmentService;

    public ApartmentController(ApartmentService apartmentService) {
        this.apartmentService = apartmentService;
    }

    @GetMapping("/available")
    public List<Apartment> getAvailableApartments() {
        return apartmentService.findAvailableApartments();
    }

}

