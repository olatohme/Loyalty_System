// To parse this JSON data, do
//
//     final convertGemsModel = convertGemsModelFromJson(jsonString);

import 'dart:convert';

ConvertGemsModel convertGemsModelFromJson(String str) => ConvertGemsModel.fromJson(json.decode(str));

String convertGemsModelToJson(ConvertGemsModel data) => json.encode(data.toJson());

class ConvertGemsModel {
    List<B2G> b2Gs;

    ConvertGemsModel({
        required this.b2Gs,
    });

    factory ConvertGemsModel.fromJson(Map<String, dynamic> json) => ConvertGemsModel(
        b2Gs: List<B2G>.from(json["b2gs"].map((x) => B2G.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "b2gs": List<dynamic>.from(b2Gs.map((x) => x.toJson())),
    };
}

class B2G {
    int id;
    int customerId;
    int bonus;
    int gems;
    DateTime createdAt;
    DateTime updatedAt;

    B2G({
        required this.id,
        required this.customerId,
        required this.bonus,
        required this.gems,
        required this.createdAt,
        required this.updatedAt,
    });

    factory B2G.fromJson(Map<String, dynamic> json) => B2G(
        id: json["id"],
        customerId: json["customer_id"],
        bonus: json["bonus"],
        gems: json["gems"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "bonus": bonus,
        "gems": gems,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
