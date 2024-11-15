// To parse this JSON data, do
//
//     final convertcashModel = convertcashModelFromJson(jsonString);

import 'dart:convert';

ConvertcashModel convertcashModelFromJson(String str) => ConvertcashModel.fromJson(json.decode(str));

String convertcashModelToJson(ConvertcashModel data) => json.encode(data.toJson());

class ConvertcashModel {
    List<G2C> g2Cs;

    ConvertcashModel({
        required this.g2Cs,
    });

    factory ConvertcashModel.fromJson(Map<String, dynamic> json) => ConvertcashModel(
        g2Cs: List<G2C>.from(json["g2cs"].map((x) => G2C.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "g2cs": List<dynamic>.from(g2Cs.map((x) => x.toJson())),
    };
}

class G2C {
    int id;
    int customerId;
    int gems;
    int cash;
    DateTime createdAt;
    DateTime updatedAt;

    G2C({
        required this.id,
        required this.customerId,
        required this.gems,
        required this.cash,
        required this.createdAt,
        required this.updatedAt,
    });

    factory G2C.fromJson(Map<String, dynamic> json) => G2C(
        id: json["id"],
        customerId: json["customer_id"],
        gems: json["gems"],
        cash: json["cash"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "gems": gems,
        "cash": cash,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
