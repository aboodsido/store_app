import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
      },
    );
  }
}
