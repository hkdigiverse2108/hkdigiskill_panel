class PartnersModel {
  String id;
  String image;
  String name;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;
  String? description;

  PartnersModel({
    required this.id,
    required this.image,
    required this.name,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    this.description,
  });

  factory PartnersModel.fromJson(Map<String, dynamic> json) => PartnersModel(
    id: json["_id"],
    image: json["image"],
    name: json["name"],
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "name": name,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "description": description,
  };
}
