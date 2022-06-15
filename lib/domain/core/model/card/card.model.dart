import 'dart:convert';

class CardModel {
  String transactionId;
  String shopName;
  String shopLogo;
  String paymentType;
  String timestamp;
  int amountSend;
  int amountRecieved;

  CardModel({
    required this.transactionId,
    required this.shopName,
    required this.shopLogo,
    required this.paymentType,
    required this.timestamp,
    required this.amountSend,
    required this.amountRecieved,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      transactionId: json['transaction_id'] ?? '',
      shopName: json['shop_name'] ?? '',
      shopLogo: json['shop_logo'] ?? '',
      paymentType: json['payment_type'] ?? '',
      timestamp: json['timestamp'] ?? '',
      amountSend: json['amount_send'] ?? 0,
      amountRecieved: json['amount_recieved'] ?? 0,
    );
  }
}
