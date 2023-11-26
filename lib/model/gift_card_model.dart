import 'package:uuid/uuid.dart';

class GiftCardModel {
  late final String? id;
   String? giftId; 
  final String? giftName;
  final int? giftPointNumber;
  final int? giftQuantity;
  final String? giftPoint;
  final String? giftPointButton;

  GiftCardModel({
    required this.id,
    required this.giftName,
    this.giftId,
    required this.giftPoint,
    required this.giftPointButton,
    required this.giftPointNumber,
    required this.giftQuantity,
  }) {
    giftId = Uuid().v4();
  }

  // JSON'dan nesne oluşturma
  factory GiftCardModel.fromJson(Map<String, dynamic> json) {
    return GiftCardModel(
      id: json['id'] ?? 0,
      giftId: json['giftId'],
      giftName: json['giftName'],
      giftPointNumber: json['giftPointNumber'],
      giftQuantity: json['giftQuantity'],
      giftPoint: json['giftPoint'],
      giftPointButton: json['giftPointButton'],
    );
  }

  // Nesneyi JSON'a çevirme
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'giftId': giftId,
      'giftName': giftName,
      'giftPointNumber': giftPointNumber,
      'giftQuantity': giftQuantity,
      'giftPoint': giftPoint,
      'giftPointButton': giftPointButton,
    };
  }

  @override
  String toString() {
    return 'GiftCardModel{id: $id, giftId: $giftId, giftName: $giftName, '
        'giftPointNumber: $giftPointNumber, giftQuantity: $giftQuantity, '
        'giftPoint: $giftPoint, giftPointButton: $giftPointButton}';
  }

  static fromMap(Map<String, Object?> e) {}
}
