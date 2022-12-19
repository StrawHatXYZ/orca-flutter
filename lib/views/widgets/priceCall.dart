import 'package:flutter/cupertino.dart';

Widget priceCall() {
  String COIN1 = "USDC";
  String COIN2 = "SOL";
  double PRICE1 = 0.0;
  double PRICE2 = 0.0;
  double FEE1 = 0.0;
  double FEE2 = 0.0;
  double priceImpact = 0.0;

  return Column(
    children: <Widget>[
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 60,
        width: 370,
        decoration: const BoxDecoration(
          color: Color.fromARGB(100, 23, 1, 91),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(25.0),
            bottomLeft: Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 30, top: 5),
              // ignore: prefer_const_constructors, sort_child_properties_last
              child: const Text(
                "Route:",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 199, 193, 179),
                  decoration: TextDecoration.underline,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 5),
              // ignore: prefer_const_constructors, sort_child_properties_last
              child: const Text(
                "Route:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 270,
        width: 370,
        decoration: const BoxDecoration(
          color: Color.fromARGB(100, 23, 1, 91),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(25.0),
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, top: 10),
              // ignore: prefer_const_constructors, sort_child_properties_last
              child: const Text(
                "Fair Price:",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 199, 193, 179),
                  decoration: TextDecoration.underline,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: const Text(
                    "Rates :",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 228, 226, 221),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                //
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 60, top: 10),
                      // ignore: prefer_const_constructors, sort_child_properties_last
                      child: Text(
                        PRICE1.toString() + " " + COIN1 + " per " + COIN2,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 228, 226, 221),
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 60, top: 5),
                      // ignore: prefer_const_constructors, sort_child_properties_last
                      child: Text(
                        PRICE2.toString() + " " + COIN2 + " per " + COIN1,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 228, 226, 221),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: const Text(
                    "Price Impact :",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 228, 226, 221),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 100, top: 10),
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: Text(
                    priceImpact.toString(), //Impact price
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
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: const Text(
                    "Minimum \nReceived :",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 228, 226, 221),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 70, top: 10),
                      // ignore: prefer_const_constructors, sort_child_properties_last
                      child: Text(
                        "At least " + PRICE1.toString() + "000 " + COIN2,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 228, 226, 221),
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 70, top: 5),
                      // ignore: prefer_const_constructors, sort_child_properties_last
                      child: Text(
                        "Slippage tolerance: 1.0%",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 228, 226, 221),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: const Text(
                    "Trade Fees :",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 228, 226, 221),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      // ignore: prefer_const_constructors, sort_child_properties_last
                      child: Text(
                        FEE1.toString() +
                            "000 " +
                            COIN1 +
                            " + " +
                            FEE2.toString() +
                            "00 " +
                            COIN2,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 228, 226, 221),
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 5),
                      // ignore: prefer_const_constructors, sort_child_properties_last
                      child: Text(
                        "FEE PRICE CalCULATION OUTPRINT",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 228, 226, 221),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ],
  );
}
