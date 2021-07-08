import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: Text(
          "AudioCity",
          style: GoogleFonts.rakkas(
              fontSize: 40, color: Color.fromRGBO(55, 71, 166, 1)),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 130.0, top: 10),
            child: AnimatedContainer(
              duration: Duration(microseconds: 500),
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xff303C87),
                    const Color(0xff171F53)
                  ]),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5.0, 15.0),
                        color: Color(0xff303C87),
                        blurRadius: 10.0),
                  ]),
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    "Shopping Cart",
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // ListView.builder(itemBuilder: itemBuilder),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String pid;
  final String productid;
  final String price;
  final int qty;
  final String name;

  CartItem(
    this.pid,
    this.productid,
    this.name,
    this.price,
    this.qty,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: ,
        title: Text(name),
        subtitle: Text("Total:\$${(price * qty)}"),
        trailing: Text("$qty"),
      ),
    );
  }
}
