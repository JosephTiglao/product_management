import 'package:flutter/material.dart';
import 'package:labwork/product.dart';
import 'package:realm/realm.dart';

var config;
var realm;

// class Config {
//   Config() {
//     config = Configuration.local([Product.schema]);
//     realm = Realm(config);
//   }
// }

class Products extends ChangeNotifier {
  // final List<Product> _products = [Product("12", "Ink", "12")];

  Products() {
    config = Configuration.local([Product.schema]);
    realm = Realm(config);
  }

  late RealmResults<Product> _products;
  //   RealmResults<Product> set setItems (RealmResults<Product> item) {_products;}

  // Products ({this.config, this.realm, this.setItems(RealmResults)})

  // void init() {
  //   config = Configuration.local([Product.schema]);
  //   realm = Realm(config);
  //   _products = realm.all<Product>();
  // }

  // Product() {
  //   config = Configuration.local([Product.schema]);
  //   realm = Realm(config);
  //   _products = realm.all<Product>();
  // }

  RealmResults<Product> get items => _products;

  void add(Product p) {
    // _products.add(p);

    realm(() {
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
