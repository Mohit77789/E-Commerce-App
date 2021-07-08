import 'package:flutter/cupertino.dart';

class CartItem {
  final String pid;
  final String pname;
  final String price;
  final int qty;

  CartItem({
    required this.pid,
    required this.pname,
    required this.price,
    required this.qty,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String id, String name, String price) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              pid: DateTime.now().toString(),
              pname: existingCartItem.pname,
              price: existingCartItem.price,
              qty: existingCartItem.qty + 1));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              pid: DateTime.now().toString(),
              pname: name,
              price: price,
              qty: 1));
    }

    notifyListeners();
  }

  void removeItems(String pid) {
    _items.remove(pid);
    notifyListeners();
  }

  void removeSingleItem(String pid) {
    if (!_items.containsKey(pid)) {
      return;
    } else {
      _items.update(
          pid,
          (existingCartItem) => CartItem(
              pid: DateTime.now().toString(),
              pname: existingCartItem.pname,
              price: existingCartItem.price,
              qty: existingCartItem.qty - 1));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
    
  }
}
