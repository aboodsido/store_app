import 'package:store_app/helper/api.dart';

class GetAllCategory {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await ApiHelper()
        .get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
