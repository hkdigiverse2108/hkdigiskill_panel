class SettingModel {
  SocialMediaLinks? socialMediaLinks;
  String id;
  bool isDeleted;
  String? address;
  int? classCompleted;
  DateTime createdAt;
  String? email;
  int? enrolledLearners;
  String? link;
  String logo;
  String? phoneNumber;
  String? razorpayKey;
  String? razorpaySecret;
  int? satisfactionRate;
  DateTime updatedAt;

  SettingModel({
    this.socialMediaLinks,
    required this.id,
    required this.isDeleted,
    this.address,
    this.classCompleted,
    required this.createdAt,
    this.email,
    this.enrolledLearners,
    this.link,
    required this.logo,
    this.phoneNumber,
    this.razorpayKey,
    this.razorpaySecret,
    this.satisfactionRate,
    required this.updatedAt,
  });

  static SettingModel empty() => SettingModel(
    id: '',
    isDeleted: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    logo: '',
  );

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
    socialMediaLinks: SocialMediaLinks.fromJson(json["socialMediaLinks"]),
    id: json["_id"],
    isDeleted: json["isDeleted"],
    address: json["address"],
    classCompleted: json["classCompleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    email: json["email"],
    enrolledLearners: json["enrolledLearners"],
    link: json["link"],
    logo: json["logo"],
    phoneNumber: json["phoneNumber"],
    razorpayKey: json["razorpayKey"],
    razorpaySecret: json["razorpaySecret"],
    satisfactionRate: json["satisfactionRate"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "socialMediaLinks": socialMediaLinks!.toJson(),
    "_id": id,
    "isDeleted": isDeleted,
    "address": address,
    "classCompleted": classCompleted,
    "createdAt": createdAt.toIso8601String(),
    "email": email,
    "enrolledLearners": enrolledLearners,
    "link": link,
    "logo": logo,
    "phoneNumber": phoneNumber,
    "razorpayKey": razorpayKey,
    "razorpaySecret": razorpaySecret,
    "satisfactionRate": satisfactionRate,
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class SocialMediaLinks {
  String? facebook;
  String? twitter;
  String? instagram;
  String? linkedin;

  SocialMediaLinks({
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
  });

  factory SocialMediaLinks.fromJson(Map<String, dynamic> json) =>
      SocialMediaLinks(
        facebook: json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        linkedin: json["linkedin"],
      );

  Map<String, dynamic> toJson() => {
    "facebook": facebook,
    "twitter": twitter,
    "instagram": instagram,
    "linkedin": linkedin,
  };
}
