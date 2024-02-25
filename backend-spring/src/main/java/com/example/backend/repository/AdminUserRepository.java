package com.example.backend.repository;

import com.example.backend.model.AdminUser;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface AdminUserRepository extends MongoRepository<AdminUser, String> {

}
