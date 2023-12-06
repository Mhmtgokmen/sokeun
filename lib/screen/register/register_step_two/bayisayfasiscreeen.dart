import 'package:flutter/material.dart';
import 'package:sokeun/screen/register/register_step_two/sonkullanicisayfasi.dart';

import '../../../widgets/login_button.dart';
import '../register_contact_info.dart';

class BayiSayfamScreeen extends StatefulWidget {
  const BayiSayfamScreeen({super.key});

  @override
  State<BayiSayfamScreeen> createState() => _BayiSayfamScreeenState();
}

class _BayiSayfamScreeenState extends State<BayiSayfamScreeen> {
  final MailAdresiiii = TextEditingController();
  final firmaadii = TextEditingController();
  final vergidairesi = TextEditingController();
  final vergiNumarasi = TextEditingController();
  final Belgeadiimail = TextEditingController();
  final belgenooomail = TextEditingController();
  final sifreeee = TextEditingController();
  final sifreeeekontroll = TextEditingController();

  void iletisimbilgilerinegecismetodu() {
    if (BayiKeyyy.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const soniletisimbilgisialma()));
    }
  }

  final BayiKeyyy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Form(
      key: BayiKeyyy,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Bayi",
            style:
                TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    firmaismiii(
                        controller: firmaadii,
                        hintext: "Firma Adı",
                        obscurttext: false),
                    const SizedBox(
                      height: 15,
                    ),
                    Vergidairesi(
                        controller: vergidairesi,
                        hintext: "Vergi Dairesi",
                        obscurttext: false),
                    const SizedBox(
                      height: 15,
                    ),
                    Tarihhh(
                      controller: vergiNumarasi,
                      hintext: "Vergi Numarası",
                      obscurttext: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Belgeadiii(
                      controller: Belgeadiimail,
                      hintext: "Belge Adı",
                      obscurttext: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Tarihhh(
                      controller: belgenooomail,
                      hintext: "Belge No",
                      obscurttext: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Belgeadiii(
                      controller: MailAdresiiii,
                      hintext: "Mail Adresi",
                      obscurttext: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Sifreeeeekontrol(
                      controller: sifreeee,
                      hintext: "Şifre",
                      obscurttext : false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Sifreeeeekontrol(
                      controller: sifreeeekontroll,
                      hintext: "Şifre(Tekrar)",
                        obscurttext : false,

                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: SizedBox(
                        width: ekrangenisligi / 1.3,
                        child: LoginButton(
                          onTap: () {
                            iletisimbilgilerinegecismetodu();
                          },
                          text: "Devam",
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

// FİRMA ADI

class firmaismiii extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  firmaismiii(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? advalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;
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
          obscureText: obscurttext,
          validator: advalidate,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: hintext,
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}

// VERGİ DAİRESİ
class Vergidairesi extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Vergidairesi(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? advalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;
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
          obscureText: obscurttext,
          validator: advalidate,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: hintext,
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}

// VERGİ NUMARASI

class VergiNumarasi extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  VergiNumarasi(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? advalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;
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
          obscureText: obscurttext,
          validator: advalidate,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: hintext,
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}

// BELGE ADI MAİL

class Belgeadiii extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Belgeadiii(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? advalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;
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
          obscureText: obscurttext,
          validator: advalidate,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: hintext,
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}

// ŞİFREEEE

// BELGE ADI MAİL

class Sifreeeeekontrol extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Sifreeeeekontrol(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? validatesifeapp(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!";
    }
    if (value.length < 4) {
      return "Şifrenizi 4 haneli olacak şekilde giriniz";
    }
    if (value.length > 4) {
      return "Şifrenizi 4 haneli olacak şekilde giriniz";
    }
    if (value.length == 4) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;
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
          obscureText: obscurttext,
          validator: validatesifeapp,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: hintext,
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}

// BELGE ADI

class BelgeAdiii extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  BelgeAdiii(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? advalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!!";
    }

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
          obscureText: obscurttext,
          validator: advalidate,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: hintext,
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}

