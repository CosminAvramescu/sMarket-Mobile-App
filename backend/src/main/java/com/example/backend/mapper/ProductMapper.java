package com.example.backend.mapper;

import com.example.backend.dto.ProductDTO;
import com.example.backend.model.Product;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ProductMapper {
    @Mapping(target = "imageLink", source = "imageLink")
    ProductDTO toProductDTO(Product product);

    @Mapping(target = "imageLink", source = "imageLink")
    List<ProductDTO> toListProductDTO(List<Product> product);
}
