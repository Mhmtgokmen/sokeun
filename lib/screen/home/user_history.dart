import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// İŞLEMLER SAYFASI

class islemlersayfamPAgeeeeee extends StatefulWidget {
  const islemlersayfamPAgeeeeee({super.key});

  @override
  State<islemlersayfamPAgeeeeee> createState() =>
      _islemlersayfamPAgeeeeeeState();
}

class _islemlersayfamPAgeeeeeeState extends State<islemlersayfamPAgeeeeee> {

  final List<String> list = [
    '',
    '',

  ];

  String? listkontrol;

  DateTime baslangictarihi = DateTime.now();
  DateTime bitistarihii = DateTime.now();

  Future<void> bitiss(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: bitistarihii,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != bitistarihii) {
      setState(() {
        bitistarihii = picked!;
      });
    };
  }

  Future<void> baslamak(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: baslangictarihi,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != baslangictarihi) {
      setState(() {
        baslangictarihi = picked!;
      });
    };
  }


    @override
    Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İşlemler",
          style: TextStyle(
            color: Colors.red[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 9,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset("assetss/islemler_asset/img_1.png",width: ekrangenisligi/2.7,),
                        SizedBox(width: 35,),
                        Image.asset("assetss/islemler_asset/img.png",width: ekrangenisligi/3.5,),
                        SizedBox(width: 30,),



                      ],
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),


                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          width: ekrangenisligi / 2.4,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(5.0, 5.0),
                                blurRadius: 20,
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
                          child: Center(
                            child: SafeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5,),

                                      Text(
                                        "${baslangictarihi.toLocal()}".split(' ')[0],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade400),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () => baslamak(context),
                                        icon: Icon(Icons.keyboard_arrow_down),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                        SizedBox(width: 29,),

                        Container(
                          width: ekrangenisligi / 2.4,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(5.0, 5.0),
                                blurRadius: 20,
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
                          child: Center(
                            child: SafeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                     SizedBox(width: 5,),

                                      Text(
                                        "${bitistarihii.toLocal()}".split(' ')[0],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade400),
                                      ),
                                       Spacer(),

                                       IconButton(
                                         onPressed: () => bitiss(context),
                                        icon: Icon(Icons.keyboard_arrow_down),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),



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
                          items: list
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
                          value: listkontrol,
                          onChanged: (String? valuee) {
                            setState(() {
                              listkontrol = valuee!;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: ekrangenisligi/1.07,
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
                    ],
                  ),

                  //////////////////////////////////////////// İŞLEM TARİHİ , İŞLEM ADI , PUAN, RESİM
                  SizedBox(
                    height: 27,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 250),
                    child: SizedBox(
                      width: ekrangenisligi / 1.05,
                      height: ekranyukseklikayari / 3.3,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(3, 3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(-3, -3),
                              blurRadius: 13.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 0,
                              ),
                              SizedBox(
                                  width: ekrangenisligi / 1.2,
                                  child: Image.asset("assetss/foto/img_14.png")),
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
      ),
    );
  }
}
