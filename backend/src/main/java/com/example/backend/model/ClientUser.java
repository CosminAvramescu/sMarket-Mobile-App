package com.example.backend.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document("clientUser")
@Data
@RequiredArgsConstructor
public class ClientUser {
    @Id
    String id;

    String username;

    String password;

    String firstName;

    String lastName;

    @DBRef
    List<ShoppingList> shoppingLists;
}
