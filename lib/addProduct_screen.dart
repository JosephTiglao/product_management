import 'package:flutter/material.dart';
import 'package:labwork/product.dart';
import 'package:labwork/productList.dart';
import 'package:provider/provider.dart';

class AddproductScreen extends StatelessWidget {
  AddproductScreen({super.key});
  var codeCtrl = TextEditingController();
  var nameCtrl = TextEditingController();
  var priceCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
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
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (codeCtrl.text.isNotEmpty &&
                              nameCtrl.text.isNotEmpty &&
                              priceCtrl.text.isNotEmpty) {
                            Provider.of<Products>(context, listen: false).add(
                                Product(codeCtrl.text, nameCtrl.text,
                                    priceCtrl.text));
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Add"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
