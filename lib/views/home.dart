import 'dart:async';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orca/components/screens/sign_in_message/signature_verify.dart';
import 'package:orca/components/screens/sign_transaction/send_transaction.dart';
import 'package:orca/components/screens/transaction_status.dart';
import 'package:orca/providers/wallet_state_provider.dart';
import 'package:orca/utils/fetching.dart';
import 'package:orca/utils/logger.dart';
import 'package:orca/views/splash.dart';
import 'package:orca/views/widgets/appbar.dart';
import 'package:orca/views/widgets/priceCall.dart';
import 'package:orca/views/widgets/sidebar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final phantomConnectInstance = PhantomConnect(
    appUrl: "https://solgallery.vercel.app",
    deepLink: "dapp://or.ca",
  );
  late StreamSubscription sub;

  int a = 1;
  bool isFinished = false;

  String dropdownvalue = 'Item 1';

  String first = "SOL";
  String second = "SRM";
  Map data = {};
  double input = 0;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks(context);
  }

  @override
  void dispose() {
    logger.w("Dispose");
    super.dispose();
    sub.cancel();
  }

  void _handleIncomingLinks(context) async {
    final provider = Provider.of<WalletStateProvider>(context, listen: false);
    try {
      sub = uriLinkStream.listen((Uri? link) {
        if (!mounted) return;
        Map<String, String> params = link?.queryParameters ?? {};
        logger.i("Params: $params");
        if (params.containsKey("errorCode")) {
          _showSnackBar(context,
              params["errorMessage"] ?? "Error connecting wallet", "error");
          logger.e(params["errorMessage"]);
        } else {
          switch (link?.path) {
            case '/connected':
              if (phantomConnectInstance.createSession(params)) {
                provider.updateConnection(true);
                _showSnackBar(context, "Connected to Wallet", "success");
              } else {
                _showSnackBar(context, "Error connecting to Wallet", "error");
              }
              break;
            case '/disconnect':
              setState(() {
                provider.updateConnection(false);
              });
              _showSnackBar(context, "Wallet Disconnected", "success");
              break;
            case '/signAndSendTransaction':
              var data = phantomConnectInstance.decryptPayload(
                  data: params["data"]!, nonce: params["nonce"]!);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionStatus(
                    signature: data['signature'],
                  ),
                ),
              );
              break;
            case '/signTransaction':
              var data = phantomConnectInstance.decryptPayload(
                  data: params["data"]!, nonce: params["nonce"]!);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SendTxScreen(
                    transaction: data["transaction"],
                  ),
                ),
              );
              break;
            case '/onSignMessage':
              var data = phantomConnectInstance.decryptPayload(
                  data: params["data"]!, nonce: params["nonce"]!);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignatureVerifyScreen(
                    signature: data['signature'],
                    phantomConnectInstance: phantomConnectInstance,
                  ),
                ),
              );
              break;
            default:
              logger.i('unknown');
              _showSnackBar(context, "Unknown Redirect", "error");
          }
        }
      }, onError: (err) {
        logger.e('OnError Error: $err');
      });
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      logger.e("Error occured PlatfotmException");
      return;
    }
  }

  var itemslist = tokenData();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalletStateProvider>(context, listen: true);
    bool updated = false;

    connectWallet() async {
      Uri launchUri = phantomConnectInstance.generateConnectUri(
          cluster: 'devnet', redirect: '/connected');
      logger.d(launchUri);
      await launchUrl(
        launchUri,
        mode: LaunchMode.externalApplication,
      );
    }

    return Scaffold(
      appBar: appBAR(
          context: context, phantomConnectInstance: phantomConnectInstance),
      drawer: sidebar(phantomConnectInstance: phantomConnectInstance),
      body: Stack(
        children: <Widget>[
          Container(
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
                          prefixIcon: const Icon(Icons.account_balance_rounded),
                          hintText: 'For eg. 10 SOL -> ETH ',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 40,
                    color: const Color.fromARGB(0, 0, 0, 0),
                    child: Container(
                      width: 360,
                      height: 350,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(100, 23, 1, 91),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 300,
                            margin: const EdgeInsets.only(left: 30),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: const Text(
                              "Trade",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: 350,
                                // ignore: prefer_const_constructors, sort_child_properties_last
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 20,
                                      width: 20,
                                    ),
                                    CoolDropdown(
                                      resultWidth: 170,
                                      resultBD: BoxDecoration(
                                        color:
                                            Color.fromARGB(170, 111, 109, 161),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      dropdownWidth: 200,
                                      dropdownItemPadding: EdgeInsets.all(10),
                                      dropdownBD: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(189, 34, 23, 191),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      dropdownList: itemslist,
                                      onChange: (selected) async {
                                        setState(() {
                                          var second = selected['value'];
                                        });

                                        setState(() {
                                          data = data;
                                        });
                                        //_firsController.text =
                                        //    "${input * data[first][second]}";
                                      },
                                      defaultValue: itemslist[0],
                                      dropdownItemReverse: true,
                                      gap: 5,
                                      dropdownItemGap: 0,
                                      dropdownHeight: 320,
                                      dropdownItemMainAxis:
                                          MainAxisAlignment.start,
                                      resultMainAxis: MainAxisAlignment.start,
                                      selectedItemBD: BoxDecoration(
                                        color: Color.fromARGB(188, 10, 3, 104),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(170, 111, 109, 161),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 20,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      margin: const EdgeInsets.only(left: 25),
                                      child: Center(
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          //inputFormatters: <TextInputFormatter>[
                                          //      FilteringTextInputFormatter.digitsOnly
                                          //  ], // Only numbers can be entered
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            prefixIcon: const Icon(
                                                Icons.donut_small_rounded),
                                            hintText: '0.00',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: GestureDetector(
                              onTap: () {
                                a += 1;
                                // ignore: avoid_print
                                print(a);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color.fromARGB(
                                                  100, 255, 255, 255),
                                            ),
                                            margin: const EdgeInsets.all(
                                                5), // Modify this till it fills the color properly
                                            // Color
                                          ),
                                        ),
                                        const Icon(
                                          IconData(0xf01fd,
                                              fontFamily: 'MaterialIcons'),
                                          size: 70,
                                          color: Color.fromARGB(235, 3, 68, 77),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: 350,
                                // ignore: prefer_const_constructors, sort_child_properties_last
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 20,
                                      width: 20,
                                    ),
                                    CoolDropdown(
                                      resultWidth: 170,
                                      resultBD: BoxDecoration(
                                        color:
                                            Color.fromARGB(170, 111, 109, 161),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      dropdownWidth: 200,
                                      dropdownItemPadding:
                                          const EdgeInsets.all(10),
                                      dropdownBD: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            189, 34, 23, 191),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      dropdownList: itemslist,
                                      onChange: (selected) async {
                                        setState(() {
                                          second = selected['value'];
                                        });

                                        setState(() {
                                          data = data;
                                        });
                                        //_firsController.text =
                                        //    "${input * data[first][second]}";
                                      },
                                      defaultValue: itemslist[0],
                                      dropdownItemReverse: true,
                                      gap: 5,
                                      dropdownItemGap: 0,
                                      dropdownHeight: 320,
                                      dropdownItemMainAxis:
                                          MainAxisAlignment.start,
                                      resultMainAxis: MainAxisAlignment.start,
                                      selectedItemBD: BoxDecoration(
                                        color: Color.fromARGB(188, 10, 3, 104),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(170, 111, 109, 161),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 20,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      margin: const EdgeInsets.only(left: 25),
                                      child: Center(
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          //inputFormatters: <TextInputFormatter>[
                                          //      FilteringTextInputFormatter.digitsOnly
                                          //  ], // Only numbers can be entered
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            prefixIcon: const Icon(
                                                Icons.donut_small_rounded),
                                            hintText: '0.00',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(child: !updated ? null : priceCall()),
                  Container(
                    margin: const EdgeInsets.all(35),
                    child: SwipeableButtonView(
                      buttonText: "TRADE",
                      buttontextstyle:
                          const TextStyle(fontSize: 25.0, color: Colors.black),
                      buttonColor: const Color.fromARGB(68, 0, 0, 0),
                      indicatorColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 101, 54, 244)),
                      // ignore: avoid_unnecessary_containers
                      buttonWidget: Container(
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 72, 71, 77),
                        ),
                      ),
                      activeColor: Color.fromARGB(170, 111, 109, 161),
                      isFinished: isFinished,
                      onWaitingProcess: () {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                alignment: Alignment.center,
                                type: PageTransitionType.fade,
                                child: const splashScreen()));
                        setState(
                          () {
                            isFinished = false;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              child: !provider.isConnected
                  ? Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(1, 1),
                          colors: <Color>[
                            Color.fromARGB(148, 117, 102, 102),
                            Color.fromARGB(121, 39, 41, 137),
                            Color.fromARGB(151, 33, 1, 97),
                          ], // Gradient from https://learnui.design/tools/gradient-generator.html
                        ),
                      ),
                      child: ElevatedButton.icon(
                        onPressed: connectWallet,
                        label: const Text("Connect Wallet"),
                        icon: const Icon(Icons.link),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                        ),
                      ),
                    )
                  : null),
        ],
      ),
    );
  }
}

_showSnackBar(BuildContext context, String message, String variant) {
  Color backgroundColor = Colors.blueAccent;
  if (variant == 'error') {
    backgroundColor = Colors.red.shade400;
  } else if (variant == 'success') {
    backgroundColor = Colors.green.shade500;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      backgroundColor: backgroundColor,
      content: Text(message),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
