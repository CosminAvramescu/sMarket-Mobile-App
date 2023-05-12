import 'package:flutter/material.dart';

class GridCategories extends StatefulWidget {
  const GridCategories({Key? key}) : super(key: key);

  @override
  _GridCategoriesState createState() => _GridCategoriesState();
}

class _GridCategoriesState extends State<GridCategories> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.80,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      children: [
        for (int i = 1; i <= 8; i++)
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'lib/images/apa.png',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Category Name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
