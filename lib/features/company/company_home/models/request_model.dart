class RequestModel {
  // variables
  final String id;
  final double productPrice;
  final double productQuantity;
  final String productName;
  final String categoryName;
  final String? companyId;
  final String? companyName;
  final String userName;
  final String userId;
  final String status;
  final bool completeRequest;
  // constructor
  RequestModel(
      {required this.id,
      required this.userName,
      required this.productPrice,
      required this.productQuantity,
      required this.productName,
      required this.categoryName,
      this.companyId,
      this.companyName,
      required this.status,
      required this.completeRequest,
      required this.userId});
  // from json
  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      userName: (json['user_name']),
      productPrice: (json['product_price']).toDouble(),
      productQuantity: (json['product_quantity']).toDouble(),
      productName: json['product_name'],
      categoryName: json['category_name'],
      companyId: json['company_id'],
      companyName: json['company_name'],
      userId: json['user_id'],
      completeRequest: json['complete_request'],
      status: json['status'],
    );
  }
  //to json
  toJson() => {
        'id': id,
        'product_price': productPrice,
        'product_quantity': productQuantity,
        'product_name': productName,
        'category_name': categoryName,
        'company_id': companyId,
        'company_name': companyName,
        'user_name': userName,
        'user_id': userId,
        'status': status,
        'complete_request': completeRequest
      };
  // to string
  @override
  String toString() {
    return 'RequestModel('
        'id: $id, '
        'userName: $userName, '
        'productPrice: $productPrice, '
        'productQuantity: $productQuantity, '
        'productName: $productName, '
        'categoryName: $categoryName, '
        'companyId: $companyId, '
        'companyName: $companyName, '
        'userId: $userId, '
        'status: $status, '
        'completeRequest: $completeRequest'
        ')';
  }
}
