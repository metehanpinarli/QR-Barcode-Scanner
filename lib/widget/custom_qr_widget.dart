import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:kartal/kartal.dart';
class CustomQrWidget extends StatefulWidget {
  final Key qrKey;
  final Function(QRViewController) onQRViewCreated;
  final bool qrMode;
  const CustomQrWidget({Key? key, required this.qrKey, required this.onQRViewCreated, required this.qrMode}) : super(key: key);

  @override
  _CustomQrWidgetState createState() => _CustomQrWidgetState();
}

class _CustomQrWidgetState extends State<CustomQrWidget> {
  @override
  Widget build(BuildContext context) {
    return QRView(
      key: widget.qrKey,
      onQRViewCreated: widget.onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderRadius: 10,
        borderColor: Colors.green,
        overlayColor: const Color.fromRGBO(0, 0, 0, 20),
         cutOutHeight: widget.qrMode?200:120,
         cutOutWidth: widget.qrMode ? 200 :240,
      ),
    );
  }
}
