import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});
  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  TextEditingController urlControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff162f48),
      appBar: AppBar(
        backgroundColor: const Color(0xff162f48),
        foregroundColor: Colors.white,
        title: const Text('Generate QR Code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (urlControl.text.isNotEmpty)
                QrImageView(
                  data: urlControl.text,
                  size: 200,
                ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: urlControl,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter Your Data',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                        // Focused border
                        borderSide: const BorderSide(
                            color: Colors.red), // Change to your desired color
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'To Generate QR Code'),
                  cursorColor: Colors.red,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 10),
                  child: const Text('Generate QR Code'))
            ],
          ),
        ),
      ),
    );
  }
}
