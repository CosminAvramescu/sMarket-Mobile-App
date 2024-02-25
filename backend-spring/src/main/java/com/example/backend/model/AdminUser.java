package com.example.backend.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document("adminUser")
@Data
@RequiredArgsConstructor
public class AdminUser {
    @Id
    String id;

    String username;

    String password;

    String firstName;

    String lastName;

    @DBRef
    Shop shop;
}
