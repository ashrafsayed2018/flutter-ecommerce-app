import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback? onPressed;
  final Color borderColor;
  const CustomSocialButton({
    Key? key,
    required this.text,
    required this.image,
    required this.onPressed,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: borderColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
            height: 20,
          ),
          CustomText(
            text: text,
            color: Colors.black,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}
