class OtpResModel {
  final String message;
  final String token;

  OtpResModel({required this.message, required this.token});

  factory OtpResModel.fromJson(Map<String, dynamic> json) {
    return OtpResModel(message: json['message'], token: json['token']);
  }
}
