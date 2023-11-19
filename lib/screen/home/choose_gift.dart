import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ChoosegiffScreen extends StatefulWidget {
  const ChoosegiffScreen({super.key});

  @override
  State<ChoosegiffScreen> createState() => _ChoosegiffScreenState();
}

class _ChoosegiffScreenState extends State<ChoosegiffScreen> {

  final Hediyeara = TextEditingController();

  final List<String> tumuitems = [
    '',
    '',
    '',
    '',
  ];

  final List<String> artanitems = [
    '',
    '',
    '',
    '',
  ];

  String? tumuitemscontrol;
  String? artanitemskontrol;

  final String selectedPhoto_1 =  'assetss/hediyesec_assets/img.png'; // Gösterilecek fotoğrafın yolu
  final String selectedPhoto_2 =  'assetss/hediyesec_assets/img_1.png'; // Gösterilecek fotoğrafın yolu
  final String selectedPhoto_3 =  'assetss/hediyesec_assets/img_2.png'; // Gösterilecek fotoğrafın yolu
  final String selectedPhoto_4 =   'assetss/hediyesec_assets/img_2.png';// Gösterilecek fotoğrafın yolu

  List<String> cart = [];

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        title: Text("Hediye Seç",style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(height: 10,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: ekrangenisligi/1.02,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,

                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Row(
                          children: [
                            Container(
                              width: ekrangenisligi/2.1,
                              height: 47,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red[600],

                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text("Standart Usta",style: TextStyle(color: Colors.white,fontSize: 18,),)),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text("Kullanılabilir Puan\n              100",
                                style: TextStyle(color: Colors.red[600], fontSize: 16,
                                fontWeight: FontWeight.w500,),),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 22,),

              SizedBox(
                width: ekrangenisligi / 1.1,
               child: Container(
                 decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 10,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(-5.0, -5.0),
                    blurRadius: 20,
                    spreadRadius: 1.0,
                  ),
                ],
                 ),
                 child: TextField(
                    keyboardType: TextInputType.text,
                    controller: Hediyeara,
                    obscureText: false,
                  // validator: validateTelefon,
                    decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Hediye ara...',
                    icon: Icon(Icons.search,color: Colors.grey,),
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
            ),
          ),

             SizedBox(height: 25,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint:  Row(
                          children: [

                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Tümü',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: tumuitems
                            .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        value: tumuitemscontrol,
                        onChanged: (String? valuee) {
                          setState(() {
                            tumuitemscontrol = valuee!;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: ekrangenisligi/2.2,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.red,
                            ),
                            color: Colors.red[600],
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                              Icons.keyboard_arrow_down
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.white,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.red.shade200,
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint:  Row(

                          children: [

                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Artan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: artanitems
                            .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        value: artanitemskontrol,
                        onChanged: (String? valuee) {
                          setState(() {
                            artanitemskontrol = valuee!;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: ekrangenisligi/2.2,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.white,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.grey.shade200,
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),

                  ]
              ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(selectedPhoto_1,
                width: ekrangenisligi/2,
                ),
                Image.asset(selectedPhoto_2,
                  width: ekrangenisligi/2,
                ),

              ],
            ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(selectedPhoto_3,
                    width: ekrangenisligi/2,
                  ),
                  Image.asset(selectedPhoto_4,
                    width: ekrangenisligi/2,
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );

  }
}


