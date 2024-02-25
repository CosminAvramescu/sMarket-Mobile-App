import 'package:flutter/material.dart';
import 'package:frontend/pages/gridcard2.dart';
import 'package:frontend/pages/gridcart.dart';
import 'package:frontend/pages/gridcategories.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LastPage extends StatefulWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  State<LastPage> createState() => LastPageState("new");
}

List<int> imageData = [];

// Create a Uint8List from the byte array
Uint8List uint8List = Uint8List.fromList(imageData);

class LastPageState extends State<LastPage> {
  static int mapNumber = 0;

  static LastPageState? _instance;

  LastPageState._internal();

  Future<List<int>> fetchMap() async {
    if(mapNumber==0){
      await http.get(
        Uri.parse('http://127.0.0.1:5000/get_images_data'),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Content-Type': 'image/png',
          'Accept': '*/*',
        },

      );
    }
    var response = await http.get(
      Uri.parse('http://127.0.0.1:5000/get_image_data'),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Content-Type': 'image/png',
        'Accept': '*/*',
      },
    );
    return response.bodyBytes;
  }

  factory LastPageState(String caller) {
    if (caller == "button") {
      _instance ??= LastPageState._internal();
      return _instance!;
    }
    else {
      return _instance = LastPageState._internal();
    }
  }

  static void update() {
    mapNumber++;
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
          child: GestureDetector(
            onTap: () {
              // Add your onTap functionality here
              // For example, you can navigate to another screen or perform an action
              Navigator.pop(context);
            },
            child: Image.asset(
              'lib/images/logo.png',
              width: 40.0,
            ),
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
      body: FutureBuilder<List<int>>(
          future: fetchMap(),
          // Replace fetchImageData with your function that retrieves the image data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No data available'));
            } else {
              Uint8List uint8List = Uint8List.fromList(snapshot.data!);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 0.0,
                      right: 10.0,
                      top: 10,
                      bottom: 0,
                    ),
                    child: Image.memory(
                      uint8List,
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            category = "";
                            products = [];
                            favoriteProducts = [];
                            shoppingList=false;
                            Navigator.pop(context);
                          },
                          child: Text(
                            '< Back to all categories',
                            style: GoogleFonts.buenard(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFF393D50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: GridCard2())
                ],
              );
            }
          }),
    );
  }
}
