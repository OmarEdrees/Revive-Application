import 'package:revive/features/customer/category_details/models/category_products_model.dart';

class CategoryModel {
  final String name;
  final String image;
  final double price;
  final List<CategoryProductsModel> products;

  CategoryModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.products});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      products: (json['products'] as List)
          .map((product) =>
              CategoryProductsModel.fromJson(product as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
