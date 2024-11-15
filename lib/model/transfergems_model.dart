// To parse this JSON data, do
//
//     final transferGemsModel = transferGemsModelFromJson(jsonString);

import 'dart:convert';

TransferGemsModel transferGemsModelFromJson(String str) => TransferGemsModel.fromJson(json.decode(str));

String transferGemsModelToJson(TransferGemsModel data) => json.encode(data.toJson());

class GemsTransfer {
    int id;
    int senderUserId;
    int receiverUserId;
    String type;
    int value;
    DateTime createdAt;
    DateTime updatedAt;
    TransferGemsModel senderUser;
    TransferGemsModel receiverUser;

    GemsTransfer({
        required this.id,
        required this.senderUserId,
        required this.receiverUserId,
        required this.type,
        required this.value,
        required this.createdAt,
        required this.updatedAt,
        required this.senderUser,
        required this.receiverUser,
    });

    factory GemsTransfer.fromJson(Map<String, dynamic> json) => GemsTransfer(
        id: json["id"],
        senderUserId: json["sender_user_id"],
        receiverUserId: json["receiver_user_id"],
        type: json["type"],
        value: json["value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        senderUser: TransferGemsModel.fromJson(json["sender_user"]),
        receiverUser: TransferGemsModel.fromJson(json["receiver_user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sender_user_id": senderUserId,
        "receiver_user_id": receiverUserId,
        "type": type,
        "value": value,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sender_user": senderUser.toJson(),
        "receiver_user": receiverUser.toJson(),
    };
}

class TransferGemsModel {
    int id;
    String fname;
    String lname;
    int roleId;
    String email;
    String? phoneNumber;
    String imgUrl;
    dynamic emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<GemsTransfer>? gemsTransferSender;
    List<GemsTransfer>? gemsTransferReceiver;

    TransferGemsModel({
        required this.id,
        required this.fname,
        required this.lname,
        required this.roleId,
        required this.email,
        this.phoneNumber,
        required this.imgUrl,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.gemsTransferSender,
        this.gemsTransferReceiver,
    });

    factory TransferGemsModel.fromJson(Map<String, dynamic> json) => TransferGemsModel(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        roleId: json["role_id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        imgUrl: json["img_url"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        gemsTransferSender: json["gems_transfer_sender"] == null ? [] : List<GemsTransfer>.from(json["gems_transfer_sender"]!.map((x) => GemsTransfer.fromJson(x))),
        gemsTransferReceiver: json["gems_transfer_receiver"] == null ? [] : List<GemsTransfer>.from(json["gems_transfer_receiver"]!.map((x) => GemsTransfer.fromJson(x))),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "gems_transfer_sender": gemsTransferSender == null ? [] : List<dynamic>.from(gemsTransferSender!.map((x) => x.toJson())),
        "gems_transfer_receiver": gemsTransferReceiver == null ? [] : List<dynamic>.from(gemsTransferReceiver!.map((x) => x.toJson())),
    };
}
