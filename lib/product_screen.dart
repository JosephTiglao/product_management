import 'package:flutter/material.dart';
import 'package:labwork/addProduct_screen.dart';
import 'package:labwork/product.dart';
import 'package:labwork/productList.dart';
import 'package:labwork/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<Products>(context).init();
    return Scaffold(
      appBar: AppBar(
        title: Text("View Products"),
        actions: [
          Consumer(
              builder: (context, value, _) => Stack(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 32,
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red,
                          ),
                          child: Text(
                            "12",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AddproductScreen())),
              icon: Icon(
                Icons.add,
                size: 32,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                size: 32,
              )),
        ],
      ),
      body: Consumer<Products>(
        builder: (context, products, _) => Card(
          child: ListView.builder(
              itemCount: products.items.length,
              itemBuilder: (_, index) {
                var item = products.items[index];
                return ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductDetailsScreen(
                            index: index,
                          ))),
                  leading: IconButton(
                      onPressed: () {
                        products.toggle(index);
                      },
                      icon: Icon(products.items[index].isFav
                          ? Icons.favorite
                          : Icons.favorite_outline)),
                  title: Text(item.name),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined)),
                );
              }),
        ),
      ),
    );
  }
}
