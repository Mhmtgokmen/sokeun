import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/model/admin_user_role_model.dart';
import 'package:sokeun/model/indentity_model.dart';
import 'package:sokeun/model/login_model.dart';
import 'package:sokeun/model/provinces_model.dart';
import 'package:sokeun/providers/login_user_provider.dart';
import 'package:sokeun/providers/provinces_provider.dart';
import 'package:sokeun/screen/register/register_contact_info.dart';
import 'package:sokeun/service/api.service.dart';
import '../../../widgets/login_button.dart';

class TezgahtarsayfasiScrenD extends ConsumerStatefulWidget {
  final AdminUserRole role;
  const TezgahtarsayfasiScrenD({super.key, required this.role});
  @override
  ConsumerState<TezgahtarsayfasiScrenD> createState() =>
      _TezgahtarsayfasiScrenDState();
}

class _TezgahtarsayfasiScrenDState
    extends ConsumerState<TezgahtarsayfasiScrenD> {
  final isimkontrol = TextEditingController();
  final soyadikontrol = TextEditingController();
  final tckimliknokontrol = TextEditingController();
  final dogumtarihikontrol = TextEditingController();
  final dogumYeri = TextEditingController();
  final mailadresikontroletme = TextEditingController();
  final cinsiyetkontroletme = TextEditingController();
  final ilkontroletme = TextEditingController();
  final ilcekontroletme = TextEditingController();
  final bayikontrol = TextEditingController();
  final sifrekkontrol = TextEditingController();
  final sifreTekrarKontroletme = TextEditingController();
  late ApiService apiService;

  Future<void> iletisimbilgilerinegecismetodu() async {
    apiService = ApiService();
    AdminUserRole selectedRole = widget.role;
    print("Roleler $selectedRole");
    String firstname = isimkontrol.text.trim();
    String lastname = soyadikontrol.text.trim();
    String mail = mailadresikontroletme.text.trim();
    String identity = tckimliknokontrol.text.trim();
    String bayi = bayikontrol.text.trim();
    String password = sifrekkontrol.text.trim();
    String passwordConfirm = sifreTekrarKontroletme.text.trim();
    LoginResponse? user = ref.read(loginUserProvider);
    final userPassword = ref.read(userPasswordProvider);

    user!.data.firstname = firstname;
    user.data.lastname = lastname;
    user.data.citizenNumber = identity;
    user.data.birthday = formattedDate;
    user.data.bornCityId = selectedBornCityId;
    user.data.email = mail;
    user.data.gender = selectedGenderId.toString();
    user.data.provinceId = selectedProvinceId;
    user.data.districtId = selectedDistricts!.id;
    user.data.companyName = bayi;
    userPassword.password = password;
    userPassword.confirmPassword = passwordConfirm;

    Map<String, dynamic> data = {
      "identity": identity,
      "firstname": firstname,
      "lastname": lastname,
      "birthday": formattedDate //2023-10-29 18:01:54
    };
    print("Date : $selectedDate");
    if (Formkeytezgahtar.currentState!.validate()) {
      try {
        var response = await apiService.post(
          "verify/identity",
          data,
          token: user.data.accessToken,
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> responseDate = response.data;
          IdentityModel identityResponse = IdentityModel.fromJson(responseDate);
          print("Model $responseDate");
          if (identityResponse.status == true) {
            if (Formkeytezgahtar.currentState!.validate()) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(identityResponse.message),
                  duration: const Duration(seconds: 1),
                ),
              );
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const soniletisimbilgisialma(),
                ),
              );
            }
          } else {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(identityResponse.message),
                duration: const Duration(seconds: 2),
              ),
            );
          }
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
  }

  @override
  void initState() {
    print(widget.role.id);
    super.initState();
  }

  final Formkeytezgahtar = GlobalKey<FormState>();

  final Map<String, int> items = {
    'Erkek': 1,
    'Kadın': 2,
  };

  String? selectedGender;
  int? selectedGenderId;
  ProvinceModel? selectedProvince;
  int? selectedProvinceId;
  Districts? selectedDistricts;
  DateTime selectedDate = DateTime.now();
  String formattedDate = "";
  ProvinceModel? selectedBornCity;
  int? selectedBornCityId;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    formattedDate =
        "${selectedDate.year}-${selectedDate.month}-${selectedDate.day} ${selectedDate.hour}:${selectedDate.minute}:${selectedDate.second}";

    print("Doğum tarihi: $formattedDate");
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    } else {
      return "0$n";
    }
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    // var ekranyukseklikayari = ekranAyari.size.height;

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
                    const SizedBox(
                      height: 10,
                    ),

                    isimsayfasiadisteme(
                        controller: isimkontrol,
                        hintext: "Ad",
                        obscurttext: false),

                    const SizedBox(
                      height: 14,
                    ),

                    soyADBilgiisiisteme(
                      controller: soyadikontrol,
                      hintext: "Soyad",
                      obscurttext: false,
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    TCkimliknoistemesayfasi(
                      controller: tckimliknokontrol,
                      hintext: "Kimlik No",
                      obscurttext: false,
                    ),

                    const SizedBox(
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
                    //     Dogumtarihi(controller: Dogumtarihikontrol,hintext: "Doğum Tarihi",obscurttext: false,),

                    const SizedBox(
                      height: 14,
                    ),

                    DropdownButtonHideUnderline(child: Consumer(
                      builder: (context, ref, child) {
                        List<ProvinceModel> proviceItems =
                            ref.watch(userProvinceProvider);
                        if (proviceItems.isEmpty) {
                          selectedBornCity = ProvinceModel(name: "");
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
                          value: selectedBornCity,
                          onChanged: (ProvinceModel? value) {
                            setState(() {
                              selectedBornCity = value!;
                              selectedBornCityId = value.id;
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
                        );
                      },
                    )),

                    const SizedBox(
                      height: 14,
                    ),

                    MAiLADRESisayfam(
                      controller: mailadresikontroletme,
                      hintext: "Mail Adresi",
                      obscurttext: false,
                    ),

                    const SizedBox(
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
                      height: 14,
                    ),

                    DropdownButtonHideUnderline(child: Consumer(
                      builder: (context, ref, child) {
                        List<ProvinceModel> proviceItems =
                            ref.watch(userProvinceProvider);
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
                                  'İl',
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
                              selectedDistricts = null;
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
                        );
                      },
                    )),

                    const SizedBox(
                      height: 14,
                    ),

                    DropdownButtonHideUnderline(child: Consumer(
                      builder: (context, ref, child) {
                        List<ProvinceModel> proviceItems =
                            ref.watch(userProvinceProvider);
                        ProvinceModel selectedProvince =
                            proviceItems.firstWhere(
                          (province) => province.id == selectedProvinceId,
                          orElse: () => ProvinceModel(),
                        );
                        List<Districts> selectedProvinceDistricts =
                            selectedProvince.districts ?? [];
                        return DropdownButton2<Districts>(
                          isExpanded: true,
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'İlçe',
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
                          items: selectedProvinceDistricts
                              .map((Districts item) =>
                                  DropdownMenuItem<Districts>(
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
                          value: selectedDistricts,
                          onChanged: (Districts? value) {
                            setState(() {
                              selectedDistricts = value!;
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
                        );
                      },
                    )),

                    const SizedBox(
                      height: 14,
                    ),

                    Bayisayfammm(
                      controller: bayikontrol,
                      hintext: "Bayi",
                      obscurttext: false,
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    Sifrekontrolsayfam(
                      controller: sifrekkontrol,
                      hintext: "Şifre",
                      obscurttext: false,
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    SifreTekrarkontroledildisayfam(
                      controller: sifreTekrarKontroletme,
                      hintext: "Şifre(Tekrar)",
                      obscurttext: false,
                    ),

                    const SizedBox(
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
