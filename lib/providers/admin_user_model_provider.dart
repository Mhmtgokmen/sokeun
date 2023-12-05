import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/model/admin_user_role_model.dart';

final adminUserRoleProvider = StateProvider<List<AdminUserRole>>((ref) {
  return [];
});

// final adminUserRoleProvider =
//     StateNotifierProvider<AdminUserRoleListNotifier, List<AdminUserRole>>(
//   (ref) => AdminUserRoleListNotifier(),
// );

final selectedAdminUserRoleProvider = StateProvider<int>((ref) {
  return 0;
});

// class AdminUserRoleListNotifier extends StateNotifier<List<AdminUserRole>> {
//   AdminUserRoleListNotifier() : super([]);

//   void setAdminUserRoles(List<AdminUserRole> roles) {
//     state = roles;
//   }
// }
