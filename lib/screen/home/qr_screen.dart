import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrKodScreen extends StatefulWidget {
  const QrKodScreen({super.key});

  @override
  State<QrKodScreen> createState() => QrKodScreenState();
}

class QrKodScreenState extends State<QrKodScreen> {
  final GlobalKey globalKey = GlobalKey();
  QRViewController? controller;
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

  void _scanQRCode(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    });
  }

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
            result != null
                ? Text(result!.code.toString())
                : const Text(
                    "Lütfen başka bir kod deneyiniz!",
                    style: TextStyle(fontSize: 18),
                  ),
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
