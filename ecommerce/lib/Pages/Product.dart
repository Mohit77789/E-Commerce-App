import 'package:flutter/material.dart';
import 'package:ecommerce/constants/data_json.dart';
import 'package:ecommerce/Pages/product_details.dart';
import 'package:google_fonts/google_fonts.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int activeMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon:
                      Icon(Icons.chevron_left, color: Colors.black, size: 30)),
            ),
            centerTitle: true,
            title: Text(
              "Store",
              style: GoogleFonts.raleway(fontSize: 30, color: Colors.black),
            ),
          ),
          body: getBody(),
        ),
      ),
    );
  }

  Widget getBody() {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ListView(
        children: <Widget>[
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
                  padding: const EdgeInsets.all(12),
                  child: Card(
                      elevation: 2,
                      child: Container(
                        width: (screenWidth / 2) - 32,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(dataItems[index]['img']),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                dataItems[index]['name'],
                                style: GoogleFonts.montserrat(
                                    letterSpacing: 1.2,
                                    wordSpacing: 1.5,
                                    color: Colors.lightGreen,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0, 8.0, 16.0),
                              child: Text(
                                " Rs. " + dataItems[index]['price'].toString(),
                                style: GoogleFonts.montserrat(
                                    letterSpacing: 1.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
