package com.example.backend.service;

import com.example.backend.dto.CategoryDTO;
import com.example.backend.model.Category;
import com.example.backend.model.Product;
import com.example.backend.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public Category addCategory(Category category){
        return categoryRepository.save(category);
    }

    public List<Product> getProductsByCategoryName(String name){
        Category category=categoryRepository.getCategoryByName(name);
        return category.getProductList();
    }
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }
}
