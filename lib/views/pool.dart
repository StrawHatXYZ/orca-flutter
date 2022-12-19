// ignore_for_file: sort_child_properties_last

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:orca/utils/fetching.dart';
import 'package:orca/views/widgets/appbar.dart';
import 'package:orca/views/widgets/sidebar.dart';

import 'package:page_transition/page_transition.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:flutter/services.dart';

class Pool extends StatefulWidget {
  const Pool({super.key});

  @override
  State<Pool> createState() => poolState();
}

class poolState extends State<Pool> {
  final phantomConnectInstance = PhantomConnect(
    appUrl: "https://solgallery.vercel.app",
    deepLink: "dapp://phantomconnect.io",
  );
  int a = 1;
  String COIN1 = "USDC";
  String COIN2 = "SOL";
  double PRICE1 = 0.0;
  double PRICE2 = 0.0;
  double FEE1 = 0.0;
  double FEE2 = 0.0;
  double priceImpact = 0.0;
  bool isFinished = false;

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBAR(context: context, phantomConnectInstance: phantomConnectInstance),
      drawer: sidebar(phantomConnectInstance: phantomConnectInstance),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 250,
                  width: 390,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(100, 23, 1, 91),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 13),
                        alignment: Alignment.center,
                        // ignore: prefer_const_constructors, sort_child_properties_last
                        child: const Text(
                          "Pool Explorer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 199, 193, 179),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: const Text(
                              "Total Value Locked : ",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 228, 226, 221),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 66, top: 5),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: Text(
                              "\$ " + priceImpact.toString(), //Impact price
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 228, 226, 221),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50, top: 5),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: const Text(
                              "24h Volume : ",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 228, 226, 221),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 119, top: 5),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: Text(
                              "\$ " + priceImpact.toString(), //Impact price
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 228, 226, 221),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50, top: 5),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: const Text(
                              "ORCA Price : ",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 228, 226, 221),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 121, top: 10),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: Text(
                              "\$ " + priceImpact.toString(), //Impact price
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 228, 226, 221),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50, top: 10),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: const Text(
                              "Weekly Rewards :",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 228, 226, 221),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 90, top: 10),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: Text(
                              priceImpact.toString() + " orca", //Impact price
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 228, 226, 221),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Center(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        prefixIcon: const Icon(Icons.donut_small_rounded),
                        hintText: 'For eg. 10 SOL -> ETH ',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<dynamic>(
                  future:
                      getPoolData(), // a previously-obtained Future<String> or null
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [0].map((ele) {
                            return Container(
                              width: 380,
                              height: 440,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(100, 23, 1, 91),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(
                                                  255, 20, 155, 148),
                                              image: DecorationImage(
                                                  image: new NetworkImage(
                                                      "" //ele["tokenA"]["logoURI"]
                                                      ))),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 50),
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                255, 155, 99, 20),
                                            image: DecorationImage(
                                                image: new NetworkImage(
                                                    "" //ele["tokenB"]["logoURI"].to
                                                    )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: Text(
                                      snapshot.data[0]["poolId"].toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 350,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(239, 242, 242, 244),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 50),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: const Text(
                                          "Total Liquidity    : ",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 228, 226, 221),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        alignment: Alignment.topLeft,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 66, top: 5),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: Text(
                                          "\$ " +
                                              priceImpact
                                                  .toString(), //Impact price
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 228, 226, 221),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 60, top: 5),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: const Text(
                                          "24h volume      : ",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 228, 226, 221),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        alignment: Alignment.topLeft,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 64, top: 5),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: Text(
                                          "\$ " +
                                              priceImpact
                                                  .toString(), //Impact price
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 228, 226, 221),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 60, top: 5),
                                        // ignore: prefer_const_constructors,
                                        child: const Text(
                                          "APR in %           : ",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 228, 226, 221),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        alignment: Alignment.topLeft,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 64, top: 10),
                                        // ignore: prefer_const_constructors,
                                        child: Text(
                                          priceImpact.toString() +
                                              " %", //Impact price
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 228, 226, 221),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          Size.fromWidth(300)),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(15)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 84, 44, 128)),
                                    ),
                                    icon: const Icon(Icons.add, size: 24),
                                    label: const Text(
                                      "DEPOSIT ",
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ];
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(' Fetching pools *_^'),
                        ),
                      ];
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 380,
                  height: 440,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(100, 23, 1, 91),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
