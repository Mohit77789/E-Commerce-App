import 'package:ecommerce/Pages/Cart.dart';
import 'package:ecommerce/Pages/HomePage.dart';
import 'package:ecommerce/Pages/Profile.dart';

import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  // const NavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  List<IconData> _iconList = [Icons.home, Icons.shopping_cart, Icons.person];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(index: selectedIndex, children: [
      HomePage(),
      Cart(),
      Profile(),
    ]);
  }

  Widget getFooter() {
    List<Widget> _navBarItemList = [];
    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(
        buildIconButton(_iconList[i], i),
      );
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

  Widget buildIconButton(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: selectedIndex == index
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
          color: index == selectedIndex ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
