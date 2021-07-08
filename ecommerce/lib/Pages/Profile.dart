import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        color: Colors.white,
        width: screenWidth,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 70),
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
                child: Container(
                  height: 60,
                  child: Center(
                    child: Text(
                      "MY PROFILE",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(
                height: 60,
                color: Colors.grey.shade200,
                child: Center(
                  child: Text(
                    "FAVOURITES",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
