package com.example.backend.controller;

import com.example.backend.dto.ShopDTO;
import com.example.backend.model.Product;
import com.example.backend.model.Shop;
import com.example.backend.model.ShoppingList;
import com.example.backend.service.ProductService;
import com.example.backend.service.ShopService;
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
@RequestMapping("shop")
@CrossOrigin(origins="*")
public class ShopController {
    private final ShopService shopService;
    private final ProductService productService;

    @GetMapping("get/{id}")
    public ShopDTO getShopById(@PathVariable String id){
        return shopService.getShopById(id);
    }

    @PostMapping("post")
    public Shop addShop(@RequestBody Shop shop){
        return shopService.addShop(shop);
    }

    @PutMapping("{shopId}/{productId}")
    public void setProduct(@PathVariable String shopId, @PathVariable String productId){
        shopService.setProduct(shopId, productId);
    }

    @PostMapping(path = "excel", consumes = "multipart/form-data")
    public String excelReader(@RequestParam("file") MultipartFile excel) {
        try {
            XSSFWorkbook workbook = new XSSFWorkbook(excel.getInputStream());
            XSSFSheet sheet = workbook.getSheetAt(0);

            for(int i=1; i<7;i++) {
                XSSFRow row = sheet.getRow(i);
                String name, location, imageLink;

                name=String.valueOf(row.getCell(1));
                location=String.valueOf(row.getCell(2));
                imageLink=String.valueOf(row.getCell(3));

                List<Product> productList=productService.getAllProducts();
                Shop shop=new Shop(name, location, imageLink, productList);
                shopService.addShop(shop);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "Success";
    }

    @GetMapping("all")
    public List<Shop> getAllShops(){
        return shopService.getAllShops();
    }
}
