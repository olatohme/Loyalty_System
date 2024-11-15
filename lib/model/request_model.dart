// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

RequestModel requestModelFromJson(String str) => RequestModel.fromJson(json.decode(str));

String requestModelToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
    User user;
    List<Request> requests;

    RequestModel({
        required this.user,
        required this.requests,
    });

    factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        user: User.fromJson(json["user"]),
        requests: List<Request>.from(json["requests"].map((x) => Request.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "requests": List<dynamic>.from(requests.map((x) => x.toJson())),
    };
}

class Request {
    int id;
    int userId;
    String details;
    int? status;
    DateTime createdAt;
    DateTime updatedAt;

    Request({
        required this.id,
        required this.userId,
        required this.details,
        this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        userId: json["user_id"],
        details: json["details"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "details": details,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class User {
    int id;
    String fname;
    String lname;
    int roleId;
    String email;
    dynamic phoneNumber;
    dynamic imgUrl;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.fname,
        required this.lname,
        required this.roleId,
        required this.email,
        this.phoneNumber,
        this.imgUrl,
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
