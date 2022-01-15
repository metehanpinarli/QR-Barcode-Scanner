import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_borcode_scanner/bloc/counter_bloc.dart';
import 'package:qr_borcode_scanner/widget/custom_appbar_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeListView extends StatefulWidget {
  const BarcodeListView({Key? key}) : super(key: key);

  @override
  _BarcodeListViewState createState() => _BarcodeListViewState();
}

class _BarcodeListViewState extends State<BarcodeListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:const CustomAppBar(),
        body: _buildBody());
  }

  Center _buildBody() {
    return Center(
      child: BlocBuilder<BarcodeBloc, BarcodeState>(
        builder: (context, state) {
          if (state is BarcodeCompleted) {
            return _buildListView(state);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildListView(BarcodeCompleted state) {
    return ListView.builder(
      itemCount: state.barcodeList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(state.barcodeList[index].code.toString()),
          trailing: Text(state.barcodeList[index].format.formatName),
        );
      },
    );
  }

}
