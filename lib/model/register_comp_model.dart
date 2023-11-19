// To parse this JSON data, do
//
//     final registerComplateModel = registerComplateModelFromJson(jsonString);

import 'dart:convert';

RegisterComplateModel registerComplateModelFromJson(String str) => RegisterComplateModel.fromJson(json.decode(str));

String registerComplateModelToJson(RegisterComplateModel data) => json.encode(data.toJson());

class RegisterComplateModel {
    bool status;
    String message;
    Data? data;

    RegisterComplateModel({
        required this.status,
        required this.message,
        this.data,
    });

    RegisterComplateModel copyWith({
        bool? status,
        String? message,
        Data? data,
    }) => 
        RegisterComplateModel(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory RegisterComplateModel.fromJson(Map<String, dynamic> json) => RegisterComplateModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? adminUserId;
    int? adminUserRolesId;
    dynamic adminUserLevelsId;
    String? username;
    String? firstname;
    String? lastname;
    String? phone;
    String? email;
    dynamic certificateNumber;
    String? citizenNumber;
    String? gender;
    dynamic birthday;
    int? points;
    String? team;
    String? pantsSize;
    String? shirtSize;
    String? contactNumber;
    String? bornCityId;
    dynamic documentName;
    dynamic documentNumber;
    dynamic companyName;
    dynamic tax;
    dynamic taxNumber;
    String? nation;
    String? address;
    dynamic shippingAddress;
    String? provinceId;
    String? districtId;
    dynamic postalCode;
    String? deliveryAddress;
    String? deliveryProvinceId;
    String? deliveryDistrictId;
    int? isAddressEqualToDelivery;
    dynamic smsCode;
    dynamic emailVerifiedAt;
    int? isConfirmed;
    int? registerState;
    int? status;
    int? isBlocked;
    dynamic whereKnow;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.adminUserId,
        this.adminUserRolesId,
        this.adminUserLevelsId,
        this.username,
        this.firstname,
        this.lastname,
        this.phone,
        this.email,
        this.certificateNumber,
        this.citizenNumber,
        this.gender,
        this.birthday,
        this.points,
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
        this.isConfirmed,
        this.registerState,
        this.status,
        this.isBlocked,
        this.whereKnow,
        this.createdAt,
        this.updatedAt,
    });

    Data copyWith({
        int? id,
        int? adminUserId,
        int? adminUserRolesId,
        dynamic adminUserLevelsId,
        String? username,
        String? firstname,
        String? lastname,
        String? phone,
        String? email,
        dynamic certificateNumber,
        String? citizenNumber,
        String? gender,
        dynamic birthday,
        int? points,
        String? team,
        String? pantsSize,
        String? shirtSize,
        String? contactNumber,
        String? bornCityId,
        dynamic documentName,
        dynamic documentNumber,
        dynamic companyName,
        dynamic tax,
        dynamic taxNumber,
        String? nation,
        String? address,
        dynamic shippingAddress,
        String? provinceId,
        String? districtId,
        dynamic postalCode,
        String? deliveryAddress,
        String? deliveryProvinceId,
        String? deliveryDistrictId,
        int? isAddressEqualToDelivery,
        dynamic smsCode,
        dynamic emailVerifiedAt,
        int? isConfirmed,
        int? registerState,
        int? status,
        int? isBlocked,
        dynamic whereKnow,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Data(
            id: id ?? this.id,
            adminUserId: adminUserId ?? this.adminUserId,
            adminUserRolesId: adminUserRolesId ?? this.adminUserRolesId,
            adminUserLevelsId: adminUserLevelsId ?? this.adminUserLevelsId,
            username: username ?? this.username,
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
            phone: phone ?? this.phone,
            email: email ?? this.email,
            certificateNumber: certificateNumber ?? this.certificateNumber,
            citizenNumber: citizenNumber ?? this.citizenNumber,
            gender: gender ?? this.gender,
            birthday: birthday ?? this.birthday,
            points: points ?? this.points,
            team: team ?? this.team,
            pantsSize: pantsSize ?? this.pantsSize,
            shirtSize: shirtSize ?? this.shirtSize,
            contactNumber: contactNumber ?? this.contactNumber,
            bornCityId: bornCityId ?? this.bornCityId,
            documentName: documentName ?? this.documentName,
            documentNumber: documentNumber ?? this.documentNumber,
            companyName: companyName ?? this.companyName,
            tax: tax ?? this.tax,
            taxNumber: taxNumber ?? this.taxNumber,
            nation: nation ?? this.nation,
            address: address ?? this.address,
            shippingAddress: shippingAddress ?? this.shippingAddress,
            provinceId: provinceId ?? this.provinceId,
            districtId: districtId ?? this.districtId,
            postalCode: postalCode ?? this.postalCode,
            deliveryAddress: deliveryAddress ?? this.deliveryAddress,
            deliveryProvinceId: deliveryProvinceId ?? this.deliveryProvinceId,
            deliveryDistrictId: deliveryDistrictId ?? this.deliveryDistrictId,
            isAddressEqualToDelivery: isAddressEqualToDelivery ?? this.isAddressEqualToDelivery,
            smsCode: smsCode ?? this.smsCode,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            isConfirmed: isConfirmed ?? this.isConfirmed,
            registerState: registerState ?? this.registerState,
            status: status ?? this.status,
            isBlocked: isBlocked ?? this.isBlocked,
            whereKnow: whereKnow ?? this.whereKnow,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        adminUserId: json["admin_user_id"],
        adminUserRolesId: json["admin_user_roles_id"],
        adminUserLevelsId: json["admin_user_levels_id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        email: json["email"],
        certificateNumber: json["certificate_number"],
        citizenNumber: json["citizen_number"],
        gender: json["gender"],
        birthday: json["birthday"],
        points: json["points"],
        team: json["team"],
        pantsSize: json["pants_size"],
        shirtSize: json["shirt_size"],
        contactNumber: json["contact_number"],
        bornCityId: json["born_city_id"],
        documentName: json["document_name"],
        documentNumber: json["document_number"],
        companyName: json["company_name"],
        tax: json["tax"],
        taxNumber: json["tax_number"],
        nation: json["nation"],
        address: json["address"],
        shippingAddress: json["shipping_address"],
        provinceId: json["province_id"],
        districtId: json["district_id"],
        postalCode: json["postal_code"],
        deliveryAddress: json["delivery_address"],
        deliveryProvinceId: json["delivery_province_id"],
        deliveryDistrictId: json["delivery_district_id"],
        isAddressEqualToDelivery: json["is_address_equal_to_delivery"],
        smsCode: json["sms_code"],
        emailVerifiedAt: json["email_verified_at"],
        isConfirmed: json["is_confirmed"],
        registerState: json["register_state"],
        status: json["status"],
        isBlocked: json["is_blocked"],
        whereKnow: json["where_know"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admin_user_id": adminUserId,
        "admin_user_roles_id": adminUserRolesId,
        "admin_user_levels_id": adminUserLevelsId,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "email": email,
        "certificate_number": certificateNumber,
        "citizen_number": citizenNumber,
        "gender": gender,
        "birthday": birthday,
        "points": points,
        "team": team,
        "pants_size": pantsSize,
        "shirt_size": shirtSize,
        "contact_number": contactNumber,
        "born_city_id": bornCityId,
        "document_name": documentName,
        "document_number": documentNumber,
        "company_name": companyName,
        "tax": tax,
        "tax_number": taxNumber,
        "nation": nation,
        "address": address,
        "shipping_address": shippingAddress,
        "province_id": provinceId,
        "district_id": districtId,
        "postal_code": postalCode,
        "delivery_address": deliveryAddress,
        "delivery_province_id": deliveryProvinceId,
        "delivery_district_id": deliveryDistrictId,
        "is_address_equal_to_delivery": isAddressEqualToDelivery,
        "sms_code": smsCode,
        "email_verified_at": emailVerifiedAt,
        "is_confirmed": isConfirmed,
        "register_state": registerState,
        "status": status,
        "is_blocked": isBlocked,
        "where_know": whereKnow,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
