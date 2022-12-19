import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:orca/utils/fetching.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class sidebar extends StatelessWidget {
  final PhantomConnect phantomConnectInstance;

  sidebar({super.key, required this.phantomConnectInstance});

  int a = 1;
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  Map imagesThumb = maping();

  @override
  Widget build(BuildContext context) {
    var walletAddrs = phantomConnectInstance.userPublicKey;
    return Drawer(
      child: Material(
        color: const Color.fromARGB(162, 63, 38, 105),
        child: ListView(
          children: <Widget>[
            buildHeader(
                // ignore: prefer_interpolation_to_compose_strings
                urlImage: ("https://avatars.dicebear.com/api/pixel-art/" +
                        walletAddrs +
                        ".png")
                    .toString(),
                walletAddress: walletAddrs),
            const Divider(color: Colors.white70),
            Container(
              padding: padding,
              child: Column(
                children: [
                  buildSideBarButton(
                    text: 'Portfolio',
                    icon: Icons.money,
                  ),
                  buildSideBarButton(
                    text: 'Wallet Balance',
                    icon: Icons.monetization_on,
                  ),
                  const Divider(color: Colors.white70),
                  const Text(
                    "Available Tokens",
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                      children: ["USDC", "SOL", "ETH", "mSOL"].map((ele) {
                    return tokenValues(symbol: ele, id: "");
                  }).toList())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String walletAddress,
  }) {
    print(urlImage);
    return InkWell(
      child: Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 15)),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  toShortAddres(address: walletAddress),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              splashColor: Colors.white12,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Icon(Icons.copy, color: Colors.white),
                ),
              ),
              onTap: () {
                Clipboard.setData(ClipboardData(text: walletAddress));
              },
            ),
          ],
        ),
      ),
    );
  }

  String toShortAddres({required String address}) {
    return "${address.substring(0, 6)}...${address.substring(address.length - 3, address.length)}";
  }

  Widget buildSideBarButton({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Color.fromARGB(255, 53, 47, 81);
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: 30,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(text, style: const TextStyle(color: color, fontSize: 17)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget tokenValues({
    required String symbol,
    required String id,
  }) {
    const color = Color.fromARGB(255, 53, 47, 81);
    const hoverColor = Colors.white70;

    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(imagesThumb[symbol].toString()))),
        ),
        Container(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                symbol,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: color),
              ),
              const Text(
                "Value",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        SizedBox(
          child: Column(
            children: const [
              Text(
                "0.1",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: color),
              ),
              Text(
                "\$" + " 0.1",
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void selectedItem(BuildContext context, int index,
      PhantomConnect phantomConnectInstance) async {
    a += 1;
    /*Navigator.pop(context);
    switch (index) {
      case 0:
        context.read<ScreenProvider>().changeScreen(Screens.home);
        break;
      case 1:
        context.read<ScreenProvider>().changeScreen(Screens.message);
        break;
      case 2:
        context.read<ScreenProvider>().changeScreen(Screens.send);
        break;
      case 3:
        context.read<ScreenProvider>().changeScreen(Screens.sign);
        break;
      case 4:
        Uri url = phantomConnectInstance.generateDisconnectUri(
            redirect: "/disconnect");
        await launchUrl(url, mode: LaunchMode.externalApplication);
        break;
      default:
        context.read<ScreenProvider>().changeScreen(Screens.home);
        break;
    }*/
  }
}
