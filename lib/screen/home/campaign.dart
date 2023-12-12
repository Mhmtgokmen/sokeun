import 'package:flutter/material.dart';

// KAMPANYALAR SAYFASI

class cekilisPageScreeen extends StatefulWidget {
  const cekilisPageScreeen({super.key});

  @override
  State<cekilisPageScreeen> createState() => _cekilisPageScreeenState();
}

class _cekilisPageScreeenState extends State<cekilisPageScreeen> {
  @override
  Widget build(BuildContext context) {
    /// Ekran Sığdırma

    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kampanyalar",
          style: TextStyle(
            color: Colors.red[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 250),
                child: SizedBox(
                    width: ekrangenisligi / 1,
                    child: Image.asset("assetss/foto/img_22.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
