// To parse this JSON data, do
//
//     final transferPointModel = transferPointModelFromJson(jsonString);

import 'dart:convert';

TransferPointModel transferPointModelFromJson(String str) => TransferPointModel.fromJson(json.decode(str));

String transferPointModelToJson(TransferPointModel data) => json.encode(data.toJson());

class BonusTransfer {
    int id;
    int senderUserId;
    int receiverUserId;
    String type;
    int value;
    DateTime expDate;
    DateTime createdAt;
    DateTime updatedAt;
    TransferPointModel senderUser;
    TransferPointModel receiverUser;

    BonusTransfer({
        required this.id,
        required this.senderUserId,
        required this.receiverUserId,
        required this.type,
        required this.value,
        required this.expDate,
        required this.createdAt,
        required this.updatedAt,
        required this.senderUser,
        required this.receiverUser,
    });

    factory BonusTransfer.fromJson(Map<String, dynamic> json) => BonusTransfer(
        id: json["id"],
        senderUserId: json["sender_user_id"],
        receiverUserId: json["receiver_user_id"],
        type: json["type"],
        value: json["value"],
        expDate: DateTime.parse(json["exp_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        senderUser: TransferPointModel.fromJson(json["sender_user"]),
        receiverUser: TransferPointModel.fromJson(json["receiver_user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sender_user_id": senderUserId,
        "receiver_user_id": receiverUserId,
        "type": type,
        "value": value,
        "exp_date": "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sender_user": senderUser.toJson(),
        "receiver_user": receiverUser.toJson(),
    };
}

class TransferPointModel {
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
    List<BonusTransfer>? bonusTransferSender;
    List<BonusTransfer>? bonusTransferReceiver;

    TransferPointModel({
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
        this.bonusTransferSender,
        this.bonusTransferReceiver,
    });

    factory TransferPointModel.fromJson(Map<String, dynamic> json) => TransferPointModel(
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
        bonusTransferSender: json["bonus_transfer_sender"] == null ? [] : List<BonusTransfer>.from(json["bonus_transfer_sender"]!.map((x) => BonusTransfer.fromJson(x))),
        bonusTransferReceiver: json["bonus_transfer_receiver"] == null ? [] : List<BonusTransfer>.from(json["bonus_transfer_receiver"]!.map((x) => BonusTransfer.fromJson(x))),
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
        "bonus_transfer_sender": bonusTransferSender == null ? [] : List<dynamic>.from(bonusTransferSender!.map((x) => x.toJson())),
        "bonus_transfer_receiver": bonusTransferReceiver == null ? [] : List<dynamic>.from(bonusTransferReceiver!.map((x) => x.toJson())),
    };
}
