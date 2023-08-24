import 'package:trauxit_test/utilities/constance/strings.dart';

class CartModel {
  List<CartData> cartData = [];
  CartModel.fromJson(Map<String, dynamic> json) {
    cartData = json['data'] != []
        ? (json['data'] as List).map((e) => CartData.fromJson(e)).toList()
        : [];
  }

  static Map<String, dynamic> fromMap({
    required dynamic cartData,
  }) {
    return {"data": cartData};
  }

  static Map<String, dynamic> toJson({
    required String shopId,
    required dynamic cartData,
  }) {
    return {
      "data": cartData,
    };
  }

  CartModel(this.cartData);
}

class CartData {
  String productId = nullValueName;
  dynamic quatity = nullValueName;
  String imageUrl = nullValueName;
  String title = nullValueName;
  String piecePrice = nullValueName;
  String finalPrice = nullValueName;
  String notes = nullValueName;

  CartData.fromJson(Map<String, dynamic> json) {
    productId = json['productId'] ?? nullValueName;
    quatity = json['quatity'] ?? nullValueName;
    imageUrl = json['imageUrl'] ?? nullValueName;
    title = json['title'] ?? nullValueName;
    piecePrice = json['piecePrice'] ?? nullValueName;
    finalPrice = json['finalPrice'] ?? nullValueName;
    notes = json['notes'] ?? nullValueName;
  }

  static Map<String, dynamic> fromMap({
    required String productId,
    required dynamic quatity,
    required String title,
    required String image,
    required String finalPrice,
    required String notes,
    required String piecePrice,
  }) {
    return {
      "productId": productId,
      "quatity": quatity,
      "title": title,
      "imageUrl": image,
      "piecePrice": piecePrice,
      "finalPrice": finalPrice,
      "notes": notes,
    };
  }

  CartData(
    this.productId,
    this.quatity,
    this.imageUrl,
    this.finalPrice,
    this.title,
    this.piecePrice,
  );
}
