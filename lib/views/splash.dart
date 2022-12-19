// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'home.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    navHome();
  }
  navHome() async{
    await Future.delayed(const Duration(milliseconds: 1500),(){});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      /*MaterialPageRoute(
        builder: (context) => 
          const Home()
          )
      );*/
      PageTransition(
        type: PageTransitionType.fade,
        child: const Home()
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(1, 1),
                colors: <Color>[
                  Color.fromARGB(255, 117, 102, 102),
                  Color.fromARGB(255, 39, 40, 137),
                  Color.fromARGB(255, 33, 1, 97),
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
            ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: unnercessary
                SizedBox(
                  height: 150,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4),
                  child: Image.asset("images/logo.png"),
                ),
                // ignore: avoid_unnecessary_containers
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Text(
                    "ORKA",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
      )
    );
  }
}