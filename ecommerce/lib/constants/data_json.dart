import 'package:flutter/cupertino.dart';

class cart {
  int id = 0;
  String name;
  String img;
  String code;
  String price;

  cart(
      {required this.id,
      required this.img,
      required this.name,
      required this.code,
      required this.price});
}

List<cart> cartItems = [
  cart(
    id: 1,
    name: "Boat Airdopes",
    code: "TWS earphone 12hrs Battery backup",
    img: "assets/images/b6.png",
    price: "1799",
  ),
  cart(
    id: 2,
    name: "Basehead",
    code: "Wired earphone",
    img: "assets/images/p4.png",
    price: "599",
  ),
  cart(
    id: 3,
    name: "Boat Rockerz",
    code: "Bluetooth earphone \n12hrs Battery backup",
    img: "assets/images/p2.png",
    price: "1299",
  ),
  cart(
    id: 4,
    name: "Boat Airdopes",
    code: "Boat Airdopes",
    img: "assets/images/b5.png",
    price: "1799",
  ),
];

class product with ChangeNotifier {
  int pid = 0;
  String pname;
  String pimg;
  String pcode;
  String pprice;

  product(
      {required this.pid,
      required this.pimg,
      required this.pname,
      required this.pcode,
      required this.pprice});
}

List<product> dataItems = [
  product(
    pid: 1,
    pname: "Basehead",
    pcode: "Wired earphone\n Tanglefree",
    pimg: "assets/images/p4.png",
    pprice: "599",
  ),
  product(
    pid: 2,
    pname: "Boat Airdopes",
    pcode: "TWS earphone \n 12hrs Battery backup",
    pimg: "assets/images/boat.png",
    pprice: "1799",
  ),
  product(
    pid: 3,
    pname: "Boat Rockerz",
    pcode: "Bluetooth earphone \n12hrs Battery backup",
    pimg: "assets/images/p2.png",
    pprice: "1799",
  ),
  product(
    pid: 4,
    pname: "Headphone",
    pcode: "Wired Earphone",
    pimg: "assets/images/p3.jpg",
    pprice: "1199",
  ),
  product(
    pid: 5,
    pname: "Boat Airdopes",
    pcode: "TWS earphone \n12hrs Battery backup",
    pimg: "assets/images/b5.png",
    pprice: "1899",
  ),
  product(
    pid: 6,
    pname: "Boat Airdopes",
    pcode: "TWS earphone\n 12hrs Battery backup",
    pimg: "assets/images/b3.jpg",
    pprice: "1999",
  ),
  product(
    pid: 7,
    pname: "Boat Airdopes",
    pcode: "TWS earphone\n 12hrs Battery backup",
    pimg: "assets/images/b6.png",
    pprice: "1599",
  ),
  product(
    pid: 8,
    pname: "Boat Airdopes",
    pcode: "TWS earphone\n 12hrs Battery backup",
    pimg: "assets/images/boat.png",
    pprice: "1599",
  ),
  product(
    pid: 9,
    pname: "Boat Airdopes",
    pcode: "TWS earphone\n 12hrs Battery backup",
    pimg: "assets/images/b7.png",
    pprice: "1799",
  ),
  product(
    pid: 10,
    pname: "Boat Airdopes",
    pcode: "TWS earphone \n12hrs Battery backup",
    pimg: "assets/images/boat.png",
    pprice: "1799",
  ),
  product(
    pid: 11,
    pname: "Boat Airdopes",
    pcode: "TWS earphone \n12hrs Battery backup",
    pimg: "assets/images/boat.png",
    pprice: "1899",
  ),
  product(
    pid: 12,
    pname: "Boat Airdopes",
    pcode: "TWS earphone \n12hrs Battery backup",
    pimg: "assets/images/b4.jpeg",
    pprice: "1999",
  ),
  product(
    pid: 13,
    pname: "Boat Airdopes",
    pcode: "TWS earphone \n12hrs Battery backup",
    pimg: "assets/images/boat.png",
    pprice: "1599",
  ),
  product(
    pid: 14,
    pname: "Boat Airdopes",
    pcode: "TWS earphone \n12hrs Battery backup",
    pimg: "assets/images/b3.jpg",
    pprice: "1599",
  )
];
