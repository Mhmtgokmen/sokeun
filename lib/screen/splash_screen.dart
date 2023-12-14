import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/model/admin_user_level.dart';
import 'package:sokeun/model/admin_user_role_model.dart';
import 'package:sokeun/model/login_model.dart';
import 'package:sokeun/model/provinces_model.dart';
import 'package:sokeun/providers/admin_user_level_provider.dart';
import 'package:sokeun/providers/admin_user_model_provider.dart';
import 'package:sokeun/providers/login_user_provider.dart';
import 'package:sokeun/providers/provinces_provider.dart';
import 'package:sokeun/screen/login/login_screen.dart';
import 'package:sokeun/screen/register/kayitScreeen/OnaySayfasiScreen.dart';
import 'package:sokeun/screen/register/register_step_one.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/utility/auth_utility.dart';
import 'package:dio/dio.dart';
import 'package:sokeun/widgets/start_bottom_nav_bar.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late ApiService apiService;

  Future<String?> initialWelcome(String? token) async {
    apiService = ApiService();
    if (token != null) {
      try {
        Response response = await apiService.post(
          "https://development.coneexa.com/api/welcome",
          {},
          token: token,
        );
        if (response.statusCode == 200) {
          print("Hoşgeldiniz");
          LoginResponse loginResponse = LoginResponse.fromJson(response.data);
          ref.read(loginUserProvider.notifier).state = loginResponse;
          return "success";
        } else if (response.statusCode == 401) {
          print("Lütfen giriş yapınız");
          return null;
        } else {
          print("bir sorun oluştu");
          return null;
        }
      } catch (e) {
        print(e);
        return null;
      }
    }
    return null;
  }

  Future<void> ridirection() async {
    final token = await AuthUtility.getToken();
    String? result = await initialWelcome(token);
    LoginResponse? user = ref.read(loginUserProvider);
    if (user != null) {
      final registerState = user.data.registerState;
      final isConfirmed = user.data.isConfirmed;
      if (token != null) {
        if (result == 'success') {
          if (registerState == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginaltButonGiris(),
              ),
            );
          } else if (registerState == 1) {
            if (isConfirmed == 0) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const OnaySonScccreeeeeeeen(),
                ),
              );
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => const bottomnavbarscreen(),
                ),
              );
            }
          }
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const telnoilksayfa(),
            ),
          );
        }
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const telnoilksayfa(),
          ),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const telnoilksayfa(),
        ),
      );
    }
  }

  Future<void> appSetting() async {
    apiService = ApiService();

    Map<String, dynamic> data = {
      "admin_user_id": "1",
    };

    try {
      Response response = await apiService.post("app-settings", data);
      if (mounted) {
        if (response.statusCode == 200) {
          if (response.data["status"] == true) {
            var adminUserRoles = response.data['data']['admin_user_role'] ?? [];
            var adminUserLevels =
                response.data["data"]["admin_user_level"] ?? [];
            var userProvinces = response.data["data"]["provinces"] ?? [];
            List<ProvinceModel> provinces =
                userProvinces.map<ProvinceModel>((json) {
              return ProvinceModel.fromJson(json);
            }).toList();
            ref.read(userProvinceProvider.notifier).state = provinces;

            List<AdminUserLevel> level =
                adminUserLevels.map<AdminUserLevel>((json) {
              return AdminUserLevel.fromJson(json);
            }).toList();
            ref.read(adminUserLevelProvider.notifier).state = level;

            List<AdminUserRole> roles =
                adminUserRoles.map<AdminUserRole>((json) {
              return AdminUserRole.fromJson(json);
            }).toList();
            print("roller $roles");
            ref.read(adminUserRoleProvider.notifier).state = roles;
          } else {
            print("API yanıtı false durumu döndürdü.");
          }
        } else {
          print(
              "API isteği ${response.statusCode} durum kodu ile başarısız oldu.");
        }
      }
    } catch (error) {
      if (mounted) {
        print("API isteği sırasında hata oluştu: $error");
      }
    }
  }

  @override
  void initState() {
    appSetting().then((value) {
      ridirection();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ekranayari = MediaQuery.of(context);
    var ekrangenisligi = ekranayari.size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: ekrangenisligi / 1.5,
          child: Image.asset("assetss/logo.png"),
        ),
      ),
    );
  }
}

//FutureBuilder(
      //   future: AuthUtility.getAllDate(),
      //   builder: (BuildContext context,
      //       AsyncSnapshot<Map<String, dynamic>?> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Container(
      //         color: Colors.white,
      //         child: Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               SizedBox(
      //                 width: ekrangenisligi / 2.5,
      //                 child: Image.asset("assetss/logo.png"),
      //               ),
      //               const SizedBox(
      //                 height: 60,
      //               ),
      //               const CircularProgressIndicator(
      //                 color: Colors.red,
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Text("hata.${snapshot.error}");
      //     } else {
      //       if (snapshot.data != null) {
      //         String? registerState = snapshot.data?['register'];
      //         String? isConfirmed = snapshot.data?['isConfirmed'];
      //         return FutureBuilder(
      //           future: initialWelcome(snapshot.data),
      //           builder:
      //               (BuildContext context, AsyncSnapshot<String?> snapshot) {
      //             if (snapshot.connectionState == ConnectionState.waiting) {
      //               return Container(
      //                 color: Colors.white,
      //                 child: Center(
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       SizedBox(
      //                         width: ekrangenisligi / 2.5,
      //                         child: Image.asset("assetss/logo.png"),
      //                       ),
      //                       const SizedBox(
      //                         height: 60,
      //                       ),
      //                       const CircularProgressIndicator(
      //                         color: Colors.red,
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             } else if (snapshot.hasError) {
      //               return Text("Hata: ${snapshot.error}");
      //             } else {
      //               if (snapshot.data == "success") {
      //                 if (registerState == "0") {
      //                   return const LoginaltButonGiris();
      //                 } else if (registerState == "1") {
      //                   if (isConfirmed == "0") {
      //                     return const OnaySonScccreeeeeeeen();
      //                   } else {
      //                     return const bottomnavbarscreen();
      //                   }
      //                 } else {
      //                   return const Text("Hata oluştu tekrar deneyiniz!");
      //                 }
      //               } else {
      //                 return const telnoilksayfa();
      //               }
      //             }
      //           },
      //         );
      //       } else {
      //         return const telnoilksayfa();
      //       }
      //     }
      //   },
      // ),