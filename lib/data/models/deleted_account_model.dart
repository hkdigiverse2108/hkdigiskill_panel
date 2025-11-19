class DeletedAccountModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String reason;
  final int rate;

  DeletedAccountModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.reason,
    required this.rate,
  });

  factory DeletedAccountModel.fromJson(Map<String, dynamic> json) {
    return DeletedAccountModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      reason: json['reason'],
      rate: json['rate'],
    );
  }
}
