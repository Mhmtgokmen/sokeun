import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sokeun/providers/gift_card_provider.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/widgets/start_bottom_nav_bar.dart';
import 'screen/login/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    hide ChangeNotifierProvider;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('token');
  runApp(const ProviderScope(child: MyApp()));
}

late ApiService apiService;

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Future<Map<String, dynamic>?> getAllDate() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen('token')) {
      await Hive.openBox<String>('token');
    }
    final box = await Hive.openBox<String>('token');
    final token = box.get('token');
    final register = box.get('registerState');
    final confirmed = box.get('isConfirmed');
    await box.close();

    return {
      'token': token,
      'register': register,
      'isConfirmed': confirmed,
    };
  }

  Future<String?> initialWelcome() async {
    apiService = ApiService();
    Map<String, dynamic>? allData = await getAllDate();
    print("main token: ${allData?['token']}");
    print("main register: ${allData?['register']}");
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
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
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
              if (snapshot.data == "success") {
                return const bottomnavbarscreen();
              } else {
                return const telnoilksayfa();
              }
            }
          },
        ),
      ),
    );
  }
}
