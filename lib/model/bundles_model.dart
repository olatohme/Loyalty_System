// To parse this JSON data, do
//
//     final bundlesModel = bundlesModelFromJson(jsonString);

import 'dart:convert';

List<BundlesModel> bundlesModelFromJson(String str) => List<BundlesModel>.from(json.decode(str).map((x) => BundlesModel.fromJson(x)));

String bundlesModelToJson(List<BundlesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BundlesModel {
    int id;
    String name;
    int price;
    int bonus;
    int gems;
    int expirationPeriod;
    int goldenOffersNumber;
    int silverOffersNumber;
    int bronzeOffersNumber;
    int newOffersNumber;
    dynamic createdAt;
    dynamic updatedAt;

    BundlesModel({
        required this.id,
        required this.name,
        required this.price,
        required this.bonus,
        required this.gems,
        required this.expirationPeriod,
        required this.goldenOffersNumber,
        required this.silverOffersNumber,
        required this.bronzeOffersNumber,
        required this.newOffersNumber,
        this.createdAt,
        this.updatedAt,
    });

    factory BundlesModel.fromJson(Map<String, dynamic> json) => BundlesModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        bonus: json["bonus"],
        gems: json["gems"],
        expirationPeriod: json["expiration_period"],
        goldenOffersNumber: json["golden_offers_number"],
        silverOffersNumber: json["silver_offers_number"],
        bronzeOffersNumber: json["bronze_offers_number"],
        newOffersNumber: json["new_offers_number"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "bonus": bonus,
        "gems": gems,
        "expiration_period": expirationPeriod,
        "golden_offers_number": goldenOffersNumber,
        "silver_offers_number": silverOffersNumber,
        "bronze_offers_number": bronzeOffersNumber,
        "new_offers_number": newOffersNumber,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
