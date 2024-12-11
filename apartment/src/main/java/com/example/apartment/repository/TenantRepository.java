package com.example.apartment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.apartment.entity.Tenant;

public interface TenantRepository extends JpaRepository<Tenant, Integer> {
}
