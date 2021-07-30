import 'package:flutter/material.dart';
import 'package:ecommerce/pages/Cart.dart';

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
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: getBody(),
          bottomSheet: getBottom(),
        ),
      ),
    );
  }

  Widget getBottom() {
    // final cart = Provider.of<Cart>(context);
    var size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      color: Colors.grey,
      width: size.width,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: InkWell(
              onTap: () {
                // cart.addItem(widget.id, widget.name, widget.price);
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 500),
                height: 50,
                width: screenWidth - 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff303C87),
                      const Color(0xff171F53)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 0.0),
                          color: Colors.black,
                          blurRadius: 6.0),
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
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight,
      child: Column(
        children: [
          Hero(
            tag: widget.id.toString(),
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              height: screenHeight / 2,
              width: screenWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.img), fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: RawMaterialButton(
                        elevation: 2,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        constraints: BoxConstraints(minWidth: 10, maxWidth: 50),
                        child: Icon(Icons.chevron_left,
                            color: Colors.black, size: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.white60,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                    // Expanded(
                    //   flex: 3,
                    //   child: Center(
                    //     child: Text('Detail',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 22,
                    //         )),
                    //   ),
                    // ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: RawMaterialButton(
                        elevation: 2,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cart()));
                        },
                        constraints: BoxConstraints(
                          minWidth: 10,
                        ),
                        child: Icon(Icons.shopping_cart,
                            color: Colors.black, size: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.white60,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
              transform: Matrix4.translationValues(0, -30, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.grey,
              ),
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 100 * 3.5,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: screenHeight / 100 * 2.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Rs " + widget.price,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            RawMaterialButton(
                              constraints: BoxConstraints(minWidth: 0),
                              onPressed: () => {
                                if (qty > 1)
                                  {
                                    setState(() {
                                      qty = --qty;
                                    })
                                  }
                              },
                              elevation: 0,
                              child: Icon(
                                Icons.remove,
                                color: Colors.grey,
                                size: 20,
                              ),
                              fillColor: Colors.grey[200],
                              padding: EdgeInsets.all(5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(qty.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
                              constraints: BoxConstraints(minWidth: 0),
                              elevation: 0,
                              onPressed: () => {
                                setState(() {
                                  qty = ++qty;
                                })
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 20,
                              ),
                              fillColor: Colors.grey[200],
                              padding: EdgeInsets.all(5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 100 * 2,
                  ),
                  Text(widget.code,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
