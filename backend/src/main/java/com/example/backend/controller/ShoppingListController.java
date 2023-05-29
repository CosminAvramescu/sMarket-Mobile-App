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

    boolean finalizedSave=false;

    @PostMapping("save")
    public void addShoppingList(@RequestBody List<Object> objects){
        System.out.println(objects);
        finalizedSave=false;
        List<Product> productList=new ArrayList<>();
        JSONArray jsonArray=new JSONArray(objects);
        System.out.println(jsonArray.length());
        for(int i=0;i<jsonArray.length();i++){
            System.out.println("cmz");
            productList.add(productService
                    .getProductByName((String)((JSONObject)jsonArray
                            .get(i)).get("name")));
        }
        ShoppingList shoppingList=new ShoppingList(productList);
        shoppingListService.addShoppingList(shoppingList);
        for(Product product: productList){
            if(product!=null){
                product.setShoppingList(shoppingList);
                productService.addProduct(product);
            }
        }
        finalizedSave=true;
    }

    @GetMapping("get")
    public List<ProductDTO> getShoppingList(){
        List<ShoppingList> shoppingLists;
        while((shoppingLists=shoppingListService.getShoppingList()).size()==0 || !finalizedSave){

        }
        int size=shoppingLists.size()-1;
        if(size==-1){
            size=0;
        }
        return productMapper.toListProductDTO(shoppingLists.get(size).getProductList());
    }

    @GetMapping("getP")
    public List<ProductDTO> getP(){
        List<ShoppingList> shoppingLists=shoppingListService.getShoppingList();
        int size=shoppingLists.size()-1;
        if(size==-1){
            size=0;
        }
        return productMapper.toListProductDTO(shoppingLists.get(size).getProductList());
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

