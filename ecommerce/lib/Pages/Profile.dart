import 'package:ecommerce/widgets/navigation.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 71, 166, 1),
        centerTitle: true,
        title: Text(
          "Audio City p",
          style: TextStyle(
              fontSize: 35, color: Colors.black, fontFamily: 'Samantha'),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
