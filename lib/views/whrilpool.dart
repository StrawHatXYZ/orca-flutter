// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:orca/utils/fetching.dart';
import 'package:orca/views/widgets/appbar.dart';
import 'package:orca/views/widgets/sidebar.dart';

import 'package:phantom_connect/phantom_connect.dart';

class Whrilpool extends StatefulWidget {
  const Whrilpool({super.key});

  @override
  State<Whrilpool> createState() => whrilpoolState();
}

class whrilpoolState extends State<Whrilpool> {
  final phantomConnectInstance = PhantomConnect(
    appUrl: "https://solgallery.vercel.app",
    deepLink: "dapp://phantomconnect.io",
  );
  int a = 1;
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
        appBar: appBAR(
            context: context, phantomConnectInstance: phantomConnectInstance),
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
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 250,
                  width: 360,
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
                          "Whrilpool Explorer",
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
                FutureBuilder<List>(
                  future:
                      getWhrilPoolData(), // a previously-obtained Future<String> or null
                  builder:
                      (BuildContext context, AsyncSnapshot<List> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: snapshot.data!.map((ele) {
                            return Container(
                              width: 360,
                              height: 580,
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
                                              color: const Color.fromARGB(
                                                  255, 20, 155, 148),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      ele["tokenA"]["logoURI"]
                                                          .toString()))),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 50),
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color.fromARGB(
                                                255, 155, 99, 20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    ele["tokenB"]["logoURI"]
                                                        .toString())),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      ele["tokenA"]["symbol"].toString() +
                                          " / " +
                                          ele["tokenB"]["symbol"].toString(),
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
                                        margin: const EdgeInsets.only(left: 60),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: const Text(
                                          "24H Volume     : ",
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
                                            left: 50, top: 5),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: Text(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          "\$ " +
                                              ele["volume"]["day"]
                                                  .toString()
                                                  .substring(
                                                      0,
                                                      ele["volume"]["day"]
                                                              .toString()
                                                              .indexOf(".") +
                                                          2), //Impact price
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
                                          "24h Fees           : ",
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
                                            left: 50, top: 5),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: Text(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          "\$ " +
                                              (ele["volume"]["day"] *
                                                      ele["lpFeeRate"])
                                                  .toString()
                                                  .substring(
                                                      0,
                                                      (ele["volume"]["day"] *
                                                                  ele["lpFeeRate"])
                                                              .toString()
                                                              .indexOf(".") +
                                                          2), //Impact price
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
                                          "Fee Rate            : ",
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
                                            left: 50, top: 10),
                                        // ignore: prefer_const_constructors,
                                        child: Text(
                                          ele["lpFeeRate"]
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
                                            left: 60, top: 10),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: const Text(
                                          "Liquidity            :",
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
                                            left: 55, top: 10),
                                        // ignore: prefer_const_constructors, sort_child_properties_last
                                        child: Text(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          "\$ " +
                                              (ele["tvl"]).toString().substring(
                                                  0,
                                                  (ele["tvl"])
                                                          .toString()
                                                          .indexOf(".") +
                                                      2), //Impact price
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
                                  SizedBox(
                                    height: 40,
                                    width: 350,
                                    child: Center(
                                      child: ele['reward2Apr']['day'] != 0
                                          ? Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 80,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        237, 141, 127, 62),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10.0),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      bottomLeft:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    "ORCA Rewards",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                                Container(
                                                  height: 60,
                                                  width: 80,
                                                  margin: const EdgeInsets.only(
                                                      left: 85),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        237, 94, 119, 29),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10.0),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      bottomLeft:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    "-- Rewards",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                                Container(
                                                  height: 60,
                                                  width: 80,
                                                  margin: const EdgeInsets.only(
                                                      left: 170),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        237, 153, 153, 176),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10.0),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      bottomLeft:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    "-- Rewards",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ],
                                            )
                                          : ele["reward1Apr"]["day"] == 0
                                              ? Container(
                                                  height: 50,
                                                  width: 150,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        237, 141, 127, 62),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10.0),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      bottomLeft:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: ele["reward1Apr"]
                                                              ["day"] ==
                                                          0
                                                      ? const Text(
                                                          " No Rewards",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : const Text(
                                                          "ORCA Rewards",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                  alignment: Alignment.center,
                                                )
                                              : Stack(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 50,
                                                      width: 150,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            237, 141, 127, 62),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        "ORCA Rewards",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      width: 150,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 160),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            238, 18, 18, 240),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        " -- Rewards",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                  ],
                                                ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      (ele["totalApr"]["day"] * 100)
                                              .toString()
                                              .substring(
                                                  0,
                                                  (ele["totalApr"]["day"] * 100)
                                                          .toString()
                                                          .indexOf(".") +
                                                      2)
                                              .toString() +
                                          " % APR",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    style: ButtonStyle(
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
