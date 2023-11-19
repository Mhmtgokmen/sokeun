import 'package:flutter/material.dart';
import 'test_message.dart';

class Anasayfabildirimsayasi extends StatefulWidget {
  const Anasayfabildirimsayasi({super.key});

  @override
  State<Anasayfabildirimsayasi> createState() => _AnasayfabildirimsayasiState();
}

class _AnasayfabildirimsayasiState extends State<Anasayfabildirimsayasi> {
  @override
  Widget build(BuildContext context) {

    var ekranayari = MediaQuery.of(context);
    var ekrangenisligi = ekranayari.size.width;
    var ekranyuksekligi = ekranayari.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(""),
      backgroundColor: Colors.white,
      ),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

               Row(
                 children: [

                   SizedBox(
                       width: ekrangenisligi/2.6,
                       child: Image.asset("assetss/anasayfabildirimres/img.png")
                   ),

                   Spacer(),

                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>TestmessageScreen()));
                     },
                     child: SizedBox(
                       width: ekrangenisligi/14,
                         child: Image.asset("assetss/anasayfabildirimres/img_1.png")
                     ),
                   ),

                 ],
               ),

                  SizedBox(height: 20,),

                  SizedBox(
                      width: ekrangenisligi/1,
                      child: Image.asset("assetss/anasayfabildirimres/img_3.png")
                  ),

                  // MESAJLAR KİŞİLER
                  SizedBox(height: 22,),

                  SizedBox(
                      width: ekrangenisligi/1,
                      child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TestmessageScreen()));
                          },
                          child: Image.asset("assetss/anasayfabildirimres/img_2.png")),
                  ),

                  SizedBox(height: 31,),

                  SizedBox(
                    width: ekrangenisligi/1,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TestmessageScreen()));
                        },
                        child: Image.asset("assetss/anasayfabildirimres/img_2.png")),
                  ),

                  SizedBox(height: 31,),

                  SizedBox(
                    width: ekrangenisligi/1,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TestmessageScreen()));
                        },
                        child: Image.asset("assetss/anasayfabildirimres/img_2.png")),
                  ),
                  SizedBox(height: 31,),

                  SizedBox(
                    width: ekrangenisligi/1,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TestmessageScreen()));
                        },
                        child: Image.asset("assetss/anasayfabildirimres/img_2.png")),
                  ),

                  SizedBox(height: 31,),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 250),
                    child: SizedBox(
                      width: ekrangenisligi/1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TestmessageScreen()));
                        },
                          child: Image.asset("assetss/anasayfabildirimres/img_2.png")),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
