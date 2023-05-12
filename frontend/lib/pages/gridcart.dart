import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GridCart extends StatefulWidget {
  const GridCart({Key? key}) : super(key: key);

  @override
  _GridCartState createState() => _GridCartState();
}

class _GridCartState extends State<GridCart> {
  List<dynamic>? _products;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final response = await http.get(
      Uri.parse('http://localhost:8082/product/getAllProducts'),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        _products = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      throw Exception('Failed to fetch products from backend API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _products == null
        ? const Center(child: CircularProgressIndicator())
        : GridView.count(
            childAspectRatio: 0.80,
            crossAxisCount: 2,
            padding: const EdgeInsets.all(10),
            children: [
              for (int i = 0; i < _products!.length; i++)
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
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
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.network(
                            "${_products![i]['imageLink']}", fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 1),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${_products![i]['name']}",
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_products![i]['price']}",
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
            ],
          );
  }
}
