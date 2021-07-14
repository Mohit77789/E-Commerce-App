import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ecommerce/constants/data_json.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: getBody(),
        bottomNavigationBar: CheckoutCard(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: GoogleFonts.raleway(fontSize: 30, color: Colors.black),
          ),
          Text(
            "${cartItems.length} items",
            style: GoogleFonts.raleway(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white24,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: screenHeight - 276,
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(cartItems[index].id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          Icon(Icons.delete),
                        ],
                      ),
                    ),
                    child: CartCard(
                        id: cartItems[index].id,
                        name: cartItems[index].name,
                        code: cartItems[index].code,
                        img: cartItems[index].img,
                        price: cartItems[index].price),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartCard extends StatefulWidget {
  final int id;
  final String name;
  final String code;
  final String img;
  final String price;

  const CartCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.code,
      required this.img,
      required this.price})
      : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage(widget.img)),
                    ))),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.raleway(color: Colors.black, fontSize: 20),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\Rs ${widget.price}",
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total = total + int.parse(cartItems[i].price);
    }
    return Container(
      padding: EdgeInsets.all(10),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style:
                        GoogleFonts.raleway(fontSize: 20, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "\Rs " + total.toString(),
                        style: GoogleFonts.raleway(
                            fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xff303C87),
                              const Color(0xff171F53)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 0.0),
                              color: Colors.black,
                              blurRadius: 6.0),
                        ]),
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Text(
                          "Check Out",
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
