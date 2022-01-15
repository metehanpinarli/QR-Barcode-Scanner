import 'package:flutter/material.dart';
import 'package:qr_borcode_scanner/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: Text(
        "Recently scanned Barcodes",
        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0),
            onPressed: () {
              context.read<BarcodeBloc>().add(BarcodeListReset());
              Navigator.pushNamed(context, '/homeView');
            },
            child: const Text("Delete"))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
