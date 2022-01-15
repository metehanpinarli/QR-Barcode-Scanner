import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_borcode_scanner/bloc/counter_bloc.dart';
import 'package:qr_borcode_scanner/view/home_view.dart';
import 'package:qr_borcode_scanner/view/list_view.dart';
import 'package:qr_borcode_scanner/view/scan_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarcodeBloc(),
      child: MaterialApp(
        title: 'QR & Barcode Scanner',
        routes: {
          '/homeView': (context) => const HomeView(),
          '/scanView': (context) => ScanView(qrMode: ModalRoute.of(context)!.settings.arguments as bool),
          '/listView': (context) => const BarcodeListView(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.grey[800]),
        ),
        home: const SafeArea(child: HomeView()),
      ),
    );
  }
}
