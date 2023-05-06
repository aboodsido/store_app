class ProductModel {
  final dynamic id;
  final String title, description, category, image;
  final dynamic price;
  final RatingModel? rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.price,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      price: jsonData['price'],
      rating: jsonData['rating'] == null ? null : RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
