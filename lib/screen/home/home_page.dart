import 'package:flutter/material.dart';
import 'package:sokeun/model/admin_user_role_model.dart';
import 'package:sokeun/model/login_model.dart';
import 'package:sokeun/providers/admin_user_model_provider.dart';
import 'package:sokeun/providers/login_user_provider.dart';
import 'package:sokeun/screen/home/user_history.dart';
import 'package:sokeun/screen/home/campaign.dart';
import 'package:sokeun/anasayfabildirimsayfasi/Anasayfabildirim.dart';
import 'package:sokeun/widgets/earn_points_tab_bar.dart';
import 'choose_gift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/anasayfabildirimsayfasi/test_message.dart';

// ANA SAYFA HOME PAGE

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends ConsumerState<HomePageScreen> {
  String membershipType = "";
  @override
  Widget build(BuildContext context) {
    /// Ekran Sığdırma
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    ///////////////////////////////////////////

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),

                Consumer(
                  builder: (context, ref, child) {
                    LoginResponse? user = ref.read(loginUserProvider);
                    List<AdminUserRole> roleItems =
                        ref.read(adminUserRoleProvider);

                    if (user!.data.adminUserRolesId != null) {
                      AdminUserRole? matchedRole = roleItems.firstWhere(
                          (role) => role.id == user.data.adminUserRolesId);
                      if (user.data.adminUserRolesId == matchedRole.id) {
                        membershipType = matchedRole.adminUserType.name;
                      }
                    }
                    return SizedBox(
                      width: ekrangenisligi / 1.05,
                      height: ekranyukseklikayari / 4.6,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red[900],
                        ),
                        child: Center(
                          child: SafeArea(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 11,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.help_outline_sharp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 90),
                                        child: Text(
                                          "Ana Sayfa",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: IconButton(
                                          icon: const Icon(Icons.email),
                                          color: Colors.white,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Anasayfabildirimsayasi()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      SizedBox(
                                        width: ekrangenisligi * 0.2,
                                        height: ekranyukseklikayari * 0.1,
                                        child: Image.asset(
                                          "assetss/foto/profile.png",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${user.data.firstname} ${user.data.lastname}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                           Text(
                                            membershipType,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "${user.data.points.toString()} Puan",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(
                  height: 14,
                ),

                /////// Hediyeler
                SizedBox(
                  width: ekrangenisligi / 1.05,
                  height: ekranyukseklikayari / 11.8,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChoosegiffScreen()));
                      //     urunpuanlariiiiScreenPAGEEEEE()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(3, 3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(-3, -3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                        height: ekranyukseklikayari / 14,
                                        child: Image.asset(
                                          "assetss/homescreenassets/urunp.png",
                                        )),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        "Hediyeler",
                                        style: TextStyle(
                                          color: Colors.red[700],
                                          fontSize: ekrangenisligi / 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),

                ////////////////////////////////////

                ///////// KAMPANYALAR
                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  width: ekrangenisligi / 1.05,
                  height: ekranyukseklikayari / 11.7,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CekilisPageScreen()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(3, 3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(-3, -3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red[800],
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                        height: ekranyukseklikayari / 13,
                                        child: Image.asset(
                                          "assetss/homescreenassets/kampanyalar.png",
                                        )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        "Kampanyalar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ekrangenisligi / 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),

                ///////////////////////

                //////////////////////// 2023 YILI ADETLER

                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  width: ekrangenisligi / 1.05,
                  height: ekranyukseklikayari / 3.2,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(3, 3),
                          blurRadius: 13.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(-3, -3),
                          blurRadius: 13.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.6,
                                child: Image.asset("assetss/foto/img_3.png")),
                            const SizedBox(
                              height: 11,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.2,
                                child: Image.asset("assetss/foto/img_5.png")),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.1,
                                child: Image.asset("assetss/foto/img_6.png")),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.1,
                                child: Image.asset("assetss/foto/img_7.png")),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.1,
                                child: Image.asset("assetss/foto/img_8.png")),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.1,
                                child: Image.asset("assetss/foto/img_9.png")),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.1,
                                child: Image.asset("assetss/foto/img_9.png")),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.1,
                                child: Image.asset("assetss/foto/img_9.png")),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: ekrangenisligi / 1.1,
                                child: Image.asset("assetss/foto/img_9.png")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
//////////////////////////////////////////////////////////////////////////////////

///// İŞLEMLER
                const SizedBox(
                  height: 12,
                ),

                SizedBox(
                  width: ekrangenisligi / 1.05,
                  height: ekranyukseklikayari / 11.7,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const islemlersayfamPAgeeeeee()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(3, 3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(-3, -3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: SizedBox(
                                          width: ekrangenisligi / 1.7,
                                          child: Image.asset(
                                              "assetss/homescreenassets/img_5.png")),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),

///////////////////////////////////////////////////////////////
                const SizedBox(
                  height: 12,
                ),

                SizedBox(
                  width: ekrangenisligi / 1.05,
                  height: ekranyukseklikayari / 11.7,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestmessageScreen()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(3, 3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(-3, -3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.mail,
                                      color: Colors.red[600],
                                      size: ekrangenisligi / 10,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        "Destek talebi",
                                        style: TextStyle(
                                          color: Colors.red[700],
                                          fontSize: ekrangenisligi / 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),

                ///// HEDİYE PUAN KAZAN

                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  width: ekrangenisligi / 1.05,
                  height: ekranyukseklikayari / 7,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const puankazanbildirimScreeen()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(3, 3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(-3, -3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red[900],
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: ekrangenisligi / 1.1,
                                        child: Image.asset(
                                            "assetss/foto/img_12.png")),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
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
