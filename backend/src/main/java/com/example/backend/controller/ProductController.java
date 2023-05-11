package com.example.backend.controller;

import com.example.backend.dto.ProductDTO;
import com.example.backend.mapper.ProductMapper;
import com.example.backend.model.Product;
import com.example.backend.service.ProductService;
import com.example.backend.service.ShopService;
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
@RequestMapping("/product")
@Data
public class ProductController {
    private final ProductService productService;

    private final ShopService shopService;

    private final ProductMapper productMapper;

    List<ProductDTO> productList;

    @PostMapping("post")
    public Product addProduct(@RequestBody Product product) {
        return productService.addProduct(product);
    }

    @GetMapping("get/{id}")
    public ProductDTO getProductById(@PathVariable String id) {
        return productMapper.toProductDTO(productService.getProductById(id));
    }

    @PutMapping("{shopId}")
    public void setShop(@PathVariable String shopId) {
        for(Product product:productService.getAllProducts()){
            productService.setShop(product, shopId);
        }
    }

    @GetMapping("getAllProducts")
    public List<ProductDTO> getAllProducts(){
        productList=productMapper.toListProductDTO(productService.getAllProducts());
        return productList;
    }

    @GetMapping("getAllFlutter")
    public List<ProductDTO> getAllFlutter(){
        return productList;
    }

    @PostMapping(path = "excel", consumes = "multipart/form-data")
    public String excelReader(@RequestParam("file") MultipartFile excel) {
        try {
            XSSFWorkbook workbook = new XSSFWorkbook(excel.getInputStream());
            XSSFSheet sheet = workbook.getSheetAt(0);

            for (int i = 1; i < 81; i++) {
                XSSFRow row = sheet.getRow(i);
                String name, price, imageLink;
                int product_row, product_section, product_shelve;

                name = String.valueOf(row.getCell(1));
                price = String.valueOf(row.getCell(2));
                imageLink = String.valueOf(row.getCell(3));
                product_row = (int) Float.parseFloat(String.valueOf(row.getCell(4)));
                product_section = (int) Float.parseFloat(String.valueOf(row.getCell(5)));
                product_shelve = (int) Float.parseFloat(String.valueOf(row.getCell(6)));

                Product product = new Product(name, price, imageLink, "shelfType",
                        product_row, product_section, product_shelve);
                productService.addProduct(product);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "Success";
    }

}
