package com.example.backend.dto;


import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

@Data
@NoArgsConstructor
public class ProductDTO {
    @Id
    String id;

    String name;

    String price;

    String imageLink;

    String shelfType; // optional

    Integer row;

    Integer section;

    Integer shelve;
}

