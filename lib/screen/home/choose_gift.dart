import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import 'package:sokeun/model/gift_card_model.dart';
import 'package:sokeun/providers/db_helper.dart';
import 'package:sokeun/providers/gift_card_provider.dart';
import 'shop_screen.dart';
import 'package:badges/badges.dart' as badges;

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

  final String selectedPhoto_1 =
      'assetss/hediyesec_assets/img.png'; // Gösterilecek fotoğrafın yolu
  final String selectedPhoto_2 =
      'assetss/hediyesec_assets/img_1.png'; // Gösterilecek fotoğrafın yolu
  final String selectedPhoto_3 =
      'assetss/hediyesec_assets/img_2.png'; // Gösterilecek fotoğrafın yolu
  final String selectedPhoto_4 =
      'assetss/hediyesec_assets/img_2.png'; // Gösterilecek fotoğrafın yolu



  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;
    final cart = Provider.of<GiftCardProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          //   child: IconButton(
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => ShopScreen()));
          //     },
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.red[600],
          //     ),

          //   ),
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 0),
                badgeContent: Consumer<GiftCardProvider>(
                  builder: (context, cart, child) {
                    return Text(
                      cart.getCounter().toString(),
                      style: TextStyle(color: Colors.white),
                    );
                  },
                  child: IconButton(
                    onPressed: () {

                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShopScreen()));
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 10,
                      color: Colors.red[600],
                    ),
                  ),
                ),
              ))
        ],
        title: Text(
          "Hediye Seç",
          style: TextStyle(color: Colors.red[600], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Container(
                width: ekrangenisligi / 1.02,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  children: [
                    Container(
                      width: ekrangenisligi / 2.1,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red[600],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "Standart Usta",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Kullanılabilir Puan\n              100",
                      style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 22,
              ),

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
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(color: Colors.grey.shade400)),
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Row(
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
                      width: ekrangenisligi / 2.2,
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
                      icon: Icon(Icons.keyboard_arrow_down),
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
                SizedBox(
                  width: 10,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Row(
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
                      width: ekrangenisligi / 2.2,
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
              ]),

              SizedBox(
                height: 15,
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [

              //     Image.asset(selectedPhoto_1,
              //     width: ekrangenisligi/2,
              //     ),
              //     Image.asset(selectedPhoto_2,
              //       width: ekrangenisligi/2,
              //     ),

              //   ],
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       selectedPhoto_3,
              //       width: ekrangenisligi / 2,
              //     ),
              //     Image.asset(
              //       selectedPhoto_4,
              //       width: ekrangenisligi / 2,
              //     ),
              //   ],
              // ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      giftBoxSection(ekrangenisligi: ekrangenisligi),
                      giftBoxSection(ekrangenisligi: ekrangenisligi),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      giftBoxSection(ekrangenisligi: ekrangenisligi),
                      giftBoxSection(ekrangenisligi: ekrangenisligi),
                    ],
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

class giftBoxSection extends StatelessWidget {
  const giftBoxSection({
    super.key,
    required this.ekrangenisligi,
  });

  final double ekrangenisligi;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<GiftCardProvider>(context);

    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 5.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assetss/hediyesec_assets/gift_image.png",
              height: 130,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: ekrangenisligi / 50),
              child: Text(
                "PS5 Oyun- Demons Souls",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "179",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Puan",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    try {
                      await DBHelper().insert(
                        GiftCardModel(
                          id: null,
                          giftId: "",
                          giftName: "PS5 Oyun- Demons Souls",
                          giftPoint: "Puan",
                          giftPointButton:
                              "assetss/hediyesec_assets/choose_button.png",
                          giftPointNumber: 179,
                          giftQuantity: 1,
                        ),
                      );
                      Provider.of<GiftCardProvider>(context, listen: false)
                          .addCounter();
                      print("Box is added to card");
                    } catch (error) {
                      print(error.toString());
                    }
                  },
                  child: Image.asset(
                    "assetss/hediyesec_assets/choose_button.png",
                    height: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
