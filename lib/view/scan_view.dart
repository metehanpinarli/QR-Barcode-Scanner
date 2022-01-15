import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_borcode_scanner/bloc/counter_bloc.dart';
import 'package:qr_borcode_scanner/widget/custom_float_action_button_widget.dart';
import 'package:qr_borcode_scanner/widget/custom_qr_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanView extends StatefulWidget {
  final bool qrMode;

  const ScanView({Key? key, required this.qrMode}) : super(key: key);

  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  bool flashMode = false;

  @override
  void initState() {
    context.read<BarcodeBloc>().add(BarcodeListReset());
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: const CustomFloatActionButton(), body: _buildBody());
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomQrWidget(qrKey: qrKey, onQRViewCreated: onQRViewCreated, qrMode: widget.qrMode),
        Positioned(bottom: 10, child: _buildToggleFlash()),
      ],
    );
  }

  Widget _buildToggleFlash() {
    return IconButton(
        onPressed: () {
          controller!.toggleFlash();
          setState(() {
            flashMode = !flashMode;
          });
        },
        icon: Icon(flashMode ? Icons.flash_off : Icons.flash_on, color: Colors.white));
  }

  onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    List<Barcode> barcodeList = [];
    DateTime? lastScan;
    qrController.scannedDataStream.listen((scanData) {
      final currentScan = DateTime.now();
      //Akış olduğu için durmadan tarama yapıyor. Aynı barkodu çok kez okumasın diye gecikme ekledim.
      if (lastScan == null || currentScan.difference(lastScan!) > const Duration(seconds: 1)) {
        lastScan = currentScan;
        barcodeList.add(scanData);
        BlocProvider.of<BarcodeBloc>(context).add(BarcodeListChange(barcodeList: barcodeList.reversed.toList()));
      }
    });
  }
}
