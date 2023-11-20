import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sokeun/model/provinces_model.dart';
import 'package:sokeun/providers/provinces_provider.dart';
import 'package:sokeun/screen/register/kayitScreeen/OnaySayfasiScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/admin_user_role_model.dart';
import '../../widgets/login_button.dart';

class soniletisimbilgisialma extends ConsumerStatefulWidget {
  const soniletisimbilgisialma({super.key});

  @override
  ConsumerState<soniletisimbilgisialma> createState() =>
      _soniletisimbilgisialmaState();
}

class _soniletisimbilgisialmaState
    extends ConsumerState<soniletisimbilgisialma> {
  // ÜST TARAF
  final Adreskontroletme = TextEditingController();
  final ilkontroletme = TextEditingController();
  final ilcekontroletme = TextEditingController();
  final telefonkontroletmekontrol = TextEditingController();
  ///////////////
  // Gönderi bölümü
  final gonderiadresikontrol = TextEditingController();
  final gonderipostakodukontrol = TextEditingController();
  final gonderiilkontrol = TextEditingController();
  final gonderiilcekontrol = TextEditingController();
  final bizinerdenduydunuzkontrol = TextEditingController();
  final gonderitelefonkontrol = TextEditingController();
  final denemelerimapp = TextEditingController();

////////////////

  bool iletisimBilgileriGonderiAdresineKopyala = false;

  void OnayaGecmeMetodu() {
    if (Soniletisimkey.currentState!.validate()) {
      if (telnoizinvermeenalt == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Kutuları onaylayın")));
      } else if (telnoizinvermeenalt == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Kutuları onaylayın")));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const OnaySonScccreeeeeeeen()));
      }
    }
  }

  late final List<String> itemssnerdenduydun = [
    'Ustam Burada Reklamı',
    'Myk Sınavı',
    'Eğitim',
    'Bayi',
    'Arkadaş',
    'Radyo',
    'Gazete',
    'İnternet ve Sosyal Medya',
  ];

  final Soniletisimkey = GlobalKey<FormState>();
  String? bizinerdenduydunuz;
  bool? telnoizinvermeenalt = false;

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Form(
      key: Soniletisimkey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "İletişim Bilgileri",
            style:
                TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SafeArea(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "İletişim Adresi",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ekrangenisligi / 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Adressssayfammm(
                          controller: Adreskontroletme,
                          hintext: "Adres",
                          obscurttext: false),
                      const SizedBox(
                        height: 14,
                      ),
                                           DropdownButtonHideUnderline(
                        child: Consumer(builder: (context, ref, child) {
                          List<ProvinceModel> proviceItems =
                              ref.watch(userProvinceProvider);
                          print("iller: $proviceItems");
                          return DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'İl',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: proviceItems
                                .map((ProvinceModel item) =>
                                    DropdownMenuItem<String>(
                                      value: item.name,
                                      child: Text(
                                        item.name ?? "",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: bizinerdenduydunuz,
                            onChanged: (String? value) {
                              setState(() {
                                bizinerdenduydunuz = value!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: ekrangenisligi / 1.1,
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.grey.shade100,
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
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      DropdownButtonHideUnderline(
                        child: Consumer(builder: (context, ref, child) {
                          List<ProvinceModel> proviceItems =
                              ref.watch(userProvinceProvider);
                          print("iller: $proviceItems");
                          return DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'İlçe',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: proviceItems
                                .map((ProvinceModel item) =>
                                    DropdownMenuItem<String>(
                                      value: item.name,
                                      child: Text(
                                        item.name ?? "",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: bizinerdenduydunuz,
                            onChanged: (String? value) {
                              setState(() {
                                bizinerdenduydunuz = value!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: ekrangenisligi / 1.1,
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.grey.shade100,
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
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Telefonnumarasayfamm(
                        controller: telefonkontroletmekontrol,
                        hintext: "İletişim telefon numarası",
                        obscurttext: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Gönderi Adresi",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ekrangenisligi / 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Adressssayfammm(
                          controller: gonderiadresikontrol,
                          hintext: "Adres",
                          obscurttext: false),
                      const SizedBox(
                        height: 13,
                      ),
                                           DropdownButtonHideUnderline(
                        child: Consumer(builder: (context, ref, child) {
                          List<ProvinceModel> proviceItems =
                              ref.watch(userProvinceProvider);
                          print("iller: $proviceItems");
                          return DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'İl',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: proviceItems
                                .map((ProvinceModel item) =>
                                    DropdownMenuItem<String>(
                                      value: item.name,
                                      child: Text(
                                        item.name ?? "",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: bizinerdenduydunuz,
                            onChanged: (String? value) {
                              setState(() {
                                bizinerdenduydunuz = value!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: ekrangenisligi / 1.1,
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.grey.shade100,
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
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      DropdownButtonHideUnderline(
                        child: Consumer(builder: (context, ref, child) {
                          List<ProvinceModel> proviceItems =
                              ref.watch(userProvinceProvider);
                          print("iller: $proviceItems");
                          return DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'İlçe',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: proviceItems
                                .map((ProvinceModel item) =>
                                    DropdownMenuItem<String>(
                                      value: item.name,
                                      child: Text(
                                        item.name ?? "",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: bizinerdenduydunuz,
                            onChanged: (String? value) {
                              setState(() {
                                bizinerdenduydunuz = value!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: ekrangenisligi / 1.1,
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.grey.shade100,
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
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Telefonnumarasayfamm(
                          controller: gonderitelefonkontrol,
                          hintext: "İletişim telefon numarası",
                          obscurttext: false),
                      const SizedBox(
                        height: 17,
                      ),


                    BizinerdenduydunScren(),



                      const SizedBox(
                        height: 13,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Checkbox(
                                value: telnoizinvermeenalt,
                                activeColor: Colors.red,
                                onChanged: (bool? value) {
                                  setState(() {
                                    telnoizinvermeenalt = value;
                                  });
                                }),
                            const Text(
                              "GSM ve e-posta adresimin iletişim kanalı olarak kullanılmasını onaylıyorum.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Checkbox(
                                value: iletisimBilgileriGonderiAdresineKopyala,
                                activeColor: Colors.red,
                                onChanged: (bool? value) {
                                  setState(() {
                                    iletisimBilgileriGonderiAdresineKopyala =
                                        value!;
                                  });
                                }),
                            const Text(
                                "İletişim bilgileri ve gönderi bilgilerimin aynı olmasını onaylıyorum.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: ekrangenisligi / 1.4,
                        child: LoginButton(
                          onTap: () {
                            OnayaGecmeMetodu();
                          },
                          text: "Devam",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ADRES BİLGİSİ

class Adressssayfammm extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Adressssayfammm(
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

// İL KONTROL SAYFAM

class ilkontroletmesayfammm extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  ilkontroletmesayfammm(
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

// İLÇE KONTROL ETME SAYFAM

class ilceekontroletmesayfammm extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  ilceekontroletmesayfammm(
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

// TELEFON NO SAYFAMM

class Telefonnumarasayfamm extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Telefonnumarasayfamm(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? advalidate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
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
          keyboardType: TextInputType.number,
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



// BİZİ NERDEN DUYDUN BUTONU

class BizinerdenduydunScren extends StatefulWidget {
  const BizinerdenduydunScren({super.key});

  @override
  State<BizinerdenduydunScren> createState() => _BizinerdenduydunScrenState();
}

class _BizinerdenduydunScrenState extends State<BizinerdenduydunScren> {
  final List<String> itemssnerdenduydun = [
    'Ustam Burada Reklamı',
    'Myk Sınavı',
    'Eğitim',
    'Bayi',
    'Arkadaş',
    'Radyo',
    'Gazete',
    'İnternet ve Sosyal Medya',
  ];


  String? valueuyruk;

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    // var ekranyukseklikayari = ekranAyari.size.height;
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: const Row(
          children: [
            Icon(
              Icons.language,
              size: 16,
              color: Colors.black,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'Bizi nereden duydun?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: itemssnerdenduydun
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ))
            .toList(),
        value: valueuyruk,
        onChanged: (String? valuee) {
          setState(() {
            valueuyruk = valuee;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: ekrangenisligi / 1.1,
          padding: const EdgeInsets.only(left: 6, right: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.white,
            ),
            color: Colors.white,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.grey.shade100,
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
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility:
            MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
