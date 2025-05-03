class VoucherModel {
  final String id;
  final double voucher;
  final bool read;
  VoucherModel({required this.id, required this.voucher, required this.read});
  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      id: json['id'],
      voucher: json['voucher'].toDouble(),
      read: json['read'],
    );
  }
  toJson() => {
        'id': id,
        'voucher': voucher,
        'read': read,
      };
}
