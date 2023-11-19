import 'package:flutter/material.dart';
import 'package:sokeun/widgets/start_bottom_nav_bar.dart';
import '../../../widgets/login_button.dart';

class OnaySonScccreeeeeeeen extends StatefulWidget {
  const OnaySonScccreeeeeeeen({super.key});
  @override
  State<OnaySonScccreeeeeeeen> createState() => _OnaySonScccreeeeeeeenState();
}
class _OnaySonScccreeeeeeeenState extends State<OnaySonScccreeeeeeeen> {


  void herseybitti(){
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>bottomnavbarscreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Onay",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[700]),),
        centerTitle: true,
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text("Marshall ClubCard Üyelik başvurunuzu tamamlamak için lütfen Bitir butonuna basınız.",style: TextStyle(
                    color: Colors.black,fontSize: 25,

                  ),),

                 SizedBox(height: 314,),

                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: SizedBox(
                    width: ekrangenisligi/1.3,
                    child: LoginButton(
                        onTap: (){herseybitti();},
                        text: "Bitir"
                    ),
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
