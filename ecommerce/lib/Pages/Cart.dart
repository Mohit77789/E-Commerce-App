import 'package:ecommerce/widgets/navigation.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  // const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: Text(
          "Audio City c",
          style: TextStyle(
              fontSize: 35,
              color: Color.fromRGBO(55, 71, 166, 1),
              fontFamily: "Samantha"),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
