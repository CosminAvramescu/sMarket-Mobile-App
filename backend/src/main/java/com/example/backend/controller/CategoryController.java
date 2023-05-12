package com.example.backend.controller;


import com.example.backend.dto.CategoryDTO;
import com.example.backend.dto.ProductDTO;
import com.example.backend.mapper.CategoryMapper;
import com.example.backend.mapper.ProductMapper;
import com.example.backend.model.Category;
import com.example.backend.model.Product;
import com.example.backend.service.CategoryService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/category")
@Data
@CrossOrigin(origins="*")
public class CategoryController {
    private final CategoryService categoryService;

    private final ProductMapper productMapper;

    private final CategoryMapper categoryMapper;


    @PostMapping(path = "excel", consumes = "multipart/form-data")
    public String excelReader(@RequestParam("file") MultipartFile excel) {
        try {
            XSSFWorkbook workbook = new XSSFWorkbook(excel.getInputStream());
            XSSFSheet sheet = workbook.getSheetAt(1);

            for (int i = 1; i < 11; i++) {
                XSSFRow row = sheet.getRow(i);
                String name, imageLink;

                name = String.valueOf(row.getCell(1));
                imageLink = String.valueOf(row.getCell(2));

                Category category = new Category(name, imageLink);
                categoryService.addCategory(category);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "Success";
    }

    @GetMapping("getByCategory/{name}")
    List<ProductDTO> getProductsByCategoryName(@PathVariable String name){
        return productMapper.toListProductDTO(categoryService.getProductsByCategoryName(name));
    }

    @GetMapping("getAll")
    List<CategoryDTO> getProductsByCategoryName(){
        return categoryMapper.toListCategoryDTO(categoryService.getAll());
    }
}
