package com.example.apartment.controllers;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import com.example.apartment.service.TenantService;
import com.example.apartment.entity.Tenant;

@RestController
@RequestMapping("/api/tenants")
@CrossOrigin(origins = "http://localhost:3000")
public class TenantController {

    @Autowired
    private TenantService tenantService;

    @PostMapping
    public ResponseEntity<String> addTenant(@RequestBody Tenant Tenant) {
        tenantService.addTenant(Tenant);
        return ResponseEntity.ok("Tenant added successfully!");
    }
}
