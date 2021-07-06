import 'package:flutter/material.dart';

Container buildContainer(IconData icon, {isSelected = false}) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.indigo.shade900 : Colors.white,
      shape: BoxShape.circle,
      boxShadow: isSelected
          ? [
              BoxShadow(
                  color: Colors.indigo.shade800,
                  blurRadius: 10,
                  spreadRadius: 2)
            ]
          : [],
    ),
    height: 50,
    width: 50,
    child: Icon(
      icon,
      color: isSelected ? Colors.white : Colors.black,
    ),
  );
}
