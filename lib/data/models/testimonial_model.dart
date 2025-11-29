class TestimonialModel {
  String id;
  String name;
  String designation;
  int rate;
  bool isFeatured;
  String type;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;
  String? image;
  String? description;

  TestimonialModel({
    required this.id,
    required this.name,
    required this.designation,
    required this.rate,
    required this.isFeatured,
    required this.type,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    this.description,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) =>
      TestimonialModel(
        id: json["_id"],
        name: json["name"],
        designation: json["designation"],
        rate: json["rate"],
        isFeatured: json["isFeatured"],
        type: json["type"],
        isDeleted: json["isDeleted"],
        isBlocked: json["isBlocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "designation": designation,
    "rate": rate,
    "isFeatured": isFeatured,
    "type": type,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "image": image,
    "description": description,
  };
}
