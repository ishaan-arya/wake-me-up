import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wake_me_up/screens/postQRScanScreen/post_qr_scan.screen.dart';
import 'package:wake_me_up/widgets/qrScanWidget/qr_scan.widget.dart';

class QRScanScreen extends StatefulWidget {
  final String payload;
  const QRScanScreen({Key? key, required this.payload}) : super(key: key);

  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  Barcode? result;
  bool validation = false;

  void setResult(Barcode? barcode) async {
    result = barcode;
    if (result?.code == 'sgwyuhwiojue378432oqijaskbdeu4r8yt') {
      setState(() {
        validation = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return validation
        ? PostQRScanScreen(alarmId: widget.payload)
        : QRScanMode(setResult: setResult);
  }
}
