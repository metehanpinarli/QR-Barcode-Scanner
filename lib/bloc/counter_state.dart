part of 'counter_bloc.dart';

@immutable
abstract class BarcodeState {}

class BarcodeInitial extends BarcodeState {}

class BarcodeCompleted extends BarcodeState {
  final List<Barcode> barcodeList;
  BarcodeCompleted({required this.barcodeList});
}


