package com.example.backend.repository;


import com.example.backend.model.ClientUser;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ClientUserRepository extends MongoRepository<ClientUser, String> {
    ClientUser getUserById(String id);
}
