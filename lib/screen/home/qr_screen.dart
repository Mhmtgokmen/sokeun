import 'package:flutter/material.dart';
import 'package:native_barcode_scanner/barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';


class QrKodScreen extends StatefulWidget {
  const QrKodScreen({super.key});


  @override
  State<QrKodScreen> createState() => QrKodScreenState();
}

class QrKodScreenState extends State<QrKodScreen> {
  String result = 'QR kod bekleniyor...';

  Future<void> _scanQRCode() async {
    // Kamera izni kontrolü
    var status = await Permission.camera.status;
    if (status.isGranted) {
      try {
        final result = await BarcodeScanner.flipCamera();
        if (result != null && result.isNotEmpty) {
          setState(() {
            this.result = 'QR Kod Sonucu: $result';
          });
        } else {
          setState(() {
            this.result = 'QR kod bulunamadı.';
          });
        }
      } catch (e) {
        setState(() {
          result = 'QR kod okuma sırasında bir hata oluştu: $e';
        });
      }
    } else {
      // Kamera izni talep et
      if (await Permission.camera.request().isGranted) {
        // İzin verildi, QR kodu tarayabilirsiniz.
        _scanQRCode();
      } else {
        // İzin verilmedi, kullanıcıya bilgi ver veya uygun bir işlem yap.
        setState(() {
          result = 'Kamera izni verilmedi.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Kod Okuyucu'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanQRCode,
              child: const Text('QR Kod Oku'),
            ),
          ],
        ),
      ),
    );
  }
}

