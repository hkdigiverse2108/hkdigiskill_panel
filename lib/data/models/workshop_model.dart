class WorkshopModel {
  String id;
  String image;
  String title;
  List<dynamic> workshopCurriculum;
  List<dynamic> workshopTestimonials;
  List<dynamic> workshopFaq;
  double price;
  double mrpPrice;
  String language;
  String duration;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;
  String? subTitle;
  String? about;
  String? pdfAttach;
  String? couponCode;
  String? validFor;

  WorkshopModel({
    required this.id,
    required this.image,
    required this.title,
    required this.workshopCurriculum,
    required this.workshopTestimonials,
    required this.workshopFaq,
    required this.price,
    required this.mrpPrice,
    required this.language,
    required this.duration,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    this.subTitle,
    this.about,
    this.pdfAttach,
    this.couponCode,
    this.validFor,
  });

  factory WorkshopModel.fromJson(Map<String, dynamic> json) => WorkshopModel(
    id: json["_id"],
    image: json["image"],
    title: json["title"],
    workshopCurriculum: List<dynamic>.from(
      json["workshopCurriculum"].map((x) => x),
    ),
    workshopTestimonials: List<dynamic>.from(
      json["workshopTestimonials"].map((x) => x),
    ),
    workshopFaq: List<dynamic>.from(json["workshopFAQ"].map((x) => x)),
    price: json["price"]?.toDouble(),
    mrpPrice: json["mrpPrice"]?.toDouble(),
    language: json["language"],
    duration: json["duration"],
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    subTitle: json["subTitle"],
    about: json["about"],
    pdfAttach: json["pdfAttach"],
    couponCode: json["couponCode"],
    validFor: json["validFor"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "title": title,
    "workshopCurriculum": List<dynamic>.from(workshopCurriculum.map((x) => x)),
    "workshopTestimonials": List<dynamic>.from(
      workshopTestimonials.map((x) => x),
    ),
    "workshopFAQ": List<dynamic>.from(workshopFaq.map((x) => x)),
    "price": price,
    "mrpPrice": mrpPrice,
    "language": language,
    "duration": duration,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "subTitle": subTitle,
    "about": about,
    "pdfAttach": pdfAttach,
    "couponCode": couponCode,
    "validFor": validFor,
  };
}
