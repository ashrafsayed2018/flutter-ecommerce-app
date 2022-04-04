import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color backbgoundColor;
  final Color textColor;
  final Alignment alignment;
  final double fontSize;
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backbgoundColor = Colors.white,
    this.textColor = Colors.black,
    required this.alignment,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backbgoundColor,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text!,
        color: textColor,
        fontSize: fontSize,
        alignment: alignment,
      ),
    );
  }
}
