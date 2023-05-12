package com.example.backend.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.ArrayList;
import java.util.List;

@Document("category")
@Data
@RequiredArgsConstructor
public class Category {
    @Id
    String id;

    String name;

    String imageLink;

    @DBRef(lazy=true)
    List<Product> productList=new ArrayList<>();

    public Category(String name, String imageLink) {
        this.name = name;
        this.imageLink = imageLink;
    }
}
