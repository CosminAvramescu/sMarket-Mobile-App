import 'package:flutter/material.dart';
import 'package:frontend/pages/gridcategories.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GridCart extends StatefulWidget {
  const GridCart({Key? key}) : super(key: key);

  @override
  GridCartState createState() => GridCartState("gridcart");
}

class FavoriteProduct {
  String name;
  String imageLink;

  FavoriteProduct(this.name, this.imageLink);

  @override
  String toString(){
    return "$name $imageLink";
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'imageLink': imageLink,
  };
}

var all = false;
List<FavoriteProduct> favoriteProducts = [];
List<dynamic>? products;

class GridCartState extends State<GridCart> {
  static GridCartState? _instance;

  GridCartState._internal();

  factory GridCartState(String caller) {
    if (caller == "gridcart") {
      return _instance=GridCartState._internal();
    } else {
      _instance ??= GridCartState._internal();
      return _instance!;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void update(List<dynamic> p){
    if(mounted){
      setState(() {
        products = p;
      });
    }
  }

  void updateFav(List<dynamic> p){
    if(mounted){
      setState(() {
        favoriteProducts = [];
      });
    }
  }

  Future<void> _fetchProducts() async {
    final response;
    if (all == false && category != null) {
      response = await http.get(
        Uri.parse('https://smarket-app.herokuapp.com/category/getByCategory/${category}'),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      );
    } else {
      response = await http.get(
        Uri.parse('https://smarket-app.herokuapp.com/product/getAllProducts'),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      );
      all = false;
    }
    if (response.statusCode == 200) {
      setState(() {
        products = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      throw Exception('Failed to fetch products from backend API');
    }
  }

  void _toggleFavoriteProduct(String name, String imageLink) {
    setState(() {
      FavoriteProduct favoriteProduct = FavoriteProduct(name, imageLink);
      for (int i = 0; i < favoriteProducts.length; i++) {
        if (favoriteProducts[i].name == name) {
          favoriteProducts.remove(favoriteProducts[i]);
          return;
        }
      }
      favoriteProducts.add(favoriteProduct);
    });
  }

  bool _isProductFavorite(String name) {
    for (int i = 0; i < favoriteProducts.length; i++) {
      if (favoriteProducts[i].name == name) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Center(child: CircularProgressIndicator())
        : GridView.count(
      childAspectRatio: 0.80,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      children: [
        for (int i = 0; i < products!.length; i++)
          GestureDetector(
            onTap: () {
              // Callback function to be executed on tap
            },
            child: Container(
              padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10),
              margin:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          _toggleFavoriteProduct(products![i]['name'],
                              products![i]['imageLink']);
                        },
                        icon: Icon(
                          _isProductFavorite(products![i]['name'])
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.network(
                        "${products![i]['imageLink']}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 1),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${products![i]['name']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${products![i]['price']}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        // add more widgets here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}