class CampaignModel {
  bool status;
  String message;
  List<Data>? data;

  CampaignModel({
    required this.status,
    required this.message,
    this.data,
  });

  CampaignModel copyWith({
    bool? status,
    String? message,
    List<Data>? data,
  }) {
    return CampaignModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() =>
      "CampaignModel(status: $status,message: $message,data: $data)";

  @override
  int get hashCode => Object.hash(status, message, data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignModel &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          message == other.message &&
          data == other.data;
}

class Data {
  int? id;
  int? adminUserId;
  String? adminUserRole;
  String? title;
  int? campaignType;
  String? region;
  String? calcMethod;
  String? multiplier;
  int? calcValue;
  String? startdate;
  String? finishdate;
  int? progress;
  int? status;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.adminUserId,
    this.adminUserRole,
    this.title,
    this.campaignType,
    this.region,
    this.calcMethod,
    this.multiplier,
    this.calcValue,
    this.startdate,
    this.finishdate,
    this.progress,
    this.status,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? id,
    int? adminUserId,
    String? adminUserRole,
    String? title,
    int? campaignType,
    String? region,
    String? calcMethod,
    String? multiplier,
    int? calcValue,
    String? startdate,
    String? finishdate,
    int? progress,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return Data(
      id: id ?? this.id,
      adminUserId: adminUserId ?? this.adminUserId,
      adminUserRole: adminUserRole ?? this.adminUserRole,
      title: title ?? this.title,
      campaignType: campaignType ?? this.campaignType,
      region: region ?? this.region,
      calcMethod: calcMethod ?? this.calcMethod,
      multiplier: multiplier ?? this.multiplier,
      calcValue: calcValue ?? this.calcValue,
      startdate: startdate ?? this.startdate,
      finishdate: finishdate ?? this.finishdate,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'admin_user_id': adminUserId,
      'admin_user_role': adminUserRole,
      'title': title,
      'campaign_type': campaignType,
      'region': region,
      'calc_method': calcMethod,
      'multiplier': multiplier,
      'calc_value': calcValue,
      'startdate': startdate,
      'finishdate': finishdate,
      'progress': progress,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      adminUserId: json['admin_user_id'] as int?,
      adminUserRole: json['admin_user_role'] as String?,
      title: json['title'] as String?,
      campaignType: json['campaign_type'] as int?,
      region: json['region'] as String?,
      calcMethod: json['calc_method'] as String?,
      multiplier: json['multiplier'] as String?,
      calcValue: json['calc_value'] as int?,
      startdate: json['startdate'] as String?,
      finishdate: json['finishdate'] as String?,
      progress: json['progress'] as int?,
      status: json['status'] as int?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  @override
  String toString() =>
      "Data(id: $id,adminUserId: $adminUserId,adminUserRole: $adminUserRole,title: $title,campaignType: $campaignType,region: $region,calcMethod: $calcMethod,multiplier: $multiplier,calcValue: $calcValue,startdate: $startdate,finishdate: $finishdate,progress: $progress,status: $status,description:$description, image:$image, createdAt: $createdAt,updatedAt: $updatedAt)";

  @override
  int get hashCode => Object.hash(
      id,
      adminUserId,
      adminUserRole,
      title,
      campaignType,
      region,
      calcMethod,
      multiplier,
      calcValue,
      startdate,
      finishdate,
      progress,
      status,
      createdAt,
      updatedAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          adminUserId == other.adminUserId &&
          adminUserRole == other.adminUserRole &&
          title == other.title &&
          campaignType == other.campaignType &&
          region == other.region &&
          calcMethod == other.calcMethod &&
          multiplier == other.multiplier &&
          calcValue == other.calcValue &&
          startdate == other.startdate &&
          finishdate == other.finishdate &&
          progress == other.progress &&
          status == other.status &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;
}
