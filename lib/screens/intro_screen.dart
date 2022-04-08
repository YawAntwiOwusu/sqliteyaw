import 'dart:ui';

import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // drawer: Drawer(),
      // floatingActionButton: FloatingActionButton(onPressed: () {}),
      // // backgroundColor: Colors.amber,

      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.jpg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "The best\napp for\nyour plants",
                    style: TextStyle(
                      letterSpacing: 4.0,
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
