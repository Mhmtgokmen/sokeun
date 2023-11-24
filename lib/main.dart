import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/widgets/start_bottom_nav_bar.dart';
import 'screen/login/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('tokenBox');
  runApp(const ProviderScope(child: MyApp()));
}

late ApiService apiService;



class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Future<String?> getToken() async {
    await Hive.initFlutter();
    final box = await Hive.openBox<String>('tokenBox');
    final token = box.get('token');
    await box.close();
    return token;
  }

  Future<String?> initialWelcome() async {
    apiService = ApiService();
    final token = await getToken();
    // print("main token: $token");
    try {
      Response response = await apiService.post(
        "https://development.coneexa.com/api/welcome",
        {},
        token: token,
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
      home: FutureBuilder(
        future: initialWelcome(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          print("Data: ${snapshot.data}");
          print("Data: ${snapshot.connectionState}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Stack(
              children: [
                Container(
                 color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.red,),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("hata.${snapshot.error}");
          } else {
            if (snapshot.data == "success") {
              return const bottomnavbarscreen();
            } else {
              return const telnoilksayfa();
            }
          }
        },
      ),
    );
  }
}
