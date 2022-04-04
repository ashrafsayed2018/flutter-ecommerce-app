import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String text;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.text,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          alignment: Alignment.centerRight,
          text: text,
          fontSize: 16,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          obscureText: hint == 'الرقم السري' ? true : false,
          onSaved: onSaved,
          validator: validator,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
