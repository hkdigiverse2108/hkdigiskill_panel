class GetInTouchModel {
  String id;
  String name;
  String email;
  String phoneNumber;
  String subject;
  String? message;
  bool? isDeleted;
  bool? isBlocked;
  bool? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetInTouchModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.subject,
    this.message,
    this.isDeleted,
    this.isBlocked,
    this.isRead,
    this.createdAt,
    this.updatedAt,
  });

  factory GetInTouchModel.fromJson(Map<String, dynamic> json) =>
      GetInTouchModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        subject: json["subject"],
        message: json["message"],
        isDeleted: json["isDeleted"],
        isBlocked: json["isBlocked"],
        isRead: json["isRead"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phoneNumber": phoneNumber,
    "message": message,
    "subject": subject,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "isRead": isRead,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
