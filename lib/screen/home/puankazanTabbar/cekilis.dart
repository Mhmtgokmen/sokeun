import 'package:flutter/material.dart';
import 'package:sokeun/screen/home/qr_screen.dart';
// TABS KOD

class kodilepuankazanScreeenPAGEE extends StatefulWidget {
  const kodilepuankazanScreeenPAGEE({super.key});

  @override
  State<kodilepuankazanScreeenPAGEE> createState() =>
      _kodilepuankazanScreeenPAGEEState();
}

class _kodilepuankazanScreeenPAGEEState
    extends State<kodilepuankazanScreeenPAGEE> {
  @override
  Widget build(BuildContext context) {
    var ekranayari = MediaQuery.of(context);
    var ekrangenisligi = ekranayari.size.width;
    var ekranyuksekligi = ekranayari.size.height;

    return Scaffold(
      backgroundColor: Colors.red[700],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: ekrangenisligi / 1,
                height: ekranyuksekligi / 1.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red[700],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 1.2,
                            child: Image.asset("assetss/foto/img_31.png")),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: ekrangenisligi / 1.1,
                          height: ekranyuksekligi / 11,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: ekrangenisligi / 1.2,
                                        child: Image.asset("assetss/foto/img_33.png")),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 3,
                            child: Image.asset("assetss/foto/img_34.png")),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 1.1,
                            child: Image.asset("assetss/foto/img_35.png")),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: ekrangenisligi / 1.5,
                          height: ekranyuksekligi / 14.7,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: ekranyuksekligi / 2.7,
                                      child: Center(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                  width: ekrangenisligi / 1.1,
                                                  child: Image.asset(
                                                      "assetss/foto/img_30.png")),
                                              SizedBox(
                                                height: 21,
                                              ),
                                              SizedBox(
                                                width: ekrangenisligi / 1.8,
                                                height: ekranyuksekligi / 16,
                                                child: GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> QrKodScreen()));
                                                  },
                                                  child: Image.asset(
                                                      "assetss/foto/img_44.png"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                width: ekrangenisligi / 1.8,
                                                height: ekranyuksekligi / 16,
                                                child: Image.asset(
                                                    "assetss/foto/img_43.png"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Hediye Aç!",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 1.1,
                            child: Image.asset("assetss/foto/img_36.png")),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 4,
                            child: Image.asset("assetss/logo.png")),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
