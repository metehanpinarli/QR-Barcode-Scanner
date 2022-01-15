import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  BarcodeBloc() : super(BarcodeInitial()) {
    on<BarcodeListChange>(_onBarcodeListChange);
    on<BarcodeListReset>(_onBarcodeListReset);
  }

  FutureOr<void> _onBarcodeListReset(event,emit)async{
    emit(BarcodeCompleted(barcodeList: const []));
  }

  FutureOr<void> _onBarcodeListChange(event,emit)async{
    emit(BarcodeCompleted(barcodeList:event.barcodeList));
  }

}
