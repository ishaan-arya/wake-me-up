import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanMode extends StatefulWidget {
  final Function setResult;
  const QRScanMode({Key? key, required this.setResult});

  @override
  _QRScanModeState createState() => _QRScanModeState();
}

class _QRScanModeState extends State<QRScanMode> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  Widget buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Theme.of(context).accentColor,
        borderLength: 20,
        borderRadius: 10,
        borderWidth: 10,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) {
      widget.setResult(barcode);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    await controller!.pauseCamera();
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return buildQRView(context);
  }
}
