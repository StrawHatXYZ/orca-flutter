import 'package:flutter/material.dart';
import 'package:orca/providers/wallet_state_provider.dart';
import 'package:orca/views/home.dart';
import 'package:orca/views/pool.dart';
import 'package:orca/views/whrilpool.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:provider/provider.dart';
//import 'package:orca/screens/pool.dart';
//import 'package:orca/screens/whrilpool.dart';
//import 'package:page_transition/page_transition.dart';

//import 'package:orka/screens/home.dart';

PreferredSizeWidget appBAR(
    {required BuildContext context,
    required PhantomConnect phantomConnectInstance}) {
  final provider = Provider.of<WalletStateProvider>(context, listen: true);
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 117, 102, 102),
    shadowColor: const Color.fromARGB(255, 117, 102, 102),
    toolbarHeight: 70,
    leading: Builder(
        builder: (context) => GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 134, 145, 140),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    image: !provider.isConnected
                        ? const NetworkImage(
                            "https://avatars.dicebear.com/api/pixel-art/fuck.png")
                        : NetworkImage(
                            // ignore: prefer_interpolation_to_compose_strings
                            "https://avatars.dicebear.com/api/pixel-art/" +
                                phantomConnectInstance.userPublicKey +
                                ".png"),
                  ),
                ),
              ),
              onTap: () => Scaffold.of(context).openDrawer(),
            )),
    actions: <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 7),
        child: TextButton(
          onPressed: () async {
            // and again
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: const Home()));
          },
          child: const Text(
            "Trade",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 7),
        child: TextButton(
          onPressed: () async {
            // and again
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: const Whrilpool()));
          },
          child: const Text(
            "Whrilpools",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 10),
        child: TextButton(
          onPressed: () async {
            // and again
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: const Pool()));
          },
          child: const Text(
            "Pools",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 25),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.notifications_on),
        ),
      ),
    ],
  );
}
