// To parse this JSON data, do
//
//     final myoffersModel = myoffersModelFromJson(jsonString);

import 'dart:convert';

List<MyoffersModel> myoffersModelFromJson(String str) => List<MyoffersModel>.from(json.decode(str).map((x) => MyoffersModel.fromJson(x)));

String myoffersModelToJson(List<MyoffersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyoffersModel {
    int id;
    String name;
    int partnerId;
    int segmentationId;
    String imgUrl;
    int valueInBonus;
    dynamic valueInGems;
    int quantity;
    DateTime createdAt;
    DateTime updatedAt;

    MyoffersModel({
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

    factory MyoffersModel.fromJson(Map<String, dynamic> json) => MyoffersModel(
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
