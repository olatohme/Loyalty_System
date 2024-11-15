// To parse this JSON data, do
//
//     final partnerModel = partnerModelFromJson(jsonString);

import 'dart:convert';

List<PartnerModel> partnerModelFromJson(String str) => List<PartnerModel>.from(json.decode(str).map((x) => PartnerModel.fromJson(x)));

String partnerModelToJson(List<PartnerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PartnerModel {
    String fname;
    String lname;
    String email;
    dynamic phoneNumber;
    dynamic imgUrl;
    List<Offer> offer;
    List<PartnerBundle> partnerBundle;

    PartnerModel({
        required this.fname,
        required this.lname,
        required this.email,
        this.phoneNumber,
        this.imgUrl,
        required this.offer,
        required this.partnerBundle,
    });

    factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        imgUrl: json["img_url"],
        offer: List<Offer>.from(json["offer"].map((x) => Offer.fromJson(x))),
        partnerBundle: List<PartnerBundle>.from(json["PartnerBundle"].map((x) => PartnerBundle.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone_number": phoneNumber,
        "img_url": imgUrl,
        "offer": List<dynamic>.from(offer.map((x) => x.toJson())),
        "PartnerBundle": List<dynamic>.from(partnerBundle.map((x) => x.toJson())),
    };
}

class Offer {
    int id;
    String name;
    int partnerId;
    int segmentationId;
    int valueInBonus;
    int valueInGems;
    int quantity;
     dynamic imgUrl;
    DateTime? createdAt;
    DateTime? updatedAt;

    Offer({
        required this.id,
        required this.name,
        required this.partnerId,
        required this.segmentationId,
       required this.valueInBonus,
       required this.valueInGems,
        required this.quantity,
        this.imgUrl,
        this.createdAt,
        this.updatedAt,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        name: json["name"],
        partnerId: json["partner_id"],
        segmentationId: json["segmentation_id"],
        valueInBonus: json["valueInBonus"],
        valueInGems:json["valueInGems"],
        quantity: json["quantity"],
         imgUrl: json["img_url"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "partner_id": partnerId,
        "segmentation_id": segmentationId,
         "valueInBonus": valueInBonus,
       "valueInGems": valueInGems,
         "img_url": imgUrl,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

enum Name { T_SHIRT_SMALL_SIZE, HATS_FASHION }

final nameValues = EnumValues({
    "hats fashion": Name.HATS_FASHION,
    "T-Shirt small size": Name.T_SHIRT_SMALL_SIZE
});

class PartnerBundle {
    int id;
    int partnerId;
    int bundleId;
    int price;
    int goldenOffersNumber;
    int silverOffersNumber;
    int bronzeOffersNumber;
    int newOffersNumber;
    DateTime startDate;
    DateTime endDate;
    dynamic createdAt;
    dynamic updatedAt;

    PartnerBundle({
        required this.id,
        required this.partnerId,
        required this.bundleId,
        required this.price,
        required this.goldenOffersNumber,
        required this.silverOffersNumber,
        required this.bronzeOffersNumber,
        required this.newOffersNumber,
        required this.startDate,
        required this.endDate,
        this.createdAt,
        this.updatedAt,
    });

    factory PartnerBundle.fromJson(Map<String, dynamic> json) => PartnerBundle(
        id: json["id"],
        partnerId: json["partner_id"],
        bundleId: json["bundle_id"],
        price: json["price"],
        goldenOffersNumber: json["golden_offers_number"],
        silverOffersNumber: json["silver_offers_number"],
        bronzeOffersNumber: json["bronze_offers_number"],
        newOffersNumber: json["new_offers_number"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "partner_id": partnerId,
        "bundle_id": bundleId,
        "price": price,
        "golden_offers_number": goldenOffersNumber,
        "silver_offers_number": silverOffersNumber,
        "bronze_offers_number": bronzeOffersNumber,
        "new_offers_number": newOffersNumber,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
