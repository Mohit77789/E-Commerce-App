import 'package:ecommerce/Pages/Settings.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings())),
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 25.0, right: 16),
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5.0, 10.0),
                                color: Colors.black,
                                blurRadius: 10.0),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/profile.png"),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white12),
                          color: Colors.green,
                        ),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildTextField("Full Name", "Your Name", false),
              SizedBox(
                height: 20,
              ),
              buildTextField("E-mail", "abd@gmail.com", false),
              SizedBox(
                height: 20,
              ),
              buildTextField("Password", "*******", true),
              SizedBox(
                height: 20,
              ),
              buildTextField("Address", "Jharkhand,India", false),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    SizedBox(
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 130),
                      child: Container(
                        height: 40,
                        width: 120,
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
                                  blurRadius: 30.0),
                            ]),
                        child: Center(
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return TextField(
      enabled: false,
      obscureText: isPasswordTextField,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              )
            : null,
        contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 18),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
