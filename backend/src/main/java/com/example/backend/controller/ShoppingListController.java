package com.example.backend.controller;

import com.example.backend.dto.ProductDTO;
import com.example.backend.mapper.ProductMapper;
import com.example.backend.model.Product;
import com.example.backend.model.ShoppingList;
import com.example.backend.service.ProductService;
import com.example.backend.service.ShoppingListService;
import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.*;
import org.json.JSONArray;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@RestController
@RequiredArgsConstructor
@RequestMapping("shoppingList")
@CrossOrigin(origins="*")
public class ShoppingListController {
    private final ShoppingListService shoppingListService;
    private final ProductService productService;

    private final ProductMapper productMapper;

    @PostMapping("save")
    public void addShoppingList(@RequestBody Set<Object> objects){
        System.out.println("cmz");
        List<Product> productList=new ArrayList<>();
        JSONArray jsonArray=new JSONArray(objects);
        for(int i=0;i<jsonArray.length();i++){
            productList.add(productService
                    .getProductById((String)((JSONObject)jsonArray
                            .get(i)).get("id")));
        }
        ShoppingList shoppingList=new ShoppingList(productList);
        shoppingListService.addShoppingList(shoppingList);
        for(Product product: productList){
            product.setShoppingList(shoppingList);
            productService.addProduct(product);
        }
    }

    @GetMapping("get")
    public List<ProductDTO> getShoppingList(){
        List<ShoppingList> shoppingLists=shoppingListService.getShoppingList();
        return productMapper.toListProductDTO(shoppingLists.get(shoppingLists.size()-1).getProductList());
    }

    @PutMapping("client")
    public ShoppingList setClient(@PathVariable String shoppingListId, @PathVariable String clientUserId){
        return shoppingListService.setClient(shoppingListId, clientUserId);
    }

    @PutMapping("product/{shoppingListId}/{productId}")
    public ShoppingList setProduct(@PathVariable String shoppingListId, @PathVariable String productId){
        return shoppingListService.setProduct(shoppingListId, productId);
    }
}

