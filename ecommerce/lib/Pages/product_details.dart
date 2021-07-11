// import 'package:ecommerce/Pages/Cart.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String img;
  final String price;

  const ProductDetailPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.code,
      required this.img,
      required this.price})
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int qty = 1;
  @override
  @override
  Widget build(BuildContext context) {
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
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    var size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      width: size.width,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: InkWell(
              onTap: () {
                //  Cart.addItem(widget.id,widget.name,widget.price);
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 500),
                height: 50,
                width: screenWidth - 40,
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
                          blurRadius: 30.0),
                    ]),
                child: Center(
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 2,
              child: Hero(
                tag: widget.id.toString(),
                child: AnimatedContainer(
                  duration: Duration(microseconds: 500),
                  height: 400,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xff303C87),
                        const Color(0xff171F53)
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5.0, 15.0),
                            color: Color(0xff303C87),
                            blurRadius: 10.0),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Name :",
                    style: TextStyle(fontSize: 22, height: 1.5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      widget.name,
                      style: TextStyle(fontSize: 25, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Price :",
                    style: TextStyle(fontSize: 22, height: 1.5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      "Rs. " + widget.price,
                      style: TextStyle(fontSize: 25, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Qty :",
                    style: TextStyle(fontSize: 22, height: 1.5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (qty > 1) {
                            setState(() {
                              qty = --qty;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              border:
                                  Border.all(color: black.withOpacity(0.5))),
                          width: 25,
                          height: 25,
                          child: Icon(
                            Icons.remove,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        qty.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            qty = ++qty;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              border:
                                  Border.all(color: black.withOpacity(0.5))),
                          width: 25,
                          height: 25,
                          child: Icon(
                            Icons.add,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
