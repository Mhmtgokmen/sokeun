import 'dart:convert';

AdminUserLevel AdminUserLevelFromJson(String str) =>
   AdminUserLevel.fromJson(json.decode(str));

String adminUserLevelToJson(AdminUserLevel data) => json.encode(data.toJson());

class AdminUserLevel {
  int id;
  int adminUserId;
  int adminUserRolesId;
  String level;
  DateTime createdAt;
  DateTime updatedAt;
  AdminUserRoleType adminUserRole;

  AdminUserLevel({
    required this.id,
    required this.adminUserId,
    required this.adminUserRolesId,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
    required this.adminUserRole,
  });

  AdminUserLevel copyWith({
    int? id,
    int? adminUserId,
    int? adminUserRolesId,
    String? level,
    DateTime? createdAt,
    DateTime? updatedAt,
    AdminUserRoleType? adminUserRole,
  }) =>
      AdminUserLevel(
        id: id ?? this.id,
        adminUserId: adminUserId ?? this.adminUserId,
        adminUserRolesId: adminUserRolesId ?? this.adminUserRolesId,
        level: level ?? this.level,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        adminUserRole: adminUserRole ?? this.adminUserRole,
      );

  factory AdminUserLevel.fromJson(Map<String, dynamic> json) => AdminUserLevel(
    id: json["id"],
    adminUserId: json["admin_user_id"],
    adminUserRolesId: json["admin_user_roles_id"],
    level: json["level"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    adminUserRole: AdminUserRoleType.fromJson(json["admin_user_role"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_user_id": adminUserId,
    "admin_user_roles_id": adminUserRolesId,
    "level": level,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "admin_user_role": adminUserRole.toJson(),
  };

  @override
  String toString() {
    return 'AdminUserLevel{id: $id, adminUserId: $adminUserId, adminUserRolesId: $adminUserRolesId, level: $level, createdAt: $createdAt, updatedAt: $updatedAt, adminUserRole: $adminUserRole}';
  }
}

class AdminUserRoleType {
  int id;
  int adminUserId;
  int adminUserTypesId;
  DateTime createdAt;
  DateTime updatedAt;

  AdminUserRoleType({
    required this.id,
    required this.adminUserId,
    required this.adminUserTypesId,
    required this.createdAt,
    required this.updatedAt,
  });

  AdminUserRoleType copyWith({
    int? id,
    int? adminUserId,
    int? adminUserTypesId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AdminUserRoleType(
        id: id ?? this.id,
        adminUserId: adminUserId ?? this.adminUserId,
        adminUserTypesId: adminUserTypesId ?? this.adminUserTypesId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AdminUserRoleType.fromJson(Map<String, dynamic> json) => AdminUserRoleType(
    id: json["id"],
    adminUserId: json["admin_user_id"],
    adminUserTypesId: json["admin_user_types_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_user_id": adminUserId,
    "admin_user_types_id": adminUserTypesId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'AdminUserRoleType{id: $id, adminUserId: $adminUserId, adminUserTypesId: $adminUserTypesId, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
