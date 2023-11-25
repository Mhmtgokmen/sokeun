import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sokeun/model/admin_user_role_model.dart';
import 'package:sokeun/model/login_model.dart';
import 'package:sokeun/model/provinces_model.dart';
import 'package:sokeun/providers/admin_user_level_provider.dart';
import 'package:sokeun/providers/admin_user_model_provider.dart';
import 'package:sokeun/providers/login_user_provider.dart';
import 'package:sokeun/providers/provinces_provider.dart';
import 'package:sokeun/screen/register/register_page.dart';
import 'package:sokeun/screen/register/register_step_one.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/widgets/login_button.dart';
import '../../model/admin_user_level.dart';
import 'package:dio/dio.dart';

// DOĞRULAMA 1. SAYFA

class telnoilksayfa extends ConsumerStatefulWidget {
  const telnoilksayfa({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _telnoilksayfaState();
}

class _telnoilksayfaState extends ConsumerState<telnoilksayfa> {
  // Text Editing Controller
  final numarakontrol = TextEditingController();
  final sifrekontroletmegiris = TextEditingController();
  late ApiService apiService;
  // final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  //     GlobalKey<ScaffoldMessengerState>();
  void ilkdefagiris() async {
    if (_formkey.currentState!.validate()) {
      apiService = ApiService();
      final phoneNumber = numarakontrol.text.trim();
      final password = sifrekontroletmegiris.text.trim();

      Map<String, dynamic> data = {
        "phone": phoneNumber,
        "password": password,
      };
      try {
        Response response = await apiService.post(
          "https://development.coneexa.com/api/login",
          data,
        );
        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = response.data;
          LoginResponse loginResponse = LoginResponse.fromJson(responseData);
          ref.read(loginUserProvider.notifier).state = loginResponse;
          ref.read(loginPasswordProvider.notifier).state = password;
          saveToken(loginResponse.data.accessToken,loginResponse.data.registerState.toString(),loginResponse.data.isConfirmed.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(loginResponse.message),
              duration: const Duration(seconds: 2),
            ),
          );
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginaltButonGiris()));
          print("Token: ${loginResponse.data.accessToken}");
        } else if (response.statusCode == 401) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login failed"),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Bilinmeyen bir hata oluştu 1"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Bilinmeyen bir hata oluştu : $e"),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void saveToken(String token, String registerState, String isConfirmed) async {
    await Hive.initFlutter();

    try {
      if (!Hive.isBoxOpen('token')) {
        await Hive.openBox<String>('token');
      }
      final box = await Hive.openBox<String>('token'); 
      await box.put('token', token);
      await box.put('registerState', registerState);
      await box.put('isConfirmed', isConfirmed);
      await box.close();
      print("Hive token:$token");
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }

  void PasswordForm() {
    if (_formkey.currentState!.validate()) {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>bottomnavbarscreen()));
    }
  }

  void loginAppSetting() async {
    apiService = ApiService();

    Map<String, dynamic> data = {
      "admin_user_id": "3",
    };

    try {
      var response = await apiService.post("app-settings", data);

      if (response.statusCode == 200) {
        if (response.data["status"] == true) {
          var adminUserRoles = response.data["data"]["admin_user_role"] ?? [];
          var adminUserLevels = response.data["data"]["admin_user_level"] ?? [];
          var userProvinces = response.data["data"]["provinces"] ?? [];

          List<ProvinceModel> provinces =
              userProvinces.map<ProvinceModel>((json) {
            return ProvinceModel.fromJson(json);
          }).toList();
          ref.read(userProvinceProvider.notifier).state = provinces;

          // List<Districts> districts = userDistricts.map<Districts>((json) {
          //   return Districts.fromJson(json);
          // }).toList();
          // ref.read(userDistrictsProvider.notifier).state = districts;

          List<AdminUserLevel> level =
              adminUserLevels.map<AdminUserLevel>((json) {
            return AdminUserLevel.fromJson(json);
          }).toList();
          ref.read(adminUserLevelProvider.notifier).state = level;

          List<AdminUserRole> roles = adminUserRoles.map<AdminUserRole>((json) {
            return AdminUserRole.fromJson(json);
          }).toList();
          ref.read(adminUserRoleProvider.notifier).state = roles;
        } else {
          print("API yanıtı false durumu döndürdü.");
        }
      } else {
        print(
            "API isteği ${response.statusCode} durum kodu ile başarısız oldu.");
      }
    } catch (error) {
      print("API isteği sırasında hata oluştu: $error");
    }
    // List<ProvinceModel> provinces = [];
    // List<Districts> districts = [];
    // List<AdminUserRole> roles = [];
    // Map<String, dynamic> data = {
    //   "admin_user_id": "6",
    // };

    // List<AdminUserLevel> level = [];
    // Map<String, dynamic> veri = {
    //   "admin_user_id": "6",
    // };

    // apiService.post("app-settings", data).then((value) {
    //   if (value.statusCode == 200) {
    //     if (value.data["status"] == true) {
    //       var adminUserRoles = value.data["data"]["admin_user_role"];
    //       var adminUserLevels = value.data["data"]["admin_user_level"];
    //       var userProvinces = value.data["data"]["provinces"];
    //       var userDistricts = value.data["data"]["provinces"]["districts"];

    //       provinces = userProvinces.map<ProvinceModel>((json) {
    //         return ProvinceModel.fromJson(json);
    //       }).toList();
    //       ref.read(userProvinceProvider.notifier).state = provinces;
    //       districts = userDistricts.map<Districts>((json) {
    //         return Districts.fromJson(json);
    //       }).toList();
    //       ref.read(userDistrictsProvider.notifier).state = districts;
    //       level = adminUserLevels.map<AdminUserLevel>((json) {
    //         return AdminUserLevel.fromJson(json);
    //       }).toList();
    //       ref.read(adminUserLevelProvider.notifier).state = level;

    //       roles = adminUserRoles.map<AdminUserRole>((json) {
    //         return AdminUserRole.fromJson(json);
    //       }).toList();
    //       ref.read(adminUserRoleProvider.notifier).state = roles;
    //     }
    //   }
    // });
  }

  @override
  void initState() {
    loginAppSetting();
    super.initState();
  }

  // Validator

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    // var ekranyukseklikayari = ekranAyari.size.height;

    // Telefon numarası ilk login sayfa

    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Keşfetmeye Hazır Olun",
                      style: TextStyle(
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold,
                        fontSize: ekrangenisligi / 15,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        width: ekrangenisligi / 4,
                        child: Image.asset("assetss/logo.png")),
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                        width: ekrangenisligi / 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Telefon Numarası",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ekrangenisligi / 17,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                        controller: numarakontrol,
                        hintext: "Telefon Numarası",
                        obscurttext: false),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                        width: ekrangenisligi / 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Şifre",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ekrangenisligi / 17,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 7,
                    ),
                    PasswordKontrolSayfasi(
                        controller: sifrekontroletmegiris,
                        hintext: "Şifre",
                        obscurttext: true),
                    const SizedBox(
                      height: 45,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: ekrangenisligi / 3,
                              child: LoginButton(
                                onTap: () {
                                  ilkdefagiris();
                                },
                                text: "Giriş Yap",
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: ekrangenisligi / 3,
                              child: LoginButton(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const KayitScreenPageView()));
                                  },
                                  text: "Kayıt ol"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// KULLANILAN TEXTFİELD

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? validateTelefon(String? value) {
    if (value == null || value.isEmpty) {
      return "Telefon numarası giriniz!!!";
    }
    if (value.length < 10) {
      return "Telefon numarasını 10 haneli olacak şekilde giriniz";
    }
    if (value.length > 10) {
      return "Telefon numarasını 10 haneli olacak şekilde giriniz";
    }
    if (value.length == 10) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    // var ekranyukseklikayari = ekranAyari.size.height;
    return SizedBox(
      width: ekrangenisligi / 1.1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          //  boxShadow: [
          //  BoxShadow(
          //    color: Colors.grey.shade300, // Gölge rengi
          //   blurRadius: 1.0, // Gölge bulanıklığı
          //  spreadRadius: 1.0, // Gölge yayılma miktarı
          //  offset: Offset(0, 3), // Gölgenin konumu (x, y)
          //    ),
          //   ],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(-5.0, -5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          obscureText: false,
          validator: validateTelefon,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Telefon Numarası',
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}

// SİFRE İÇİN KULLANILAN TEXTFİELD

class PasswordKontrolSayfasi extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  const PasswordKontrolSayfasi(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? sifrevalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Şifrenizi giriniz!!!";
    }
    if (value.length < 6) {
      return "Şifrenizi 6 haneli olacak şekilde giriniz";
    }
    if (value.length > 6) {
      return "Şifrenizi 6 haneli olacak şekilde giriniz";
    }
    if (value.length == 6) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    // var ekranyukseklikayari = ekranAyari.size.height;
    return SizedBox(
      width: ekrangenisligi / 1.1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(-5.0, -5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: controller,
          obscureText: true,
          validator: sifrevalidate,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Şifre',
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}
