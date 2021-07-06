import 'package:flutter/material.dart';

import 'package:ecommerce/theme/colors.dart';

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
        backgroundColor: Color.fromRGBO(55, 71, 166, 1),
        centerTitle: true,
        title: Text(
          "Audio City",
          style: TextStyle(
              fontSize: 35, color: Colors.black, fontFamily: "Samantha"),
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
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: black.withOpacity(0.5))),
                width: screenWidth / 2,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.indigo),
                    onPressed: () {},
                    child: Text(
                      "ADD TO CART",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 166,
            height: 50,
            // child: Padding(
            //   padding: const EdgeInsets.only(left: 30.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.indigo),
                onPressed: () {},
                child: Text(
                  "BUY NOW",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, top: 20),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: Align(
            //         alignment: Alignment.centerLeft,
            //         child: Icon(Icons.arrow_back_ios)),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 2,
              child: Hero(
                tag: widget.id.toString(),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover)),
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
