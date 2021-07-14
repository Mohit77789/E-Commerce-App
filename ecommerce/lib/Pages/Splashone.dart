import 'package:ecommerce/Pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashOne extends StatefulWidget {
  const SplashOne({Key? key}) : super(key: key);

  @override
  _SplashOneState createState() => _SplashOneState();
}

class _SplashOneState extends State<SplashOne> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        // height: screenHeight,
        // width: screenWidth,
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              child: Image.asset(
                "assets/images/Splash1.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())),
                child: Padding(
                  padding: const EdgeInsets.only(top: 700, left: 130),
                  child: AnimatedContainer(
                    duration: Duration(microseconds: 500),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xff303C87),
                              const Color(0xff171F53)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        // begins:Alignment.topCenter,

                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 0.0),
                              color: Colors.black,
                              blurRadius: 6.0),
                        ]),
                    child: Center(
                      child: Text(
                        "Login",
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
            )
          ],
        ),
      ),
    );
  }
}
