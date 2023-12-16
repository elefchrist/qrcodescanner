import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {

  String qrCodeResult = "Not Yet Scanned";

  Future<void> sendDataToBackend(String qrData) async {
    try {
      // Replace this URL with your Spring Boot backend URL
      final response = await http.post(
        Uri.parse('http://192.168.178.49:8080/api/qrcodes'),
        body: {'qrData': qrData},
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Message displayed over here
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),

            //Button to scan QR code
            TextButton(
              onPressed: () async {
                ScanResult codeSanner = (await BarcodeScanner.scan()) ; //barcode scanner
                setState(() {
                  qrCodeResult = codeSanner.rawContent;
                  sendDataToBackend(qrCodeResult);
                });
              },
              child: Text("Open Scanner",style: TextStyle(color: Colors.indigo[900]),),
              //Button having rounded rectangle border
            ),

          ],
        ),
      ),
    );
  }
}
