import 'package:flutter/material.dart';

class GridCart extends StatefulWidget {
  const GridCart({Key? key}) : super(key: key);

  @override
  _GridCartState createState() => _GridCartState();
}

class _GridCartState extends State<GridCart> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "-50%",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                    child: Image.asset(
                      'lib/images/apa.png',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Apa minerala naturala plata Aqua Carpatica 2L",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "adshgasdgasda",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "sdasdas",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
