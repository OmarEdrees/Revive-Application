class CategoryProductsModel {
  final String name;
  final String image;

  CategoryProductsModel({required this.name, required this.image});

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductsModel(
      name: json['name'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
