class ProvinceModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<Districts>? districts;

  ProvinceModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.districts,
  });

  ProvinceModel copyWith({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt,
    List<Districts>? districts,
  }) {
    return ProvinceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      districts: districts ?? this.districts,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'districts': districts,
    };
  }

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      districts: (json['districts'] as List<dynamic>?)
          ?.map((e) => Districts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() =>
      "ProvinceModel(id: $id,name: $name,createdAt: $createdAt,updatedAt: $updatedAt,districts: $districts)";

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt, districts);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProvinceModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          districts == other.districts;
}

class Districts {
  int? id;
  int? provinceId;
  String? name;
  String? createdAt;
  String? updatedAt;

  Districts({
    this.id,
    this.provinceId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Districts copyWith({
    int? id,
    int? provinceId,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) {
    return Districts(
      id: id ?? this.id,
      provinceId: provinceId ?? this.provinceId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'province_id': provinceId,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Districts.fromJson(Map<String, dynamic> json) {
    return Districts(
      id: json['id'] as int?,
      provinceId: json['province_id'] as int?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  @override
  String toString() =>
      "Districts(id: $id,provinceId: $provinceId,name: $name,createdAt: $createdAt,updatedAt: $updatedAt)";

  @override
  int get hashCode => Object.hash(id, provinceId, name, createdAt, updatedAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Districts &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          provinceId == other.provinceId &&
          name == other.name &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;
}
