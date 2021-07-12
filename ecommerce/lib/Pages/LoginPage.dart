// import 'package:ecommerce/Pages/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Pages/Signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 280));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavBar()));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/one.png",
                fit: BoxFit.cover,
                width: 500,
                height: 300,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Welcome $name",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                        alignLabelWithHint: true,
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                        alignLabelWithHint: true,
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    // Login Button!!
                    Material(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 20 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 150),
                          height: 50.0,
                          width: changeButton ? 50.0 : 150,
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
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
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
                    SizedBox(
                      height: 30,
                    ),

                    // SignUp Button
                    SizedBox(
                      height: 50.0,
                      child: InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup())),
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
                              "Signup",
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
