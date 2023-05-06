import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await ApiHelper().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }

    return productList;
  }
}
