import 'package:flutter/material.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/model/register_model.dart';
import 'package:dio/dio.dart';
import 'package:sokeun/widgets/giris_button.dart';

class KayitScreenPageView extends ConsumerStatefulWidget {
  const KayitScreenPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _KayitScreenPageViewState();
}

class _KayitScreenPageViewState extends ConsumerState<KayitScreenPageView> {
  final numaraKontroll = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late ApiService apiService;

  void popContextAndAlert() async {
    if (_formKey.currentState!.validate()) {
      String phoneNumber = numaraKontroll.text.trim();

      Map<String, dynamic> data = {
        "phone": phoneNumber,
        "admin_user_id": "3",
        "is_debug": "true"
      };
      try {
        Response response = await apiService.post(
          "register",
          data,
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = response.data;
          RegisterModel registerModel = RegisterModel.fromJson(responseData);
          // Başarılı bir şekilde kayıt olduysa
          if (registerModel.status) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(registerModel.message),
                duration: const Duration(seconds: 1),
              ),
            );
            Navigator.pop(context);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(registerModel.message),
                duration: const Duration(seconds: 1),
              ),
            );
          }
        } else {
          // API'den beklenmeyen bir cevap geldi
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Beklenmeyen bir hata oluştu."),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        // Hata durumunda
        print("Hata Detayı: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Bir hata oluştu: $e"),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    apiService = ApiService();
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;

    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "",
            style:
                TextStyle(color: Colors.red[700], fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kayıt Ol",
                      style: TextStyle(
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold,
                        fontSize: ekrangenisligi / 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 230,
                ),
                MyTextField(
                    controller: numaraKontroll,
                    hintText: "Telefon Numarası",
                    obscureText: false),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: SizedBox(
                    width: ekrangenisligi / 1.5,
                    child: Girisbuton(
                      onTap: () {
                        popContextAndAlert();
                      },
                      text: "Kod Gönder",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  String? validateTelefon(String? value) {
    if (value == null || value.isEmpty) {
      return "Telefon numarası giriniz!!!";
    }
    if (value.length != 10) {
      return "Telefon numarasını 10 haneli olacak şekilde giriniz";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
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
          keyboardType: TextInputType.number,
          controller: controller,
          obscureText: obscureText,
          validator: validateTelefon,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
