part of 'counter_bloc.dart';

@immutable
abstract class BarcodeEvent {}

class BarcodeListChange extends BarcodeEvent{
  final List<Barcode> barcodeList;
  BarcodeListChange({required this.barcodeList});
}
class BarcodeListReset extends BarcodeEvent{}
