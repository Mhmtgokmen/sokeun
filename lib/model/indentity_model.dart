// To parse this JSON data, do
//
//     final identityModel = identityModelFromJson(jsonString);

import 'dart:convert';

IdentityModel identityModelFromJson(String str) => IdentityModel.fromJson(json.decode(str));

String identityModelToJson(IdentityModel data) => json.encode(data.toJson());

class IdentityModel {
    bool status;
    String message;
    dynamic data;

    IdentityModel({
        required this.status,
        required this.message,
        this.data,
    });

    IdentityModel copyWith({
        bool? status,
        String? message,
        dynamic data,
    }) => 
        IdentityModel(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory IdentityModel.fromJson(Map<String, dynamic> json) => IdentityModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
    };
}
