class CategoryModel {
  int? status;
  String? message;
  Data? data;

  CategoryModel({this.status, this.message, this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<CourseCategoryDatum>? courseCategoryData;
  int? totalData;
  State? state;

  Data({this.courseCategoryData, this.totalData, this.state});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    courseCategoryData: json["course_category_data"] == null
        ? []
        : List<CourseCategoryDatum>.from(
            json["course_category_data"]!.map(
              (x) => CourseCategoryDatum.fromJson(x),
            ),
          ),
    totalData: json["totalData"],
    state: json["state"] == null ? null : State.fromJson(json["state"]),
  );

  Map<String, dynamic> toJson() => {
    "course_category_data": courseCategoryData == null
        ? []
        : List<dynamic>.from(courseCategoryData!.map((x) => x.toJson())),
    "totalData": totalData,
    "state": state?.toJson(),
  };
}

class CourseCategoryDatum {
  String id;
  String name;
  String? image;
  String? description;
  bool? isFeatured;
  bool? isDeleted;
  bool? isBlocked;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? courses;

  CourseCategoryDatum({
    required this.id,
    required this.name,
    this.image,
    this.description,
    this.isFeatured,
    this.isDeleted,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.courses,
  });

  factory CourseCategoryDatum.fromJson(Map<String, dynamic> json) =>
      CourseCategoryDatum(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        isFeatured: json["isFeatured"],
        isDeleted: json["isDeleted"],
        isBlocked: json["isBlocked"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        courses: json["courses"] == null
            ? []
            : List<dynamic>.from(json["courses"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "description": description,
    "isFeatured": isFeatured,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "courses": courses == null
        ? []
        : List<dynamic>.from(courses!.map((x) => x)),
  };
}

class State {
  int? page;
  int? limit;
  int? pageLimit;

  State({this.page, this.limit, this.pageLimit});

  factory State.fromJson(Map<String, dynamic> json) => State(
    page: json["page"],
    limit: json["limit"],
    pageLimit: json["page_limit"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "page_limit": pageLimit,
  };
}
