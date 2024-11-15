import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    int id;
    String fname;
    String lname;
    int roleId;
    String email;
    dynamic phoneNumber;
    dynamic emailVerifiedAt;
    dynamic createdAt;
    dynamic updatedAt;
    String token;
    String role;

    UserModel({
        required this.id,
        required this.fname,
        required this.lname,
        required this.roleId,
        required this.email,
        this.phoneNumber,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        required this.token,
        required this.role,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        roleId: json["role_id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        token: json["token"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "role_id": roleId,
        "email": email,
        "phone_number": phoneNumber,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "token": token,
        "role": role,
    };
}
