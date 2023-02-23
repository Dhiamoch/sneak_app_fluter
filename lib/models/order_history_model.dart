import 'package:mobile/models/transaction_details_model.dart';

class OrderHistoryModel {
  int id;
  int userId;
  String noOrder;
  String dateOrder;
  int recipientAddressId;
  String expedition;
  String package;
  String estimation;
  int shipping;
  int grandTotal;
  int totalPay;
  int paymentStatusId;
  String proofOfPayment;
  int statusOrder;
  String noResi;
  DateTime createdAt;
  DateTime updatedAt;
  List<TransactionDetailsModel> transactionDetails;

  OrderHistoryModel(
      {this.id,
      this.userId,
      this.noOrder,
      this.dateOrder,
      this.recipientAddressId,
      this.expedition,
      this.package,
      this.estimation,
      this.shipping,
      this.grandTotal,
      this.totalPay,
      this.paymentStatusId,
      this.proofOfPayment,
      this.statusOrder,
      this.noResi,
      this.createdAt,
      this.updatedAt,
      this.transactionDetails});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    noOrder = json['no_order'];
    dateOrder = json['date_order'];
    recipientAddressId = json['recipient_address_id'];
    expedition = json['expedition'];
    package = json['package'];
    estimation = json['estimation'];
    shipping = json['shipping'];
    grandTotal = json['grand_total'];
    totalPay = json['total_pay'];
    paymentStatusId = json['payment_status_id'];
    proofOfPayment = json['proof_of_payment'];
    statusOrder = json['status_order'];
    noResi = json['no_resi'];
    createdAt = DateTime.parse(json["createdAt"]);
    updatedAt = DateTime.parse(json["updatedAt"]);
    transactionDetails = json['transaction_details']
        .map<TransactionDetailsModel>(
          (transactionDetails) =>
              TransactionDetailsModel.fromJson(transactionDetails),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'no_order': noOrder,
      'date_order': dateOrder,
      'recipient_address_id': recipientAddressId,
      'expedition': expedition,
      'package': package,
      'estimation': estimation,
      'shipping': shipping,
      'grand_total': grandTotal,
      'payment_status_id': paymentStatusId,
      'proof_of_payment': proofOfPayment,
      'status_order': statusOrder,
      'no_resi': noResi,
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
      'transaction_details': transactionDetails
          .map((transactionDetails) => transactionDetails.toJson())
          .toList(),
    };
  }
}
