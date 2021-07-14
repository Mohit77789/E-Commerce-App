import 'package:ecommerce/Pages/Splashone.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/slider.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Container(
                color: Colors.white,
                height: 70,
                width: screenWidth,
                child: Center(
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.raleway(
                        fontSize: 70, color: Color(0xff3949AB)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Container(
                child: Image.asset("assets/images/splash.png"),
              ),
            ),
            ConfirmationSlider(
              text: "Slide to Login",
              foregroundColor: Color(0xff3949AB),
              backgroundColor: Color(0xff3949AB),
              backgroundColorEnd: Colors.grey,
              textStyle: TextStyle(fontSize: 22, color: Colors.white),
              foregroundShape: BorderRadius.circular(10),
              backgroundShape: BorderRadius.circular(15),
              onConfirmation: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SplashOne()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
