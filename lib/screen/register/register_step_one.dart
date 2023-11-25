import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sokeun/model/admin_user_role_model.dart';
import 'package:sokeun/model/login_model.dart';
import 'package:sokeun/providers/admin_user_model_provider.dart';
import 'package:sokeun/providers/login_user_provider.dart';
import 'package:sokeun/screen/register/register_step_two/bayisayfasiscreeen.dart';
import 'package:sokeun/screen/register/register_step_two/sonkullanicisayfasi.dart';
import '../../widgets/login_button.dart';
import 'register_step_two/tezgahtarsayfasidogrulama.dart';
import 'register_step_two/ustasayfasidogrulama.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginaltButonGiris extends ConsumerStatefulWidget {
  const LoginaltButonGiris({super.key});

  @override
  ConsumerState<LoginaltButonGiris> createState() => _LoginaltButonGirisState();
}

class _LoginaltButonGirisState extends ConsumerState<LoginaltButonGiris> {
  void uyeliktipisonrakiekran() {
    LoginResponse? user = ref.read(loginUserProvider);
    user!.data.nation = selectedNation;
    List<AdminUserRole> roleItems = ref.watch(adminUserRoleProvider);

    AdminUserRole selectedRole = roleItems
        .firstWhere((role) => role.adminUserType.name == selectedValueson);
    ref.read(selectedAdminUserRoleProvider.notifier).state = selectedRole.id;
    if (selectedRole.adminUserType.name == "Tezgahtar") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TezgahtarsayfasiScrenD(
                    role: selectedRole,
                  )));
    } else if (selectedRole.adminUserType.name == 'Usta') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ustasayfasiScreeeenD(role: selectedRole)));
    } else if (selectedRole.adminUserType.name == "Bayi") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BayiSayfamScreeen()));
    } else if (selectedRole.adminUserType.name == 'Müşteri') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const sonkullaniciSayfamEren()));
    }
  }

  final _formkey = GlobalKey<FormState>();

  final Map<String, int> nation = {
    'T.C': 1,
    'K.K.T.C': 2,
  };

  String? selectedNation;
  int? selectedNationId;

  String? selectedValueson;

  @override
  Widget build(BuildContext context) {
    // ekran sığdırma kodları

    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;
    //
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Üyelik Tipi",
            style:
                TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Consumer(builder: (context, ref, child) {
                LoginResponse? userLoginInformation =
                    ref.watch(loginUserProvider);
                String password = ref.watch(loginPasswordProvider);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: ekrangenisligi / 1.1,
                      height: ekranyukseklikayari / 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "Telefon Numaranız: ${userLoginInformation?.data.phone}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: ekrangenisligi / 1.1,
                      height: ekranyukseklikayari / 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "SMS Şifresi: $password",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Uyruk',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: nation.keys
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedNation,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedNation = value!;
                                    selectedNationId = nation[value];
                                  });
                                  print("Gender id:$selectedNationId");
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: ekrangenisligi / 2.2,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    color: Colors.red,
                                  ),
                                  elevation: 2,
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: Colors.grey,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.red.shade200,
                                  ),
                                  offset: const Offset(-20, 0),
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
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            DropdownButtonHideUnderline(
                              child: Consumer(builder: (context, ref, child) {
                                List<AdminUserRole> roleItems =
                                    ref.read(adminUserRoleProvider);
                                print("Roller $roleItems");
                                return DropdownButton2(
                                  isExpanded: true,
                                  hint: const Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Üyelik Tipi',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: roleItems
                                      .map((AdminUserRole item) =>
                                          DropdownMenuItem<String>(
                                            value: item.adminUserType.name,
                                            child: Text(
                                              item.adminUserType.name,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValueson,
                                  onChanged: (String? valuee) {
                                    setState(() {
                                      selectedValueson = valuee!;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: ekrangenisligi / 2.2,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      color: Colors.red,
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.red.shade200,
                                    ),
                                    offset: const Offset(-20, 0),
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
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                );
                              }),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 310,
                    ),
                    SizedBox(
                      width: ekrangenisligi / 1.3,
                      child: LoginButton(
                          onTap: () {
                            uyeliktipisonrakiekran();
                          },
                          text: "Sonraki"),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

// ÜYELİK VE UYRUK SAYFALARI

class controletmeUyruk extends StatefulWidget {
  const controletmeUyruk({super.key});

  @override
  State<controletmeUyruk> createState() => _controletmeUyrukState();
}

class _controletmeUyrukState extends State<controletmeUyruk> {
  final List<String> items = [
    'T.C',
    'K.K.T.C',
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
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'Uyruk',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
          width: ekrangenisligi / 2.2,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.white,
            ),
            color: Colors.red,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.red.shade200,
          ),
          offset: const Offset(-20, 0),
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
