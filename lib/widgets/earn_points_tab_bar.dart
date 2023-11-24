import 'package:flutter/material.dart';
import 'package:sokeun/screen/home/puankazanTabbar/cekilis.dart';
import 'package:sokeun/screen/home/puankazanTabbar/earn_by_video.dart';
import 'package:sokeun/screen/home/puankazanTabbar/earn_by_anket.dart';
import 'package:sokeun/screen/home/puankazanTabbar/earn_by_code.dart';

// TAB BAR BAĞLAMA SAYFASI  PUAN KAZAN SAYFASINDA TABS YAPILARI VAR PUAN KAZAN SAYFASI
// AŞAĞIDAKİ PUANKAZAN TABBAR SAYFALARI İLE BAĞLANTILIDIR

class puankazanbildirimScreeen extends StatefulWidget {
  const puankazanbildirimScreeen({super.key});

  @override
  State<puankazanbildirimScreeen> createState() =>
      _puankazanbildirimScreeenState();
}

class _puankazanbildirimScreeenState extends State<puankazanbildirimScreeen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
            //  indicatorWeight: 2,
            //  enableFeedback: true,
              isScrollable: true,
              indicatorColor: Colors.red,
              unselectedLabelColor: Colors.red[600],
              labelColor: Colors.red[800],
              tabs: [
                Tab(
                  text: "Kod ile",
                ),
                Tab(
                  text: "Video izle",
                ),
                Tab(
                  text: "Anket çöz",
                ),
                Tab(
                  text: "Çekilişe katıl",
                ),
              ],
            ),
            title: Text(
              "Puan Kazan",
              style: TextStyle(
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              kodilepuankazanScreeenPAGEE(),
              VideokodilepuankazanScreeenPAGEE(),
              ANKETCOZVideokodilepuankazanScreeenPAGEE(),
              cekilisScreeenPAGEE(),
            ],
          ),
        ));
  }
}
