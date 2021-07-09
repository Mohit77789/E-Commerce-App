import 'package:ecommerce/Pages/splash.dart';
import 'package:flutter/material.dart';
import 'Pages/Cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {Cart.routeName: (context) => Cart()},
    );
  }
}
