class GetInTouchModel {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String subject;
  final String message;

  GetInTouchModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.subject,
    required this.message,
  });

  factory GetInTouchModel.fromJson(Map<String, dynamic> json) {
    return GetInTouchModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      subject: json['subject'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'subject': subject,
      'message': message,
    };
  }

  GetInTouchModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? subject,
    String? message,
  }) {
    return GetInTouchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      subject: subject ?? this.subject,
      message: message ?? this.message,
    );
  }
}
