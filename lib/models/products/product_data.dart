import 'package:trauxit_test/utilities/constance/strings.dart';

class ProductData {
  late dynamic id;
  late String title;
  late String description;
  late dynamic price;
  late dynamic discountPercentage;
  late dynamic rating;
  late dynamic stock;
  late String brand;
  late String category;
  late String thumbnail;
  late List<String> images;
  ProductData(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});
  factory ProductData.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    if (json['images'] != null && json['images'] is List) {
      for (var element in json['images']) {
        images.add(element);
      }
    } else {
      images = [];
    }
    return ProductData(
      id: json['id'] ?? nullValueName,
      title: json['title'] ?? nullValueName,
      description: json['description'] ?? nullValueName,
      price: json['price'] ?? nullValueName,
      discountPercentage: json['discountPercentage'] ?? nullValueName,
      rating: json['rating'] ?? nullValueName,
      stock: json['stock'] ?? nullValueName,
      brand: json['brand'] ?? nullValueName,
      category: json['category'] ?? nullValueName,
      thumbnail: json['thumbnail'] ?? nullValueName,
      images: images,
    );
  }

  static Map<String, dynamic> toJson() {
    return {
      "id": 1,
      "title": "iPhone 9",
      "description": "An apple mobile which is nothing like apple",
      "price": 549,
      "discountPercentage": 12.96,
      "rating": 4.69,
      "stock": 94,
      "brand": "Apple",
      "category": "smartphones",
      "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
      "images": [
        "https://i.dummyjson.com/data/products/1/1.jpg",
        "https://i.dummyjson.com/data/products/1/2.jpg",
        "https://i.dummyjson.com/data/products/1/3.jpg",
        "https://i.dummyjson.com/data/products/1/4.jpg",
        "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
      ]
    };
  }
}
