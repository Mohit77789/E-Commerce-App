import 'package:flutter/material.dart';
import 'package:ecommerce/constants/data_json.dart';
import 'package:ecommerce/Pages/product_details.dart';
import 'package:google_fonts/google_fonts.dart';

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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xff1B2150), const Color(0xff303C87)]),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: Text(
          "AudioCity",
          style: GoogleFonts.rakkas(fontSize: 40, color: Colors.white),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var screenWidth = MediaQuery.of(context).size.width;
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
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
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
                  padding: const EdgeInsets.all(12),
                  child: Card(
                      elevation: 2,
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 500),
                        // height: 50,
                        width: (screenWidth / 2) - 32,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0xff303C87),
                              const Color(0xff171F53)
                            ]),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5.0, 15.0),
                                  color: Color(0xff303C87),
                                  blurRadius: 10.0),
                            ]),
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                " Rs." + dataItems[index]['price'].toString(),
                                style: TextStyle(
                                    color: Colors.white,
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
