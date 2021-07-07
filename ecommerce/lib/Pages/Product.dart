import 'package:flutter/material.dart';

import 'package:ecommerce/constants/data_json.dart';
import 'package:ecommerce/Pages/product_details.dart';

class Product extends StatefulWidget {
//  const Product({Key? key}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int activeMenu = 0;

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
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: AnimatedContainer(
              duration: Duration(microseconds: 500),
              height: 50,
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
              child: Center(
                child: Text(
                  "AIRDOPES",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Wrap(
            children: List.generate(dataItems.length, (index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(
                            id: dataItems[index]["id"].toString(),
                            name: dataItems[index]["name"],
                            code: dataItems[index]["code"],
                            img: dataItems[index]["img"],
                            price: dataItems[index]["price"].toString()),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: dataItems[index]['id'].toString(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              dataItems[index]['img']),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                dataItems[index]['code'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                " Rs." + dataItems[index]['price'].toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ));
            }),
          )
        ],
      ),
    );
  }
}
