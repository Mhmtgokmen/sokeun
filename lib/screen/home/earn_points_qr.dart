import 'package:flutter/material.dart';

// ORTA TUŞA BASILDIĞINDA BU SAYFA AÇILIR VE BOTTOMNAVBAR SAYFASINDAKİ showModalBottomSheet AÇILIR

class ORtatusyuvarlakScreeenKodokutma extends StatefulWidget {
  const ORtatusyuvarlakScreeenKodokutma({super.key});

  @override
  State<ORtatusyuvarlakScreeenKodokutma> createState() =>
      _ORtatusyuvarlakScreeenKodokutmaState();
}

class _ORtatusyuvarlakScreeenKodokutmaState
    extends State<ORtatusyuvarlakScreeenKodokutma> {
  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],

        actions: [
          SizedBox(
              width: ekrangenisligi/1.5,
              child: GestureDetector(
                  onTap: (){

                  },
                  child: Image.asset("assetss/earn_points_qr_assets/img.png")))
        ],

        leading:  IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.red[800],
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: ekrangenisligi / 1,
                 height: ekranyukseklikayari/1.2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[800],
                      image: DecorationImage(
                          image: AssetImage(
                        "assetss/foto/img_25.png",
                      )),
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: ekrangenisligi / 2,
                                child: Image.asset("assetss/foto/img_29.png"))
                          ],
                        ),
                      ),
                    ),
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
