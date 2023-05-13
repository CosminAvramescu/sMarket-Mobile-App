import 'package:flutter/material.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var category, categoryTapped=false;

class GridCategories extends StatefulWidget {
  const GridCategories({Key? key}) : super(key: key);

  @override
  _GridCategoriesState createState() => _GridCategoriesState();
}

class _GridCategoriesState extends State<GridCategories> {
  late Future<List<dynamic>> _futureCategories;

  Future<List<dynamic>> _fetchProducts() async {
    if(shoppingList==false){
      final response = await http.get(
        Uri.parse('https://smarket-app.herokuapp.com/category/getAll'),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        throw Exception('Failed to fetch products from backend API');
      }
    }
    else{
      final response = await http.get(
        Uri.parse('https://smarket-app.herokuapp.com/shoppingList/get'),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      );
      shoppingList=false;
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        throw Exception('Failed to fetch products from backend API');
      }
    }
  }

  void _onCategoryTap(String categoryName) {
    setState(() {
      category = categoryName;

    });
  }

  @override
  void initState() {
    super.initState();
    _futureCategories = _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _fetchProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Failed to fetch categories'),
          );
        } else {
          final categories = snapshot.data!;
          return GridView.count(
            childAspectRatio: 0.80,
            crossAxisCount: 2,
            padding: const EdgeInsets.all(10),
            children: [
              for (int i = 0; i < categories!.length; i++)
                GestureDetector(
                  onTap: () {
                    _onCategoryTap(categories[i]['name']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Container(
                    padding:
                    const EdgeInsets.only(left: 15, right: 15, top: 10),
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.network(
                            "${categories![i]['imageLink']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 1),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${categories[i]['name']}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
