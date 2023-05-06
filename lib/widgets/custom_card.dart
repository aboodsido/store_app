import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import '../pages/update_product_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: 250,
          height: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.1),
                offset: Offset(10, 10),
                spreadRadius: 0,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, UpdateProductPage.id,
                  arguments: product);
            },
            child: Card(
              elevation: 5,
              // margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 11),
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${product.price}"),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 70,
          top: -50,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.network(product.image),
          ),
        ),
      ],
    );
  }
}
