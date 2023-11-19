import 'package:flutter/material.dart';


class Girisbuton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const Girisbuton({super.key,required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red[700],

        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),

      ),
    );

  }
}
