enum BannerType { web, app }

class BannerModel {
  String id;
  BannerType type;
  List<String>? images;
  String? link;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;
  String? title;
  String? description;

  BannerModel({
    required this.id,
    required this.type,
    required this.images,
    this.link,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    this.title,
    this.description,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["_id"],
    type: (json["type"] as String) == 'app' ? BannerType.app : BannerType.web,
    images: List<String>.from(json["images"].map((x) => x)),
    link: json["link"],
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type": type,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "link": link,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "title": title,
    "description": description,
  };
}
