class DeletedAccount {
  String id;
  UserId userId;
  String fullName;
  String email;
  String reason;
  int rate;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  DeletedAccount({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.email,
    required this.reason,
    required this.rate,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeletedAccount.fromJson(Map<String, dynamic> json) => DeletedAccount(
    id: json["_id"],
    userId: UserId.fromJson(json["userId"]),
    fullName: json["fullName"],
    email: json["email"],
    reason: json["reason"],
    rate: json["rate"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId.toJson(),
    "fullName": fullName,
    "email": email,
    "reason": reason,
    "rate": rate,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class UserId {
  String id;
  String fullName;

  UserId({required this.id, required this.fullName});

  factory UserId.fromJson(Map<String, dynamic> json) =>
      UserId(id: json["_id"], fullName: json["fullName"]);

  Map<String, dynamic> toJson() => {"_id": id, "fullName": fullName};
}
