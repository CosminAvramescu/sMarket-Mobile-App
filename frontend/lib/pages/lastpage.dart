import 'package:flutter/material.dart';
import 'package:frontend/pages/gridcard2.dart';
import 'package:google_fonts/google_fonts.dart';

class LastPage extends StatelessWidget {
  const LastPage({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
              right: 10.0,
              top: 10,
              bottom: 0,
            ),
            child: Image.asset(
              'lib/images/cart1.png',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
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
      ),
    );
  }
}
