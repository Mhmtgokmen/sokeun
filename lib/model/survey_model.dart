class SurveyModel {
  bool status;
  String message;
  List<Data>? data;

  SurveyModel({
    required this.status,
    required this.message,
    this.data,
  });

  SurveyModel copyWith({
    bool? status,
    String? message,
    List<Data>? data,
  }) {
    return SurveyModel(
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

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() =>
      "SurveyModel(status: $status,message: $message,data: $data)";

  @override
  int get hashCode => Object.hash(status, message, data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyModel &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          message == other.message &&
          data == other.data;
}

class Data {
  int? id;
  int? adminUserId;
  String? name;
  String? about;
  String? image;
  String? point;
  int? status;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  bool? joined;
  List<SurveyQuestions>? surveyQuestions;

  Data({
    this.id,
    this.adminUserId,
    this.name,
    this.about,
    this.image,
    this.point,
    this.status,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.joined,
    this.surveyQuestions,
  });

  Data copyWith({
    int? id,
    int? adminUserId,
    String? name,
    String? about,
    String? image,
    String? point,
    int? status,
    String? startDate,
    String? endDate,
    String? createdAt,
    String? updatedAt,
    bool? joined,
    List<SurveyQuestions>? surveyQuestions,
  }) {
    return Data(
      id: id ?? this.id,
      adminUserId: adminUserId ?? this.adminUserId,
      name: name ?? this.name,
      about: about ?? this.about,
      image: image ?? this.image,
      point: point ?? this.point,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      joined: joined ?? this.joined,
      surveyQuestions: surveyQuestions ?? this.surveyQuestions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'admin_user_id': adminUserId,
      'name': name,
      'about': about,
      'image': image,
      'point': point,
      'status': status,
      'start_date': startDate,
      'end_date': endDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'joined': joined,
      'survey_questions': surveyQuestions,
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      adminUserId: json['admin_user_id'] as int?,
      name: json['name'] as String?,
      about: json['about'] as String?,
      image: json['image'] as String?,
      point: json['point'] as String?,
      status: json['status'] as int?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      joined: json['joined'] as bool?,
      surveyQuestions: (json['survey_questions'] as List<dynamic>?)
          ?.map((e) => SurveyQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() =>
      "Data(id: $id,adminUserId: $adminUserId,name: $name,about: $about,image: $image,point: $point,status: $status,startDate: $startDate,endDate: $endDate,createdAt: $createdAt,updatedAt: $updatedAt,joined: $joined,surveyQuestions: $surveyQuestions)";

  @override
  int get hashCode => Object.hash(
      id,
      adminUserId,
      name,
      about,
      image,
      point,
      status,
      startDate,
      endDate,
      createdAt,
      updatedAt,
      joined,
      surveyQuestions);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          adminUserId == other.adminUserId &&
          name == other.name &&
          about == other.about &&
          image == other.image &&
          point == other.point &&
          status == other.status &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          joined == other.joined &&
          surveyQuestions == other.surveyQuestions;
}

class SurveyQuestions {
  int? id;
  int? surveyId;
  String? question;
  String? createdAt;
  String? updatedAt;
  List<SurveyQuestionOptions>? surveyQuestionOptions;

  SurveyQuestions({
    this.id,
    this.surveyId,
    this.question,
    this.createdAt,
    this.updatedAt,
    this.surveyQuestionOptions,
  });

  SurveyQuestions copyWith({
    int? id,
    int? surveyId,
    String? question,
    String? createdAt,
    String? updatedAt,
    List<SurveyQuestionOptions>? surveyQuestionOptions,
  }) {
    return SurveyQuestions(
      id: id ?? this.id,
      surveyId: surveyId ?? this.surveyId,
      question: question ?? this.question,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      surveyQuestionOptions:
          surveyQuestionOptions ?? this.surveyQuestionOptions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'survey_id': surveyId,
      'question': question,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'survey_question_options': surveyQuestionOptions,
    };
  }

  factory SurveyQuestions.fromJson(Map<String, dynamic> json) {
    return SurveyQuestions(
      id: json['id'] as int?,
      surveyId: json['survey_id'] as int?,
      question: json['question'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      surveyQuestionOptions: (json['survey_question_options'] as List<dynamic>?)
          ?.map(
              (e) => SurveyQuestionOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() =>
      "SurveyQuestions(id: $id,surveyId: $surveyId,question: $question,createdAt: $createdAt,updatedAt: $updatedAt,surveyQuestionOptions: $surveyQuestionOptions)";

  @override
  int get hashCode => Object.hash(
      id, surveyId, question, createdAt, updatedAt, surveyQuestionOptions);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyQuestions &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          surveyId == other.surveyId &&
          question == other.question &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          surveyQuestionOptions == other.surveyQuestionOptions;
}

class SurveyQuestionOptions {
  int? id;
  int? surveyQuestionId;
  String? option;
  String? createdAt;
  String? updatedAt;

  SurveyQuestionOptions({
    this.id,
    this.surveyQuestionId,
    this.option,
    this.createdAt,
    this.updatedAt,
  });

  SurveyQuestionOptions copyWith({
    int? id,
    int? surveyQuestionId,
    String? option,
    String? createdAt,
    String? updatedAt,
  }) {
    return SurveyQuestionOptions(
      id: id ?? this.id,
      surveyQuestionId: surveyQuestionId ?? this.surveyQuestionId,
      option: option ?? this.option,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'survey_question_id': surveyQuestionId,
      'option': option,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory SurveyQuestionOptions.fromJson(Map<String, dynamic> json) {
    return SurveyQuestionOptions(
      id: json['id'] as int?,
      surveyQuestionId: json['survey_question_id'] as int?,
      option: json['option'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  @override
  String toString() =>
      "SurveyQuestionOptions(id: $id,surveyQuestionId: $surveyQuestionId,option: $option,createdAt: $createdAt,updatedAt: $updatedAt)";

  @override
  int get hashCode =>
      Object.hash(id, surveyQuestionId, option, createdAt, updatedAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyQuestionOptions &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          surveyQuestionId == other.surveyQuestionId &&
          option == other.option &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;
}
