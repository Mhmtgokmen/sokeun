import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String jsonString = '''
    {
      "status": true,
      "message": "Login successfully",
      "data": {
        "id": 95,
        "admin_user_id": 1,
        "admin_user_roles_id": null,
        "admin_user_levels_id": null,
        "username": null,
        "firstname": null,
        "lastname": null,
        "phone": "5351234567",
        "email": null,
        "certificate_number": null,
        "citizen_number": null,
        "gender": null,
        "birthday": null,
        "points": 0,
        "team": null,
        "pants_size": null,
        "shirt_size": null,
        "contact_number": null,
        "born_city_id": null,
        "document_name": null,
        "document_number": null,
        "company_name": null,
        "tax": null,
        "tax_number": null,
        "nation": null,
        "address": null,
        "shipping_address": null,
        "province_id": null,
        "district_id": null,
        "postal_code": null,
        "delivery_address": null,
        "is_address_equal_to_delivery": null,
        "sms_code": null,
        "email_verified_at": null,
        "is_confirmed": 0,
        "register_state": 1,
        "status": 1,
        "is_blocked": 0,
        "where_know": null,
        "created_at": "2023-11-06T14:42:26.000000Z",
        "updated_at": "2023-11-06T14:42:26.000000Z",
        "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YThiZDRjYi0zOTgxLTQwMjUtYTA3MC1lM2JmOGY0OTZlYjQiLCJqdGkiOiIwOTRlOTIyNWQ4NGQ2NDY2MmUwNjJhZDAwZTlmNzUxZDgzZmE2OGD83wtOw"
      }
    }
  ''';

class UserData {
  int id;
  int adminUserId;
  int? adminUserRolesId;
  int? adminUserLevelsId;
  String? username;
  String? firstname;
  String? lastname;
  String phone;
  String? email;
  String? certificateNumber;
  String? citizenNumber;
  String? gender;
  String? birthday;
  int points;
  String? team;
  String? pantsSize;
  String? shirtSize;
  String? contactNumber;
  int? bornCityId;
  String? documentName;
  String? documentNumber;
  String? companyName;
  String? tax;
  String? taxNumber;
  String? nation;
  String? address;
  String? shippingAddress;
  int? provinceId;
  int? districtId;
  String? postalCode;
  String? deliveryAddress;
  String? deliveryProvinceId;
  String? deliveryDistrictId;
  bool? isAddressEqualToDelivery;
  String? smsCode;
  String? emailVerifiedAt;
  int isConfirmed;
  int registerState;
  int status;
  int isBlocked;
  String? whereKnow;
  String createdAt;
  String updatedAt;
  String accessToken;

  UserData({
    required this.id,
    required this.adminUserId,
    this.adminUserRolesId,
    this.adminUserLevelsId,
    this.username,
    this.firstname,
    this.lastname,
    required this.phone,
    this.email,
    this.certificateNumber,
    this.citizenNumber,
    this.gender,
    this.birthday,
    required this.points,
    this.team,
    this.pantsSize,
    this.shirtSize,
    this.contactNumber,
    this.bornCityId,
    this.documentName,
    this.documentNumber,
    this.companyName,
    this.tax,
    this.taxNumber,
    this.nation,
    this.address,
    this.shippingAddress,
    this.provinceId,
    this.districtId,
    this.postalCode,
    this.deliveryAddress,
    this.deliveryProvinceId,
    this.deliveryDistrictId,
    this.isAddressEqualToDelivery,
    this.smsCode,
    this.emailVerifiedAt,
    required this.isConfirmed,
    required this.registerState,
    required this.status,
    required this.isBlocked,
    this.whereKnow,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      adminUserId: json['admin_user_id'],
      adminUserRolesId: json['admin_user_roles_id'],
      adminUserLevelsId: json['admin_user_levels_id'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'] ?? "", // Phone alanı null kontrolü eklenmiş.
      email: json['email'],
      certificateNumber: json['certificate_number'],
      citizenNumber: json['citizen_number'],
      gender: json['gender'].toString(),
      birthday: json['birthday'],
      points: json['points'] ?? 0,
      team: json['team'],
      pantsSize: json['pants_size'],
      shirtSize: json['shirt_size'],
      contactNumber: json['contact_number'],
      bornCityId: json['born_city_id'],
      documentName: json['document_name'],
      documentNumber: json['document_number'],
      companyName: json['company_name'],
      tax: json['tax'],
      taxNumber: json['tax_number'],
      nation: json['nation'],
      address: json['address'],
      shippingAddress: json['shipping_address'],
      provinceId: json['province_id'],
      districtId: json['district_id'],
      postalCode: json['postal_code'],
      deliveryAddress: json['delivery_address'],
      deliveryProvinceId: json['delivery_province_id'].toString(),
      deliveryDistrictId: json['delivery_district_id'].toString(),
      isAddressEqualToDelivery:
          json['is_address_equal_to_delivery'] == 1 ? true : false,
      smsCode: json['sms_code'],
      emailVerifiedAt: json['email_verified_at'],
      isConfirmed: json['is_confirmed'] ?? 0,
      registerState: json['register_state'] ?? 0,
      status: json['status'] ?? 0,
      isBlocked: json['is_blocked'] ?? 0,
      whereKnow: json['where_know'],
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      accessToken: json['access_token'] ?? "",
    );
  }
}

class LoginResponse {
  bool status;
  String message;
  UserData data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

final loginResponseProvider = FutureProvider<LoginResponse>((ref) async {
  await Future.delayed(Duration(seconds: 2)); // Simülasyon amaçlı bir gecikme
  Map<String, dynamic> jsonData = json.decode(jsonString);
  return LoginResponse.fromJson(jsonData);
});
