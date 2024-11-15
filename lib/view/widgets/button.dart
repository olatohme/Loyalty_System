import 'package:flutter/material.dart';
import 'package:loyalty/consts/colors.dart';
import 'package:loyalty/view/widgets/text.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double width;
  final double hight;
  Color?color;
   Button({
    required this.hight,
    required this.width,
    required this.onPressed,
    required this.text,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        minimumSize: Size(width, hight),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      child: TextUtils(
        color: Colors.white,
        text: text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        underLine: TextDecoration.none,
      ),
    );
  }
}
