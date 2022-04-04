import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(
                    text: "تسجيل الدخول",
                    color: kPrimaryColor,
                    fontSize: 20,
                  ),
                  CustomText(
                    text: "مرحبا بك",
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                alignment: Alignment.centerRight,
                text: 'سجل الدخول للمتابعه',
                color: Colors.grey,
                fontSize: 16,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                hint: 'البريد الالكتروني',
                text: 'البريد الالكتروني',
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'البريد الالكتروني مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hint: 'الرقم السري',
                text: 'الرقم السري',
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'الرقم السري مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'نسيت الرقم السري',
                fontSize: 16,
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
