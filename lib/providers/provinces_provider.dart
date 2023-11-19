import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/model/provinces_model.dart';

final userProvinceProvider = StateProvider<List<ProvinceModel>>((ref) {
  return [];
});

final userDistrictsProvider = StateProvider<List<Districts>>((ref) {
  return [];
});

final selectedProvinceIdProvider = StateProvider<int?>((ref) {
 return null;
});