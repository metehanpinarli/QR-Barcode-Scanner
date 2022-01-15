import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_borcode_scanner/bloc/counter_bloc.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarcodeBloc, BarcodeState>(
      builder: (context, state) {
        if (state is BarcodeCompleted) {
          return buildFloatingActionButton(context, state);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context, BarcodeCompleted state) {
    return FloatingActionButton(
      backgroundColor:Colors.grey[800],
            onPressed: () {
              Navigator.pushNamed(context, '/listView');
            },
            child: Text(state.barcodeList.length.toString()));
  }
}
