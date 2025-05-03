class UserModel {
  final String name;
  final String email;
  final String address;
  final String? image;
  final double voucher;
  UserModel(
      {required this.name,
      required this.email,
      required this.address,
      required this.voucher,
      this.image});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      image: json['image'],
      voucher: json['voucher'].toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'address': address,
        'image': image,
        'voucher': voucher
      };

  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, address: $address}';
  }
}
