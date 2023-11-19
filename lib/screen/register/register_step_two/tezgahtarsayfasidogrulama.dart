import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sokeun/model/admin_user_role_model.dart';

import '../../../widgets/login_button.dart';
import '../register_contact_info.dart';

class tezgahtarsayfasiScrenD extends StatefulWidget {
  const tezgahtarsayfasiScrenD({super.key, required this.role});
  final AdminUserRole role;
  @override
  State<tezgahtarsayfasiScrenD> createState() => _tezgahtarsayfasiScrenDState();
}

class _tezgahtarsayfasiScrenDState extends State<tezgahtarsayfasiScrenD> {
  final isimkontrol = TextEditingController();
  final SOYadikontrol = TextEditingController();
  final tCkimliknokontrol = TextEditingController();
  final Dogumtarihikontrol = TextEditingController();
  final DogumYeriiii = TextEditingController();
  final Mailadresikontroletme = TextEditingController();
  final cinsiyetkontroletme = TextEditingController();
  final ilkontroletme = TextEditingController();
  final ilcekontroletme = TextEditingController();
  final bayikontrol = TextEditingController();
  final Sifreeekkontrol = TextEditingController();
  final SifreTekrarKontroletme = TextEditingController();

  void iletisimbilgilerinegecismetodu() {
    if (Formkeytezgahtar.currentState!.validate()) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => soniletisimbilgisialma()));
    }
  }

  final Formkeytezgahtar = GlobalKey<FormState>();

  final List<String> itemss = [
    'Kadın',
    'Erkek',
  ];

  String? kadinerkeksecim;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != selectedDate)
      setState(() {
        selectedDate = picked!;
      });
  }
  @override
  void initState() {
    print(widget.role.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Form(
      key: Formkeytezgahtar,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Tezgahtar",
            style:
                TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),

                    isimsayfasiadisteme(
                        controller: isimkontrol,
                        hintext: "Ad",
                        obscurttext: false),

                    SizedBox(
                      height: 14,
                    ),

                    soyADBilgiisiisteme(
                      controller: SOYadikontrol,
                      hintext: "Soyad",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 14,
                    ),

                    TCkimliknoistemesayfasi(
                      controller: tCkimliknokontrol,
                      hintext: "Kimlik No",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      width: ekrangenisligi / 1.1,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 20,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(-5.0, -5.0),
                            blurRadius: 20,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Doğum Tarihi:",
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${selectedDate.toLocal()}".split(' ')[0],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade400),
                                  ),
                                  Spacer(),
                                  TextButton(
                                    onPressed: () => _selectDate(context),
                                    child: Text(
                                      "Tarih Seç",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  // SizedBox(
                                  //  width: ekrangenisligi/3,
                                  //  child: ElevatedButton(

                                  //  style: ElevatedButton.styleFrom(
                                  //  backgroundColor: Colors.white,

                                  //  ),
                                  //   onPressed: () => _selectDate(context),
                                  //   child: Text('Tarih Seç',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,),),
                                  // ),
                                  //   ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //     Dogumtarihi(controller: Dogumtarihikontrol,hintext: "Doğum Tarihi",obscurttext: false,),

                    SizedBox(
                      height: 14,
                    ),

                    Dogumyeriisayfam(
                      controller: DogumYeriiii,
                      hintext: "Doğum Yeri",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 14,
                    ),

                    MAiLADRESisayfam(
                      controller: Mailadresikontroletme,
                      hintext: "Mail Adresi",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 14,
                    ),

                    //  Cinsiyetkontrolsayfam(controller: cinsiyetkontroletme,hintext: "Cinsiyet",obscurttext: false,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Cinsiyet',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade400,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: itemss
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: kadinerkeksecim,
                            onChanged: (String? valuee) {
                              setState(() {
                                kadinerkeksecim = valuee!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: ekrangenisligi / 1.1,
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
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
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 20,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(-5.0, -5.0),
                                    blurRadius: 20,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(20),
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
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 14,
                    ),

                    ilkontroletmesayfammm(
                      controller: ilkontroletme,
                      hintext: "İl",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 14,
                    ),

                    ilceekontroletmesayfammm(
                      controller: ilcekontroletme,
                      hintext: "İlçe",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 14,
                    ),

                    Bayisayfammm(
                      controller: bayikontrol,
                      hintext: "Bayi",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 14,
                    ),

                    Sifrekontrolsayfam(
                      controller: Sifreeekkontrol,
                      hintext: "Şifre",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 14,
                    ),

                    SifreTekrarkontroledildisayfam(
                      controller: SifreTekrarKontroletme,
                      hintext: "Şifre(Tekrar)",
                      obscurttext: false,
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    SizedBox(
                      width: ekrangenisligi / 1.3,
                      child: LoginButton(
                        onTap: () {
                          iletisimbilgilerinegecismetodu();
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
    );
  }
}

// İSİM İSTEME TEXTFİELD

class isimsayfasiadisteme extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  isimsayfasiadisteme(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? advalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!!";
    }
    if (value.length < 2) {
      return "Adınızı 2 harften büyük olacak şekilde giriniz";
    }
    if (value.length == 2) {
      return "Adınızı 2 harften büyük olacak şekilde giriniz";
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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

// SOYAD İSTEME TEXTFİLED

class soyADBilgiisiisteme extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  soyADBilgiisiisteme(
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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

///// T C KİMLİK NO İSTEME SAYFASİ

class TCkimliknoistemesayfasi extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  TCkimliknoistemesayfasi(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator
  String? tcvalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Kimlik numaranızı giriniz!!!";
    }
    if (value.length < 11) {
      return "11 haneli olacak şekilde giriniz";
    }
    if (value.length > 11) {
      return "11 haneli olacak şekilde giriniz";
    }
    if (value.length == 11) {}
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          obscureText: obscurttext,
          validator: tcvalidate,
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

// DOĞUM TARİHİ  TEXTFİED

class Dogumtarihi extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Dogumtarihi(
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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

// DOĞUM YERİ TEXTFİELD

class Dogumyeriisayfam extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Dogumyeriisayfam(
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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

// MAİL ADRESİ TEXTFİELD

class MAiLADRESisayfam extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  MAiLADRESisayfam(
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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

// CİNSİYET KONTROL ETME

class Cinsiyetkontrolsayfam extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Cinsiyetkontrolsayfam(
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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

// BAYİİİ SAYFAMM

class Bayisayfammm extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Bayisayfammm(
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
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

// ŞİFRE SAYFAMMM

class Sifrekontrolsayfam extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Sifrekontrolsayfam(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? Sifrevalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!!";
    }

    if (value.length < 4) {
      return "Şifrenizi en az 4 haneli olacak şekilde giriniz";
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: controller,
          obscureText: true,
          validator: Sifrevalidate,
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

// Şifre kontrol Tekrar

class SifreTekrarkontroledildisayfam extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  SifreTekrarkontroledildisayfam(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscurttext});
// Validator

  String? Sifrevalidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Zorunlu alan!!!";
    }

    if (value.length < 4) {
      return "Şifrenizi en az 4 haneli olacak şekilde giriniz";
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
              offset: Offset(5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-5.0, -5.0),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: controller,
          obscureText: true,
          validator: Sifrevalidate,
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
