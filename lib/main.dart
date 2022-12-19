import 'package:flutter/material.dart';
import 'package:orca/providers/screen_provider.dart';
import 'package:orca/providers/wallet_state_provider.dart';
import 'package:orca/views/home.dart';
import 'package:orca/views/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WalletStateProvider()),
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phantom Dart Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splashScreen(),
    );
  }
}
