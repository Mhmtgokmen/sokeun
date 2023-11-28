import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sokeun/model/indentity_model.dart';
import 'package:sokeun/model/login_model.dart';
import 'package:sokeun/model/provinces_model.dart';
import 'package:sokeun/providers/login_user_provider.dart';
import 'package:sokeun/providers/provinces_provider.dart';
import 'package:sokeun/screen/register/register_contact_info.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:dio/dio.dart';

import '../../../widgets/login_button.dart';

class SonKullaniciSayfa extends ConsumerStatefulWidget {
  const SonKullaniciSayfa({super.key});

  @override
  ConsumerState<SonKullaniciSayfa> createState() => _SonKullaniciSayfaState();
}

class _SonKullaniciSayfaState extends ConsumerState<SonKullaniciSayfa> {
  final isimmm = TextEditingController();
  final soyisimmm = TextEditingController();
  final kimlikkartii = TextEditingController();
  final dogumtarihi = TextEditingController();
  final dogumyeriii = TextEditingController();
  final mailadresii = TextEditingController();
  final cinsiyet = TextEditingController();
  final tuttugutakimmm = TextEditingController();
  final pantolonbeden = TextEditingController();
  final gomlekbeden = TextEditingController();
  final sifreee = TextEditingController();
  final tekrarsifreee = TextEditingController();
  late ApiService apiService;

  final Formsonkullanici = GlobalKey<FormState>();

  Future<void> iletisimbilgilerinegecismetodu() async {
    apiService = ApiService();
    String firstname = isimmm.text.trim();
    String lastname = soyisimmm.text.trim();
    String identity = kimlikkartii.text.trim();
    String mail = mailadresii.text.trim();
    String team = tuttugutakimmm.text.trim();
    String pantsSize = pantolonbeden.text.trim();
    String shirtSize = gomlekbeden.text.trim();
    String password = sifreee.text.trim();
    String passwordConfrim = tekrarsifreee.text.trim();

    LoginResponse? user = ref.read(loginUserProvider);
    final userPassword = ref.read(userPasswordProvider);
    user!.data.firstname = firstname;
    user.data.lastname = lastname;
    user.data.citizenNumber = identity;
    user.data.email = mail;
    user.data.team = team;
    user.data.pantsSize = pantsSize;
    user.data.shirtSize = shirtSize;
    user.data.bornCityId = selectedProvinceId;
    user.data.gender = selectedGenderId.toString();
    user.data.birthday = formattedDate;
    userPassword.password = password;
    userPassword.confirmPassword = passwordConfrim;

    Map<String, dynamic> data = {
      "identity": identity,
      "firstname": firstname,
      "lastname": lastname,
      "birthday": formattedDate
    };
    if (Formsonkullanici.currentState!.validate()) {
      try {
        Response response = await apiService.post(
          "verify/identity",
          data,
          token: user.data.accessToken,
        );
        IdentityModel identityResponse;
        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = response.data;
          identityResponse = IdentityModel.fromJson(responseData);
          if (Formsonkullanici.currentState!.validate()) {
            _showSnackBar(identityResponse.message);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const soniletisimbilgisialma()));
          }
        } else if (response.statusCode == 401) {
          identityResponse = IdentityModel.fromJson(response.data);
          _showSnackBar(identityResponse.message);
        } else {
          _showSnackBar("Beklenmeyen bir hata oluştu");
        }
      } catch (e) {
        _showSnackBar("Bir hata oluştu. $e");
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  final Map<String, int> items = {
    'Erkek': 1,
    'Kadın': 2,
  };

  String? selectedGender;
  int? selectedGenderId;

  ProvinceModel? selectedProvince;
  int? selectedProvinceId;

  DateTime selectedDate = DateTime.now();
  String formattedDate = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      locale: const Locale('tr', 'TR'),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    formattedDate =
        "${selectedDate.year}-${selectedDate.month}-${selectedDate.day} ${selectedDate.hour}:${selectedDate.minute}:${selectedDate.second}";
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    //

    return Form(
      key: Formsonkullanici,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Son Kullanıcı",
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
                    const SizedBox(
                      height: 10,
                    ),

                    Sonkullanici(
                        controller: isimmm,
                        hintext: "İsim",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    Sonkullanici(
                        controller: soyisimmm,
                        hintext: "Soyisim",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    TCkimliknoistemesayfasi(
                        controller: kimlikkartii,
                        hintext: "Kimlik No",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
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
                            items: items.keys
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
                            value: selectedGender,
                            onChanged: (String? value) {
                              setState(() {
                                selectedGender = value!;
                                selectedGenderId = items[value];
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

                    const SizedBox(
                      height: 15,
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
                      child: Center(
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
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
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${selectedDate.toLocal()}".split(' ')[0],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade400),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () => _selectDate(context),
                                    child: const Text(
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
                    //  Tarihhh(controller: dogumtarihi, hintext: "Doğum Tarihi", obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    DropdownButtonHideUnderline(child: Consumer(
                      builder: (context, ref, child) {
                        List<ProvinceModel> proviceItems =
                            ref.watch(userProvinceProvider);
                        if (proviceItems.isEmpty) {
                          // varsayılan bir değer, mesela bir metin veya boş bir ProvinceModel
                          selectedProvince = ProvinceModel(name: "");
                        }
                        return DropdownButton2<ProvinceModel>(
                          isExpanded: true,
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Dogum Yeri',
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
                          items: proviceItems
                              .map((ProvinceModel item) =>
                                  DropdownMenuItem<ProvinceModel>(
                                    value: item,
                                    child: Text(
                                      item.name ?? "",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedProvince,
                          onChanged: (ProvinceModel? value) {
                            setState(() {
                              selectedProvince = value!;
                              selectedProvinceId = value.id;
                            });
                            print("province id ${value!.id}");
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
                        );
                      },
                    )),

                    const SizedBox(
                      height: 15,
                    ),

                    Sonkullanici(
                        controller: mailadresii,
                        hintext: "Mail Adresi",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    // Sonkullanici(controller: cinsiyet, hintext: "Cinsiyet", obscurttext: false),

                    Sonkullanici(
                        controller: tuttugutakimmm,
                        hintext: "Tuttuğu Takım",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    Sonkullanici(
                        controller: pantolonbeden,
                        hintext: "Pantolon Beden",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    Sonkullanici(
                        controller: gomlekbeden,
                        hintext: "Gömlek Beden",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    Sifreeeeekontrol(
                        controller: sifreee,
                        hintext: "Şifre",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    Sifreeeeekontrol(
                        controller: tekrarsifreee,
                        hintext: "Şifre(Tekrar)",
                        obscurttext: false),

                    const SizedBox(
                      height: 15,
                    ),

                    const SizedBox(
                      height: 26,
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

class Sonkullanici extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Sonkullanici(
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
    //
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

// TARİH

class Tarihhh extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscurttext;

  Tarihhh(
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

// Kimlik No

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

// ŞİFRE KONTROL
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
