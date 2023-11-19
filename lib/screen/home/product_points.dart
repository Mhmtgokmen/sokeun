import 'package:flutter/material.dart';

// ÜRÜN PUANLARI SAYFASI
// SAYFA KULLANILMIYOR......
class urunpuanlariiiiScreenPAGEEEEE extends StatefulWidget {
  const urunpuanlariiiiScreenPAGEEEEE({super.key});

  @override
  State<urunpuanlariiiiScreenPAGEEEEE> createState() => _urunpuanlariiiiScreenPAGEEEEEState();
}

class _urunpuanlariiiiScreenPAGEEEEEState extends State<urunpuanlariiiiScreenPAGEEEEE> {

  late final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Ürün Puanları",style: TextStyle(color: Colors.red[700],
      fontWeight: FontWeight.bold,
        backgroundColor: Colors.white,

      ),),
      centerTitle: true,
       leading: IconButton(
         icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
         onPressed: (){
           Navigator.pop(context);

         },
       ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

               SizedBox(height: 10,),

                // ÜRÜN ARAMA TEXT FİELD

                SizedBox(
                  width: ekrangenisligi/1.09,
                  height: ekranyukseklikayari/13,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:  Colors.grey.shade200,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 20,
                          spreadRadius: 1.0,

                        ),

                        BoxShadow(
                          color:  Colors.grey.shade200,
                          offset: Offset(-5.0, -5.0),
                          blurRadius: 20,
                          spreadRadius: 1.0,

                        ),
                      ],
                    ),

                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ürün ara...",
                              hintStyle: TextStyle(color: Colors.grey,),
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Icon(Icons.search_outlined,color: Colors.grey,),
                              ),

                            ),

                          ),
                        ],
                      ),
                    )
                  ),
                ),

                ///////////////////////////
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                        width: ekrangenisligi/2,
                        child: Image.asset("assetss/foto/img_15.png")),

                    SizedBox(
                        width: ekrangenisligi/2,
                        child: Image.asset("assetss/foto/img_16.png")),

                  ],
                ),

                SizedBox(height: 15,),

                SizedBox(
                    width:ekrangenisligi/1,
                    child: Image.asset("assetss/foto/img_17.png")),

                SizedBox(height: 10,),

                SizedBox(
                    width: ekrangenisligi/1,
                    child: Image.asset("assetss/foto/img_18.png")),


                SizedBox(height: 10,),

                SizedBox(
                    width: ekrangenisligi/1,
                    child: Image.asset("assetss/foto/img_19.png")),


                SizedBox(height: 10,),

                SizedBox(
                    width: ekrangenisligi/1,
                    child: Image.asset("assetss/foto/img_20.png")),


              ],
            ),
          ),
        ),
      ),

    );

  }
}
