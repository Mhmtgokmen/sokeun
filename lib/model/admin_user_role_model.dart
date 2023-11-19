import 'dart:convert';

AdminUserRole adminUserRoleFromJson(String str) =>
    AdminUserRole.fromJson(json.decode(str));

String adminUserRoleToJson(AdminUserRole data) => json.encode(data.toJson());

class AdminUserRole {
  int id;
  int adminUserId;
  int adminUserTypesId;
  DateTime createdAt;
  DateTime updatedAt;
  AdminUserType adminUserType;

  AdminUserRole({
    required this.id,
    required this.adminUserId,
    required this.adminUserTypesId,
    required this.createdAt,
    required this.updatedAt,
    required this.adminUserType,
  });

  AdminUserRole copyWith({
    int? id,
    int? adminUserId,
    int? adminUserTypesId,
    DateTime? createdAt,
    DateTime? updatedAt,
    AdminUserType? adminUserType,
  }) =>
      AdminUserRole(
        id: id ?? this.id,
        adminUserId: adminUserId ?? this.adminUserId,
        adminUserTypesId: adminUserTypesId ?? this.adminUserTypesId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        adminUserType: adminUserType ?? this.adminUserType,
      );

  factory AdminUserRole.fromJson(Map<String, dynamic> json) => AdminUserRole(
        id: json["id"],
        adminUserId: json["admin_user_id"],
        adminUserTypesId: json["admin_user_types_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        adminUserType: AdminUserType.fromJson(json["admin_user_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_user_id": adminUserId,
        "admin_user_types_id": adminUserTypesId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "admin_user_type": adminUserType.toJson(),
      };
  @override
  String toString() {
    return 'AdminUserRole{id: $id, adminUserId: $adminUserId, adminUserTypesId: $adminUserTypesId, createdAt: $createdAt, updatedAt: $updatedAt, adminUserType: $adminUserType}';
  }
}

class AdminUserType {
  int id;
  int superAdminId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  AdminUserType({
    required this.id,
    required this.superAdminId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  AdminUserType copyWith({
    int? id,
    int? superAdminId,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AdminUserType(
        id: id ?? this.id,
        superAdminId: superAdminId ?? this.superAdminId,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AdminUserType.fromJson(Map<String, dynamic> json) => AdminUserType(
        id: json["id"],
        superAdminId: json["super_admin_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "super_admin_id": superAdminId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return 'AdminUserType{id: $id, superAdminId: $superAdminId, name: $name, createdAt: $createdAt, updatedAt: $updatedAt}';
  }


}
