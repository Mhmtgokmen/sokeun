import 'package:flutter/material.dart';

class TestmessageScreen extends StatefulWidget {
  const TestmessageScreen({super.key});

  @override
  State<TestmessageScreen> createState() => _TestmessageScreenState();
}
class _TestmessageScreenState extends State<TestmessageScreen> {

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: Text("Test Mesaj"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}