class NotifModel {
  int id;
  String email;
  String noOrder;
  String contentNotification;
  int statusNotification;
  int paymentStatusId;
  DateTime createdAt;
  DateTime updatedAt;

  NotifModel(
      {this.id,
      this.email,
      this.noOrder,
      this.contentNotification,
      this.statusNotification,
      this.paymentStatusId,
      this.createdAt,
      this.updatedAt});

  NotifModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    noOrder = json['no_order'];
    contentNotification = json['content_notification'];
    statusNotification = json['status_notification'];
    paymentStatusId = json['payment_status_id'];
    createdAt = DateTime.parse(json["createdAt"]);
    updatedAt = DateTime.parse(json["updatedAt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "no_order": noOrder,
      "content_notification": contentNotification,
      "status_notification": statusNotification,
      "payment_status_id": paymentStatusId,
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
    };
  }
}
