import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('New Trend', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: GetAllProducts().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('here');
            List<ProductModel> products = snapshot.data!;
            return GridView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.only(top: 70),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  product: products[index],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
