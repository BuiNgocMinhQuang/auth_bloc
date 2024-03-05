import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int status;
  String message;
  String token;
  Data data;

  User({
    required this.status,
    required this.message,
    required this.token,
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "data": data.toJson(),
      };
}

class Data {
  int staffId;
  int staffNo;
  int userId;
  int storeId;
  String shopId;
  String staffFirstName;
  String staffLastName;
  String staffFullName;
  String staffAvatar;
  String staffEmail;
  String staffPhone;
  String password;
  dynamic frontImageCccd;
  dynamic backImageCccd;
  dynamic holdImageCccd;
  dynamic staffAddress1;
  dynamic staffAddress2;
  dynamic staffAddress3;
  dynamic staffAddress4;
  dynamic staffFullAddress;
  dynamic staffTwitter;
  dynamic staffFacebook;
  dynamic staffInstagram;
  int staffPosition;
  int staffKind;
  int activeFlg;
  int deleteFlg;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.staffId,
    required this.staffNo,
    required this.userId,
    required this.storeId,
    required this.shopId,
    required this.staffFirstName,
    required this.staffLastName,
    required this.staffFullName,
    required this.staffAvatar,
    required this.staffEmail,
    required this.staffPhone,
    required this.password,
    required this.frontImageCccd,
    required this.backImageCccd,
    required this.holdImageCccd,
    required this.staffAddress1,
    required this.staffAddress2,
    required this.staffAddress3,
    required this.staffAddress4,
    required this.staffFullAddress,
    required this.staffTwitter,
    required this.staffFacebook,
    required this.staffInstagram,
    required this.staffPosition,
    required this.staffKind,
    required this.activeFlg,
    required this.deleteFlg,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        staffId: json["staff_id"],
        staffNo: json["staff_no"],
        userId: json["user_id"],
        storeId: json["store_id"],
        shopId: json["shop_id"],
        staffFirstName: json["staff_first_name"],
        staffLastName: json["staff_last_name"],
        staffFullName: json["staff_full_name"],
        staffAvatar: json["staff_avatar"],
        staffEmail: json["staff_email"],
        staffPhone: json["staff_phone"],
        password: json["password"],
        frontImageCccd: json["front_image_cccd"],
        backImageCccd: json["back_image_cccd"],
        holdImageCccd: json["hold_image_cccd"],
        staffAddress1: json["staff_address_1"],
        staffAddress2: json["staff_address_2"],
        staffAddress3: json["staff_address_3"],
        staffAddress4: json["staff_address_4"],
        staffFullAddress: json["staff_full_address"],
        staffTwitter: json["staff_twitter"],
        staffFacebook: json["staff_facebook"],
        staffInstagram: json["staff_instagram"],
        staffPosition: json["staff_position"],
        staffKind: json["staff_kind"],
        activeFlg: json["active_flg"],
        deleteFlg: json["delete_flg"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "staff_id": staffId,
        "staff_no": staffNo,
        "user_id": userId,
        "store_id": storeId,
        "shop_id": shopId,
        "staff_first_name": staffFirstName,
        "staff_last_name": staffLastName,
        "staff_full_name": staffFullName,
        "staff_avatar": staffAvatar,
        "staff_email": staffEmail,
        "staff_phone": staffPhone,
        "password": password,
        "front_image_cccd": frontImageCccd,
        "back_image_cccd": backImageCccd,
        "hold_image_cccd": holdImageCccd,
        "staff_address_1": staffAddress1,
        "staff_address_2": staffAddress2,
        "staff_address_3": staffAddress3,
        "staff_address_4": staffAddress4,
        "staff_full_address": staffFullAddress,
        "staff_twitter": staffTwitter,
        "staff_facebook": staffFacebook,
        "staff_instagram": staffInstagram,
        "staff_position": staffPosition,
        "staff_kind": staffKind,
        "active_flg": activeFlg,
        "delete_flg": deleteFlg,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
