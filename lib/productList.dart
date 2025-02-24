import 'package:flutter/material.dart';
import 'package:labwork/product.dart';
import 'package:realm/realm.dart';

class Config {
  static Realm realmGenerate() {
    return Realm(Configuration.local([Product.schema]));
  }
}

class Products extends ChangeNotifier {
  // final List<Product> _products = [Product("12", "Ink", "12")];
  Realm realm = Config.realmGenerate();

  // RealmResults<Product> get items {
  //   var realm = Config.realmGenerate();
  //   return realm.all<Product>();
  // }

  late RealmResults<Product> _products = realm.all<Product>();

  RealmResults<Product> get items => _products;

  void add(Product p) {
    // _products.add(p);
    realm.write(() {
      realm.add(p);
    });
    notifyListeners();
  }

  void toggle(int index) {
    _products[index].isFav = !_products[index].isFav;
    notifyListeners();
  }
}

// class Product {
//   late String code;
//   late String name;
//   late String price;
//   bool isFav;

//   Product({
//     required this.code,
//     required this.name,
//     required this.price,
//     this.isFav = false,
//   });
// }
