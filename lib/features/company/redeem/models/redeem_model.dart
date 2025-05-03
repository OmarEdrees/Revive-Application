class RedeemModel {
  final String id;
  final String name;
  final double price;
  final String company;
  final String description;
  RedeemModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.company,
      required this.description});

  factory RedeemModel.fromJson(Map<String, dynamic> json) {
    return RedeemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'].toDouble() as double,
      company: json['company_id'] as String,
      description: json['description'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'company_id': company,
      'description': description,
    };
  }
}
