import 'package:flutter/material.dart';

class yenikodilepuankazanScreeenPAGEE extends StatefulWidget {
  const yenikodilepuankazanScreeenPAGEE({super.key});

  @override
  State<yenikodilepuankazanScreeenPAGEE> createState() =>
      _yenikodilepuankazanScreeenPAGEEState();
}

class _yenikodilepuankazanScreeenPAGEEState
    extends State<yenikodilepuankazanScreeenPAGEE> {
  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.red[700],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: ekrangenisligi / 1,
                height: ekranyukseklikayari / 1.4,
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
                            width: ekrangenisligi / 1.2,
                            child: Image.asset("assetss/foto/img_31.png")),
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: ekrangenisligi / 1.1,
                          height: ekranyukseklikayari / 11,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            child: Center(
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
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: ekrangenisligi / 3,
                          child: Image.asset("assetss/foto/img_34.png"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 1.1,
                            child: Image.asset("assetss/foto/img_35.png")),
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: ekrangenisligi / 1.5,
                          height: ekranyukseklikayari / 14.7,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: ekranyukseklikayari / 2.7,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                                width: ekrangenisligi / 1.1,
                                                child: Image.asset(
                                                    "assetss/foto/img_30.png")),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            SizedBox(
                                              width: ekrangenisligi / 1.8,
                                              height: ekranyukseklikayari / 16,
                                              child: Image.asset(
                                                  "assetss/foto/img_44.png"),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            SizedBox(
                                              width: ekrangenisligi / 1.8,
                                              height: ekranyukseklikayari / 16,
                                              child: Image.asset(
                                                  "assetss/foto/img_43.png"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
//SHOW MODEL BOTTOM SHEET
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              child: const Center(
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
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 1.1,
                            child: Image.asset("assetss/foto/img_36.png")),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: ekrangenisligi / 3,
                            child: Image.asset("assetss/foto/img_37.png")),
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
