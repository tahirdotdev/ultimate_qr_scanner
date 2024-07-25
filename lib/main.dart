import 'package:flutter/material.dart';
import 'package:ultimate_qr_scanner/generate_qr_code.dart';
import 'package:ultimate_qr_scanner/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ultimate QR Scanner and Generator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff162f48),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            'Ultimate QR Scanner and Generator',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontFamily: 'poppins'),
          ),
        ),
        backgroundColor: const Color(0xff162f48),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ScanQrCode()));
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    elevation: 15),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Scan QR Code',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GenerateQrCode()));
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    elevation: 15),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Generate QR Code',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
