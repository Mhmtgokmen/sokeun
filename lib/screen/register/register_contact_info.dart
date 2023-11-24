import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sokeun/model/login_model.dart';
import 'package:sokeun/model/provinces_model.dart';
import 'package:sokeun/model/register_comp_model.dart';
import 'package:sokeun/providers/admin_user_model_provider.dart';
import 'package:sokeun/providers/login_user_provider.dart';
import 'package:sokeun/providers/provinces_provider.dart';
import 'package:sokeun/screen/register/kayitScreeen/OnaySayfasiScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/service/api.service.dart';
import '../../widgets/login_button.dart';
import 'package:dio/dio.dart';

class soniletisimbilgisialma extends ConsumerStatefulWidget {
  const soniletisimbilgisialma({super.key});

  @override
  ConsumerState<soniletisimbilgisialma> createState() =>
      _soniletisimbilgisialmaState();
}

class _soniletisimbilgisialmaState
    extends ConsumerState<soniletisimbilgisialma> {
  // ÜST TARAF
  final adreskontroletme = TextEditingController();
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
  late ApiService apiService;
////////////////

  bool iletisimBilgileriGonderiAdresineKopyala = false;

  Future<void> onayaGecmeMetodu() async {
    apiService = ApiService();
    String address = adreskontroletme.text.trim();
    String deliveryAddress = gonderiadresikontrol.text.trim();
    String contactNumber = telefonkontroletmekontrol.text.trim();

    LoginResponse? user = ref.read(loginUserProvider);
    final password = ref.read(userPasswordProvider);
    final roleId = ref.read(selectedAdminUserRoleProvider);

    Map<String, dynamic> data = {
      "username": "",
      "firstname": user!.data.firstname,
      "lastname": user.data.lastname,
      "email": user.data.email,
      "nation": "Türkiye",
      "address": address,
      "province_id": selectedProvinceId.toString(),
      "district_id": selectedDistricts!.id.toString(),
      "contact_number": contactNumber,
      "user_type": roleId.toString(),
      "identity": user.data.citizenNumber,
      "gender": user.data.gender,
      "team": null,
      "pants_size": "",
      "shirt_size": "",
      "born_city_id": user.data.bornCityId.toString(),
      "is_address_equal_to_delivery": isTextFieldVisible ? "1" : "0", // 1 or 0
      "delivery_address": isTextFieldVisible ? address : deliveryAddress,
      "company_name": "",
      "tax": "",
      "delivery_province_id":
          isTextFieldVisible ? selectedProvinceId.toString() : selectedDeliveryProvinceId.toString(),
      "delivery_district_id": isTextFieldVisible
          ? selectedDistricts!.id.toString()
          : selectedDeliveryDistricts!.id.toString(),
      "tax_number": "",
      "document_name": "",
      "document_number": user.data.documentNumber,
      "password": password.password,
      "password_confirm": password.confirmPassword
    };
    if (Soniletisimkey.currentState!.validate()) {
      if (telnoizinvermeenalt == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Kutuları onaylayın")));
      }
      print(user.data.accessToken);
      try {
        Response response = await apiService.post(
          "https://development.coneexa.com/api/register-complete",
          data,
          token: user.data.accessToken,
        );
        RegisterComplateModel registerResponse;
        if (response.statusCode == 200) {
          Map<String, dynamic> responseDate = response.data;
          registerResponse = RegisterComplateModel.fromJson(responseDate);
          print("Model $responseDate");
          if (Soniletisimkey.currentState!.validate()) {
            if (registerResponse.status == true) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(registerResponse.message),
                  duration: const Duration(seconds: 1),
                ),
              );
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnaySonScccreeeeeeeen()));
            } else {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(registerResponse.message),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          }
          // ignore: use_build_context_synchronously
        } else {
          // API'den beklenmeyen bir cevap geldi
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "Beklenmeyen bir hata oluştu. API'den beklenen format sağlanmadı."),
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

    // if (Soniletisimkey.currentState!.validate()) {
    //   if (telnoizinvermeenalt == false) {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(const SnackBar(content: Text("Kutuları onaylayın")));
    //   } else if (telnoizinvermeenalt == false) {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(const SnackBar(content: Text("Kutuları onaylayın")));
    //   } else {
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => const OnaySonScccreeeeeeeen()));
    //   }
    // }
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
  @override
  void initState() {
    LoginResponse? user = ref.read(loginUserProvider);
    final password = ref.read(userPasswordProvider);
    final roleId = ref.read(selectedAdminUserRoleProvider);

    print("role :$roleId");

    print("adı :${user!.data.firstname}");
    print("soy ad :${user.data.lastname}");
    print("Dogum Trihi :${user.data.birthday}");
    print("email :${user.data.email}");
    print("borncity :${user.data.bornCityId}");
    print("gender :${user.data.gender}");
    print("tc :${user.data.citizenNumber}");
    print("document :${user.data.documentNumber}");
    print("tel :${user.data.phone}");
    print("şifre :${password.password}");
    print("şifret :${password.confirmPassword}");
    // print("şifreTekrar :${user.data.phone}");
    super.initState();
  }

  final Soniletisimkey = GlobalKey<FormState>();
  String? bizinerdenduydunuz;

  ProvinceModel? selectedProvince;
  int? selectedProvinceId;
  Districts? selectedDistricts;
  ProvinceModel? selectedDeliveryProvince;
  int? selectedDeliveryProvinceId;
  Districts? selectedDeliveryDistricts;
  bool? telnoizinvermeenalt = false;

  bool isTextFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    // var ekranyukseklikayari = ekranAyari.size.height;

    return Form(
      key: Soniletisimkey,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                          controller: adreskontroletme,
                          hintext: "Adres",
                          obscurttext: false),
                      const SizedBox(
                        height: 14,
                      ),
                      DropdownButtonHideUnderline(
                        child: Consumer(builder: (context, ref, child) {
                          List<ProvinceModel> proviceItems =
                              ref.watch(userProvinceProvider);
                          return DropdownButton2<ProvinceModel>(
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
                                    DropdownMenuItem<ProvinceModel>(
                                      value: item,
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
                            value: selectedProvince,
                            onChanged: (ProvinceModel? value) {
                              setState(() {
                                selectedProvince = value!;
                                selectedProvinceId = value.id;
                                selectedDistricts = null;
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
                        child: Consumer(
                          builder: (context, ref, child) {
                            List<ProvinceModel> proviceItems =
                                ref.read(userProvinceProvider);
                            ProvinceModel selectedProvince =
                                proviceItems.firstWhere(
                              (province) => province.id == selectedProvinceId,
                              orElse: () => ProvinceModel(),
                            );
                            List<Districts> selectedProvinceDistricts =
                                selectedProvince.districts ?? [];
                            return DropdownButton2<Districts>(
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
                              items: selectedProvinceDistricts
                                  .map((Districts item) =>
                                      DropdownMenuItem<Districts>(
                                        value: item,
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
                              value: selectedDistricts,
                              onChanged: (Districts? value) {
                                setState(() {
                                  selectedDistricts = value!;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: ekrangenisligi / 1.1,
                                padding:
                                    const EdgeInsets.only(left: 6, right: 6),
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
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
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
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Telefonnumarasayfamm(
                        controller: telefonkontroletmekontrol,
                        hintext: "İletişim telefon numarası",
                        obscurttext: false,
                      ),
                      if (!isTextFieldVisible)
                        const SizedBox(
                          height: 15,
                        ),
                      if (!isTextFieldVisible)
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
                      if (!isTextFieldVisible)
                        const SizedBox(
                          height: 12,
                        ),
                      if (!isTextFieldVisible)
                        Adressssayfammm(
                            controller: gonderiadresikontrol,
                            hintext: "Adres",
                            obscurttext: false),
                      if (!isTextFieldVisible)
                        const SizedBox(
                          height: 13,
                        ),
                      if (!isTextFieldVisible)
                        DropdownButtonHideUnderline(
                          child: Consumer(builder: (context, ref, child) {
                            List<ProvinceModel> proviceItems =
                                ref.watch(userProvinceProvider);
                            return DropdownButton2<ProvinceModel>(
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
                                      DropdownMenuItem<ProvinceModel>(
                                        value: item,
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
                              value: selectedDeliveryProvince,
                              onChanged: (ProvinceModel? value) {
                                setState(() {
                                  selectedDeliveryProvince = value!;
                                  selectedDeliveryProvinceId = value.id;
                                  selectedDeliveryDistricts = null;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: ekrangenisligi / 1.1,
                                padding:
                                    const EdgeInsets.only(left: 6, right: 6),
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
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
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
                      if (!isTextFieldVisible)
                        const SizedBox(
                          height: 13,
                        ),
                      if (!isTextFieldVisible)
                        DropdownButtonHideUnderline(
                          child: Consumer(
                            builder: (context, ref, child) {
                              List<ProvinceModel> proviceItems =
                                  ref.read(userProvinceProvider);
                              ProvinceModel selectedProvince =
                                  proviceItems.firstWhere(
                                (province) =>
                                    province.id == selectedDeliveryProvinceId,
                                orElse: () => ProvinceModel(),
                              );
                              List<Districts> selectedProvinceDistricts =
                                  selectedProvince.districts ?? [];
                              return DropdownButton2<Districts>(
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
                                items: selectedProvinceDistricts
                                    .map((Districts item) =>
                                        DropdownMenuItem<Districts>(
                                          value: item,
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
                                value: selectedDeliveryDistricts,
                                onChanged: (Districts? value) {
                                  setState(() {
                                    selectedDeliveryDistricts = value!;
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: ekrangenisligi / 1.1,
                                  padding:
                                      const EdgeInsets.only(left: 6, right: 6),
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
                                    thickness:
                                        MaterialStateProperty.all<double>(6),
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
                          ),
                        ),
                      if (!isTextFieldVisible)
                        const SizedBox(
                          height: 13,
                        ),
                      if (!isTextFieldVisible)
                        Telefonnumarasayfamm(
                            controller: gonderitelefonkontrol,
                            hintext: "İletişim telefon numarası",
                            obscurttext: false),
                      const SizedBox(
                        height: 17,
                      ),
                      if (!isTextFieldVisible) BizinerdenduydunScren(),
                      if (!isTextFieldVisible)
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
                                value: isTextFieldVisible,
                                activeColor: Colors.red,
                                onChanged: (value) {
                                  setState(() {
                                    isTextFieldVisible = value!;
                                    print(value);
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
                            onayaGecmeMetodu();
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
            thumbVisibility: MaterialStateProperty.all<bool>(true),
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
