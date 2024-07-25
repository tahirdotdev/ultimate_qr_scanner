import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});
  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = 'Scanned data will appear';
  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        qrResult = qrCode.toString();
      });
    } on PlatformException {
      qrResult = 'Failed to read QR Code';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff162f48),
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        backgroundColor: const Color(0xff162f48),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              qrResult,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: scanQR,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  elevation: 10),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Scan QR Code',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
