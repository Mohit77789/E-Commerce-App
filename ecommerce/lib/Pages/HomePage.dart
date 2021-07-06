import 'package:ecommerce/Pages/Product.dart';
import 'package:ecommerce/widgets/navigation.dart';
import 'package:flutter/material.dart';

var bannerImages = [
  "assets/images/Home2.png",
  "assets/images/Home1.png",
  "assets/images/Home3.png",
  "assets/images/Home4.png",
  "assets/images/Home5.png",
  "assets/images/one.png"
];

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 71, 166, 1),
        centerTitle: true,
        title: Text(
          "Audio City",
          style: TextStyle(
              fontSize: 35, color: Colors.black, fontFamily: 'Samantha'),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: 12,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildContainer(Icons.home, isSelected: true),
            buildContainer(Icons.shopping_cart),
            buildContainer(Icons.person)
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Product())),
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BannerWidget(),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    //Downside scrolling starts here
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Image.asset(
                              "assets/images/sc1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Image.asset(
                              "assets/images/sc2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Image.asset(
                              "assets/images/sc3.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Image.asset(
                              "assets/images/sc4.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ), //
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = [];

    for (int x = 0; x < bannerImages.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  bannerImages[x],
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Container(
      width: screenWidth,
      height: 370,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
