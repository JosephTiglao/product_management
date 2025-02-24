import 'package:flutter/material.dart';
import 'package:labwork/productList.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.index});
  int index;

  var codeCtrl = TextEditingController();
  var nameCtrl = TextEditingController();
  var priceCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (context, value, _) {
      codeCtrl.text = value.items[index].code;
      nameCtrl.text = value.items[index].name;
      priceCtrl.text = value.items[index].price;
      return Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
          actions: [
            IconButton(
                onPressed: () {
                  value.toggle(index);
                },
                icon: Icon(
                  value.items[index].isFav
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  size: 32,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: codeCtrl,
                decoration: InputDecoration(
                  label: Text("Code"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: priceCtrl,
                decoration: InputDecoration(
                  label: Text("Price"),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
