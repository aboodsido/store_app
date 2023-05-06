import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await ApiHelper()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }

    return productList;
  }
}
