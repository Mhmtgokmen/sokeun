import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sokeun/screen/register/kayitScreeen/OnaySayfasiScreen.dart';
import 'package:sokeun/screen/register/register_step_one.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/utility/auth_utility.dart';
import 'package:sokeun/widgets/start_bottom_nav_bar.dart';
import 'screen/login/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('token');
  runApp(const ProviderScope(child: MyApp()));
}

late ApiService apiService;

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Future<String?> initialWelcome(Map<String, dynamic>? allData) async {
    apiService = ApiService();
    // Map<String, dynamic>? allData = await getAllDate();
    print("main token: ${allData?['token']}");
    print("main register: ${allData?['register']}");
    print("main register: ${allData?['confirmed']}");
    try {
      Response response = await apiService.post(
        "https://development.coneexa.com/api/welcome",
        {},
        token: allData?['token'],
      );
      if (response.statusCode == 200) {
        // tokeni hive kaydet
        print("Hoşgeldiniz");
        // print("api token: $token");
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Sokeun',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', 'tr_TR'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // home: const bottomnavbarscreen(),
      home: FutureBuilder(
        future: AuthUtility.getAllDate(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>?> snapshot) {
          print("Data: ${snapshot.data}");
          print("Data: ${snapshot.connectionState}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("hata.${snapshot.error}");
          } else {
            if (snapshot.data != null) {
              String? registerState = snapshot.data?['register'];
              String? isConfirmed = snapshot.data?['isConfirmed'];
              return FutureBuilder(
                future: initialWelcome(snapshot.data),
                builder:
                    (BuildContext context, AsyncSnapshot<String?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Stack(
                      children: [
                        Container(
                          color: Colors.white,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("Hata: ${snapshot.error}");
                  } else {
                    if (snapshot.data == "success") {
                      if (registerState == "0") {
                        return const LoginaltButonGiris();
                      } else if (registerState == "1") {
                        //isconfirmed 0 olarak değiştirilecek
                        if (isConfirmed == "1") {
                          return const OnaySonScccreeeeeeeen();
                        } else {
                          return const bottomnavbarscreen();
                        }
                      } else {
                        print("hata1 ");
                        return const Text("Hata oluştu tekrar deneyiniz!");
                      }
                    } else {
                      print("hata1 ");

                      return const telnoilksayfa();
                    }
                  }
                },
              );
              // return const bottomnavbarscreen();
            } else {
              return const telnoilksayfa();
            }
          }
        },
      ),
    );
  }
}
