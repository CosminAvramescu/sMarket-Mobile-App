import 'package:flutter/material.dart';
import 'package:frontend/pages/categories_page.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        title: const Text(''),
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
          //logo
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

          // we deliver groceries at your doorstep

          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 0,
                bottom: 12,
              ),
              child: Text(
                'Shop quicker,\n      and smarter',
                textAlign: TextAlign.center,
                style: GoogleFonts.abrilFatface(
                  fontSize: 43,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 10,
              bottom: 0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad .',
              textAlign: TextAlign.justify,
              style: GoogleFonts.montserrat(
                fontSize: 15,
              ),
            ),
          ),

          const Spacer(),

          // get started button
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoriesPage()),
            ),
            child: Container(
              padding:
                  const EdgeInsets.only(bottom: 3, top: 3, left: 40, right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 37, 30, 60),
              ),
              child: Text(
                'Start shopping',
                textAlign: TextAlign.center,
                style: GoogleFonts.abrilFatface(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const Spacer(),

          ///
          ///
        ],
      ),
    );
  }
}
