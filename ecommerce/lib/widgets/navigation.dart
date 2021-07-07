import 'package:ecommerce/Pages/Cart.dart';
import 'package:ecommerce/Pages/HomePage.dart';
import 'package:ecommerce/Pages/Profile.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  // const NavBar({ Key? key }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  var _PageData = [HomePage(), Cart(), Profile()];
  List<IconData> _iconList = [Icons.home, Icons.shopping_cart, Icons.person];
  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];
    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildContainer(_iconList[i], i));
    }
    return Container(
      height: 60,
      width: 12,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _navBarItemList,
      ),
    );
  }

  Widget buildContainer(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _PageData[index]));
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: _selectedIndex == index
              ? [
                  BoxShadow(
                      color: Color(0xff171F53), blurRadius: 5, spreadRadius: 2)
                ]
              : [],
        ),
        height: 50,
        width: 50,
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
