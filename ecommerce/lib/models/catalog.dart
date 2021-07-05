class CatalogModel {
  static final items = [
    Item(
      id: "1",
      name: "Earphone",
      desc: "Earphone",
      price: 599,
      color: "#33505a",
      image: ("assets/images/one.png"),
    )
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final String color;
  final num price;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.color,
      required this.price,
      required this.image});
}
