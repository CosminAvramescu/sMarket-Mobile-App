package com.example.backend.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

@Data
@NoArgsConstructor
public class ShopDTO {
    @Id
    String id;

    String brand;

    String county;

    String city;

    String street;

    String number;
}
