class RegisterModel {
  bool status;
  String message;
  dynamic data;

  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] ?? null,
    );
  }
}

