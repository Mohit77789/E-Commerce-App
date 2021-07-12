import 'package:ecommerce/Pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "Content settings"),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())),
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
                      "LOGOUT",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
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

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Setting "),
                    Text("Setting "),
                    Text("Setting "),
                  ],
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: AnimatedContainer(
                      duration: Duration(microseconds: 500),
                      height: 30,
                      width: 100,
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
                      child: Center(
                        child: Text(
                          "CLOSE",
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
