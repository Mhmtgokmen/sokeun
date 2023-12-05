import 'package:flutter/material.dart';
import 'package:sokeun/screen/home/qr_screen.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/utility/auth_utility.dart';
import 'package:sokeun/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManuelQrCode extends ConsumerStatefulWidget {
  const ManuelQrCode({super.key});

  @override
  ConsumerState<ManuelQrCode> createState() => _ManuelQrCodeState();
}

class _ManuelQrCodeState extends ConsumerState<ManuelQrCode> {
  final TextEditingController qrCodeController = TextEditingController();
  late ApiService apiService;

  Future<void> qrcodePost() async {
    apiService = ApiService();
    final qrcodeManuel = qrCodeController.text.trim();
    final token = await AuthUtility.getToken();
    Map<String, dynamic> data = {
      "code": qrcodeManuel,
    };
    print("token: $token");

    try {
      Response response = await apiService.post(
        "point/code/submit",
        data,
        token: token,
      );
      if (response.statusCode == 200) {
        print(response.data['message']);
        showSnackBar(response.data['message']);
      } else if (response.statusCode == 404) {
        print(response.data['message']);
        showSnackBar(response.data['message']);
      } else {
        print("Bir hata oluştu");
        showSnackBar("Bir hata oluştu tekrar deneyiniz");
      }
    } catch (e) {
      print("hata Hata : $e");
      showSnackBar("Bir hata oluştu tekrar deneyiniz!");
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ekranayari = MediaQuery.of(context);
    var ekrangenisligi = ekranayari.size.width;
    var ekranyuksekligi = ekranayari.size.height;
    return Scaffold(
      backgroundColor: Colors.red[700],
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: ekrangenisligi / 1.2,
                height: ekranyuksekligi / 1.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red[700],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Lütfen 13 haneli puan kodunu giriniz. Eğer elinizde qr kod var ise kamera kısmından okutabilirsiniz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: ekrangenisligi / 12),
                        child: CustomTextField(
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          borderColor: Colors.white,
                          controller: qrCodeController,
                          hintText: "Kodu Manuel Gir",
                          onChanged: (value) {
                            print('Girilen Metin: $value');
                          },
                        ),
                      ),
                      SizedBox(
                        height: ekranyuksekligi / 14.7,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.red.shade900,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    qrcodePost();
                                  },
                                  child: const Text(
                                    "Manuel Kodu Gönder",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: ekrangenisligi / 20),
                        child: SizedBox(
                          height: ekranyuksekligi / 14.7,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QrKodScreen(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Kamerayı Aç",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
