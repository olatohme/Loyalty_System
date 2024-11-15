// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int ?id;
  int userId;
  int segmentationId;
  String nickName;
  int curBonus;
  int totalBonus;
  int curGems;
  int totalGems;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  Segmentation segmentation;
  

  ProfileModel({
    required this.id,
    required this.userId,
    required this.segmentationId,
    required this.nickName,
    required this.curBonus,
    required this.totalBonus,
    required this.curGems,
    required this.totalGems,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.segmentation,
  });
// class ProfileModel {
//   int ?id;
//   int ?userId;
//   int ?segmentationId;
//   String ?nickName;
//   int ?curBonus;
//   int ?totalBonus;
//   int ?curGems;
//   int ?totalGems;
//   DateTime ?createdAt;
//   DateTime? updatedAt;
//   User? user;
//   Segmentation? segmentation;
  

//   ProfileModel({
//     this.id,
//     this.userId,
//      this.segmentationId,
//      this.nickName,
//      this.curBonus,
//     this.totalBonus,
//      this.curGems,
//     this.totalGems,
//      this.createdAt,
//    this.updatedAt,
//     this.user,
//      this.segmentation,
//   });


  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        userId: json["user_id"],
        segmentationId: json["segmentation_id"],
        nickName: json["nickName"],
        curBonus: json["cur_bonus"],
        totalBonus: json["total_bonus"],
        curGems: json["cur_gems"],
        totalGems: json["total_gems"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        segmentation: Segmentation.fromJson(json["segmentation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "segmentation_id": segmentationId,
        "nickName": nickName,
        "cur_bonus": curBonus,
        "total_bonus": totalBonus,
        "cur_gems": curGems,
        "total_gems": totalGems,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "segmentation": segmentation.toJson(),
      };
}

class Segmentation {
  int id;
  String name;
  String type;
  dynamic createdAt;
  dynamic updatedAt;

  Segmentation({
    required this.id,
    required this.name,
    required this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Segmentation.fromJson(Map<String, dynamic> json) => Segmentation(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class User {
  int id;
  String fname;
  String lname;
  int roleId;
  String email;
  String phoneNumber;
  String imgUrl;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.fname,
    required this.lname,
    required this.roleId,
    required this.email,
    required this.phoneNumber,
    required this.imgUrl,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        roleId: json["role_id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        imgUrl: json["img_url"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "role_id": roleId,
        "email": email,
        "phone_number": phoneNumber,
        "img_url": imgUrl,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
