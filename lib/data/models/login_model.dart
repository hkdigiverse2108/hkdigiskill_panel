class LoginModel {
  int status;
  String message;
  Data data;
  Error error;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
    required this.error,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "error": error.toJson(),
  };
}

class Data {
  bool isEmailVerified;
  String role;
  String id;
  String email;
  String fullName;
  String token;

  Data({
    required this.isEmailVerified,
    required this.role,
    required this.id,
    required this.email,
    required this.fullName,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isEmailVerified: json["isEmailVerified"],
    role: json["role"],
    id: json["_id"],
    email: json["email"],
    fullName: json["fullName"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "isEmailVerified": isEmailVerified,
    "role": role,
    "_id": id,
    "email": email,
    "fullName": fullName,
    "token": token,
  };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}
