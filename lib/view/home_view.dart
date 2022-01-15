import 'package:flutter/material.dart';
import 'package:qr_borcode_scanner/widget/custom_button_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_buildColumn(context),
    );
  }

  Column _buildColumn(BuildContext context) {
    return (
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("Please select the barcode type",style:Theme.of(context).textTheme.headline6),
        Row(
          children: [
            CustomButton(text:"QR Code", function:(){Navigator.pushNamed(context,'/scanView',arguments:true);}),
            CustomButton(text:"Barcode", function:(){Navigator.pushNamed(context,'/scanView',arguments:false);})
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ],
    )
    );
  }
}
