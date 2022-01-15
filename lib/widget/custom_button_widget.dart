import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() function;
  const CustomButton({required this.text,required this.function,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:context.mediumValue,bottom:context.lowValue),
      child: ElevatedButton(
        onPressed:function,
        style:ElevatedButton.styleFrom(shape: const StadiumBorder(),primary:Colors.grey[800],padding:context.paddingNormal),
        child:  Text(text),
      ),
    );
  }
}
