import 'package:flutter/material.dart';
import 'package:sokeun/screen/login/login_screen.dart';

// PROFİL SAYFASI

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {

    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Scaffold(

      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(
                  width: ekrangenisligi/1.3,
                  child: Image.asset("assetss/foto/img_38.png")),

              SizedBox(height: 20,),

              Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                 width: ekrangenisligi/1.2,
                 height:ekranyukseklikayari/14 ,
                 child: GestureDetector(
                  onTap: (){
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>telnoilksayfa()), (route) => false);
                   },
                   child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.red[800],

                     ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                        Text("Çıkış Yap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)

                      ],
                    ),
                  ),
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
