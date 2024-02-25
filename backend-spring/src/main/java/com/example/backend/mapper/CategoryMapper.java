package com.example.backend.mapper;

import com.example.backend.dto.CategoryDTO;
import com.example.backend.dto.ProductDTO;
import com.example.backend.model.Category;
import com.example.backend.model.Product;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface CategoryMapper {
    @Mapping(target = "imageLink", source = "imageLink")
    CategoryDTO toCategoryDTO(Category category);

    @Mapping(target = "imageLink", source = "imageLink")
    List<CategoryDTO> toListCategoryDTO(List<Category> category);
}
