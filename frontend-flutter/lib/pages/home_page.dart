import 'package:flutter/material.dart';
import 'package:frontend/pages/categories_page.dart';
import 'package:frontend/pages/gridcart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

bool shoppingList=false;

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController ctrl = TextEditingController();

  Future<void> _addToShoppingList() async {
    final http.Response response;
    response = await http.post(
      Uri.parse('http://localhost:8082/shoppingList/save'),
      body: jsonEncode(favoriteProducts.map((product) => product.toMap()).toList()),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
    );
    print(response);
  }

  void _getProductsSearched(String name) async {
    var response = await http.get(
      Uri.parse('http://localhost:8082/product/search/${name}'),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
    );
    //GridCartState("singleton").update(jsonDecode(response.body) as List<dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "s'Market",
                style: TextStyle(
                  fontFamily: "Katibeh",
                  fontWeight: FontWeight.w600,
                  fontSize: 48,
                  height: 1,
                  color: Color(0xFF6979B2),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'lib/images/logo.png', // Replace with your logo image path
            width: 40.0,
          ),
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 88,
            child: Stack(
              children: [
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 278 / 2,
                  top: 20,
                  child: Container(
                    width: 278,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: ctrl,
                              decoration: InputDecoration(
                                hintText: 'Search product here...',
                                hintStyle: GoogleFonts.buenard(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF393D50),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("here categories");
                            //_getProductsSearched(ctrl.text);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    //GridCartState("singleton").update([]);
                    Navigator.pop(context);
                  } ,
                  child: Text(
                    '< Back to all categories',
                    style: GoogleFonts.buenard(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: const Color(0xFF393D50),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    shoppingList=true;
                    _addToShoppingList();
                    //GridCartState("singleton").update([]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesPage()),
                    );
                  },
                  child: Text(
                    'Go to cart >',
                    style: GoogleFonts.buenard(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: const Color(0xFF393D50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: GridCart())
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Slide Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Option 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Option 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}