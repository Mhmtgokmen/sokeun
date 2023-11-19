import 'package:flutter/material.dart';
import 'package:sokeun/screen/home/home_page.dart';
import 'package:sokeun/widgets/earn_points_tab_bar.dart';
import 'package:sokeun/screen/home/campaign.dart';
import 'package:sokeun/screen/home/user_profile.dart';
import 'package:sokeun/screen/home/earn_points_qr.dart';

// BOTTOM NAVİGATİON BAR

class bottomnavbarscreen extends StatefulWidget {
  const bottomnavbarscreen({super.key});

  @override
  State<bottomnavbarscreen> createState() => _bottomnavbarscreenState();
}

class _bottomnavbarscreenState extends State<bottomnavbarscreen> {
  var sayfalar = [
    homePagesCreen(),
    puankazanbildirimScreeen(),
    cekilisPageScreeen(),
    profileScreen()
  ];
  int sayfatakip = 0;

  @override
  Widget build(BuildContext context) {
    var ekranayari = MediaQuery.of(context);
    var ekrangenisligi = ekranayari.size.width;
    var ekranyuksekligi = ekranayari.size.height;

    return Scaffold(
      body: sayfalar[sayfatakip],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[700],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Ana Sayfa"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
              ),
              label: "Puan Kazan"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer_outlined,
              ),
              label: "Kampanyalar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profil"),
        ],
        currentIndex: sayfatakip,
        onTap: (int index) {
          setState(() {
            sayfatakip = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[500],
        child: const Icon(
          Icons.qr_code,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ORtatusyuvarlakScreeenKodokutma()));

          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              builder: (BuildContext context) {
                return SizedBox(
                  height: ekranyuksekligi / 2.7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 1.3,
                            child: Image.asset("assetss/foto/img_30.png")),
                        SizedBox(
                          height: 19,
                        ),
                        SizedBox(
                          width: ekrangenisligi / 1.8,
                          height: ekranyuksekligi / 16,
                          child: Image.asset("assetss/foto/img_44.png"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: ekrangenisligi / 1.8,
                          height: ekranyuksekligi / 16,
                          child: Image.asset("assetss/foto/img_43.png"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: ekrangenisligi / 1.8,
                          height: ekranyuksekligi / 16,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assetss/foto/img_42.png"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
