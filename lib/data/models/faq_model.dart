import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class FaqModel {
  String id;
  String question;
  String answer;
  bool isFeatured;
  DashType type;
  bool? isDeleted;
  bool? isBlocked;
  DateTime? createdAt;
  DateTime? updatedAt;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.isFeatured,
    required this.type,
    this.isDeleted,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
  });

  FaqModel copyWith({
    String? id,
    String? question,
    String? answer,
    bool? isFeatured,
    DashType? type,
    bool? isDeleted,
    bool? isBlocked,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => FaqModel(
    id: id ?? this.id,
    question: question ?? this.question,
    answer: answer ?? this.answer,
    isFeatured: isFeatured ?? this.isFeatured,
    type: type ?? this.type,
    isDeleted: isDeleted ?? this.isDeleted,
    isBlocked: isBlocked ?? this.isBlocked,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    id: json["_id"],
    question: json["question"],
    answer: json["answer"],
    isFeatured: json["isFeatured"],
    type: json["type"] == null
        ? DashType.home
        : FaqTypeExtension.fromString(json["type"]),
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "answer": answer,
    "isFeatured": isFeatured,
    "type": type,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

extension FaqTypeExtension on DashType {
  static DashType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'course':
        return DashType.course;
      case 'workshop':
        return DashType.workshop;
      case 'home':
        return DashType.home;
      default:
        return DashType.home; // fallback
    }
  }

  String toJsonValue() => name; // converts enum → string
}
