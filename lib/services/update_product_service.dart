import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required dynamic price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await ApiHelper().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price.toString(),
        'description': desc,
        'image': image,
        'category': category
      },
    );

    return ProductModel.fromJson(data);
  }
}
