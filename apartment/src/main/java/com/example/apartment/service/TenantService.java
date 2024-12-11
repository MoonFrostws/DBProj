package com.example.apartment.service;
import com.example.apartment.repository.TenantRepository;
import com.example.apartment.entity.Tenant;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.apartment.entity.Apartment;
import com.example.apartment.entity.Tenant;




@Service
public class TenantService {

    @Autowired
    private TenantRepository tenantRepository;

    public void addTenant(Tenant tenant) {
        tenantRepository.save(tenant);
    }

}
