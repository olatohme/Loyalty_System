// To parse this JSON data, do
//
//     final profileModelPartner = profileModelPartnerFromJson(jsonString);

import 'dart:convert';

ProfileModelPartner profileModelPartnerFromJson(String str) => ProfileModelPartner.fromJson(json.decode(str));

String profileModelPartnerToJson(ProfileModelPartner data) => json.encode(data.toJson());

class ProfileModelPartner {
    Partner partner;
    List<Offer> offers;
    List<PartnerBundle> partnerBundle;

    ProfileModelPartner({
        required this.partner,
        required this.offers,
        required this.partnerBundle,
    });

    factory ProfileModelPartner.fromJson(Map<String, dynamic> json) => ProfileModelPartner(
        partner: Partner.fromJson(json["partner"]),
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
        partnerBundle: List<PartnerBundle>.from(json["partner_bundle"].map((x) => PartnerBundle.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "partner": partner.toJson(),
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
        "partner_bundle": List<dynamic>.from(partnerBundle.map((x) => x.toJson())),
    };
}

class Offer {
    int id;
    String name;
    int partnerId;
    int segmentationId;
    String imgUrl;
    int valueInBonus;
    int? valueInGems;
    int quantity;
    DateTime createdAt;
    DateTime updatedAt;

    Offer({
        required this.id,
        required this.name,
        required this.partnerId,
        required this.segmentationId,
        required this.imgUrl,
        required this.valueInBonus,
        this.valueInGems,
        required this.quantity,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        name: json["name"],
        partnerId: json["partner_id"],
        segmentationId: json["segmentation_id"],
        imgUrl: json["img_url"],
        valueInBonus: json["valueInBonus"],
        valueInGems: json["valueInGems"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "partner_id": partnerId,
        "segmentation_id": segmentationId,
        "img_url": imgUrl,
        "valueInBonus": valueInBonus,
        "valueInGems": valueInGems,
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Partner {
    int id;
    int userId;
    int gems;
    int bonus;
    DateTime createdAt;
    DateTime updatedAt;
    User user;
    List<Offer> offer;
    List<PartnerBundle> partnerBundle;

    Partner({
        required this.id,
        required this.userId,
        required this.gems,
        required this.bonus,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
        required this.offer,
        required this.partnerBundle,
    });

    factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        id: json["id"],
        userId: json["user_id"],
        gems: json["gems"],
        bonus: json["bonus"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        offer: List<Offer>.from(json["offer"].map((x) => Offer.fromJson(x))),
        partnerBundle: List<PartnerBundle>.from(json["partner_bundle"].map((x) => PartnerBundle.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "gems": gems,
        "bonus": bonus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "offer": List<dynamic>.from(offer.map((x) => x.toJson())),
        "partner_bundle": List<dynamic>.from(partnerBundle.map((x) => x.toJson())),
    };
}

class PartnerBundle {
    int id;
    int partnerId;
    int bundleId;
    int status;
    int price;
    int goldenOffersNumber;
    int silverOffersNumber;
    int bronzeOffersNumber;
    int newOffersNumber;
    DateTime startDate;
    DateTime endDate;
    DateTime createdAt;
    DateTime updatedAt;

    PartnerBundle({
        required this.id,
        required this.partnerId,
        required this.bundleId,
        required this.status,
        required this.price,
        required this.goldenOffersNumber,
        required this.silverOffersNumber,
        required this.bronzeOffersNumber,
        required this.newOffersNumber,
        required this.startDate,
        required this.endDate,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PartnerBundle.fromJson(Map<String, dynamic> json) => PartnerBundle(
        id: json["id"],
        partnerId: json["partner_id"],
        bundleId: json["bundle_id"],
        status: json["status"],
        price: json["price"],
        goldenOffersNumber: json["golden_offers_number"],
        silverOffersNumber: json["silver_offers_number"],
        bronzeOffersNumber: json["bronze_offers_number"],
        newOffersNumber: json["new_offers_number"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "partner_id": partnerId,
        "bundle_id": bundleId,
        "status": status,
        "price": price,
        "golden_offers_number": goldenOffersNumber,
        "silver_offers_number": silverOffersNumber,
        "bronze_offers_number": bronzeOffersNumber,
        "new_offers_number": newOffersNumber,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
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
        this.phoneNumber,
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
