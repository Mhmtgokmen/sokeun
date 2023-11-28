import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/utility/auth_utility.dart';

class QrKodScreen extends ConsumerStatefulWidget {
  const QrKodScreen({super.key});

  @override
  ConsumerState<QrKodScreen> createState() => QrKodScreenState();
}

class QrKodScreenState extends ConsumerState<QrKodScreen> {
  final GlobalKey globalKey = GlobalKey();
  QRViewController? controller;
  late ApiService apiService;
  Barcode? result;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
    _getCameraPermission();
  }

  Future<void> qrcodePost(String? code) async {
    apiService = ApiService();
    final token = await AuthUtility.getToken();
    Map<String, dynamic> data = {
      "code": code,
    };
    print("token: $token");

    try {
      Response response = await apiService.post(
        "point/code/submit",
        data,
        token: token,
      );
      if (response.statusCode == 200) {
        print(response.data['message']);
        _showSnackBar(response.data['message']);
        code = "";
      } else if (response.statusCode == 404) {
        print(response.data['message']);
        code = "";
        _showSnackBar(response.data['message']);
      } else {
        print("Bir hata oluştu");
      }
    } catch (e) {
      print("hata Hata : $e");
    }
  }

  void _showSnackBar(String message) {
    if (ScaffoldMessenger.of(context).mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  int counter = 0;
  void _scanQRCode(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) async {
      counter++;
      controller.pauseCamera;
      result = event;
      if (counter == 1) {
        if (result != null) {
          qrcodePost(result!.code);
        } else {
          _showSnackBar("Kod okunmadı tekrer deneyiniz!");
        }
      }
    });
  }

  // Future<void> qrcodePost() async {
  //   apiService = ApiService();
  //   final token = await AuthUtility.getToken();
  //   Map<String, dynamic> data = {
  //     "code": result,
  //   };
  //   print("token: $token");

  //   try {
  //     Response response = await apiService.post(
  //       "point/code/submit",
  //       data,
  //       token: token,
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.data['message']);
  //     } else if (response.statusCode == 404) {
  //       print(response.data['message']);
  //     } else {
  //       print("Bir hata oluştu");
  //     }
  //   } catch (e) {
  //     print("hata Hata : $e");
  //   }
  // }

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;

    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    var ekranayari = MediaQuery.of(context);
    var ekrangenisligi = ekranayari.size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // result != null
            //     ? Text(result!.code.toString())
            //     : const Text(
            //         "Lütfen başka bir kod deneyiniz!",
            //         style: TextStyle(fontSize: 18),
            //       ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              width: ekrangenisligi / 1,
              child: QRView(
                key: globalKey,
                onQRViewCreated: _scanQRCode,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

// Future<void> _scanQRCode() async {
//   // Kamera izni kontrolü
//   var status = await Permission.camera.status;
//   if (status.isGranted) {
//     try {
//       final result = await BarcodeScanner.flipCamera();
//       if (result != null && result.isNotEmpty) {
//         setState(() {
//           this.result = 'QR Kod Sonucu: $result';
//         });
//       } else {
//         setState(() {
//           this.result = 'QR kod bulunamadı.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         result = 'QR kod okuma sırasında bir hata oluştu: $e';
//       });
//     }
//   } else {
//     // Kamera izni talep et
//     if (await Permission.camera.request().isGranted) {
//       // İzin verildi, QR kodu tarayabilirsiniz.
//       _scanQRCode();
//     } else {
//       // İzin verilmedi, kullanıcıya bilgi ver veya uygun bir işlem yap.
//       setState(() {
//         result = 'Kamera izni verilmedi.';
//       });
//     }
//   }
// }
