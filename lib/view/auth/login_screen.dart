import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view_model/auth_controller.dart';
import 'package:ecommerce_app/view/auth/register_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_social_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthController> {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        Get.to(() => RegisterScreen());
                      }),
                      child: const CustomText(
                        text: "تسجيل حساب جديد",
                        color: kPrimaryColor,
                        fontSize: 20,
                      ),
                    ),
                    const CustomText(
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
                  onSaved: (String? value) {
                    controller.email = value;
                  },
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
                  onSaved: (String? value) {
                    controller.password = value;
                  },
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
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'تسجيل الدخول',
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                  backbgoundColor: kPrimaryColor,
                  textColor: Colors.white,
                  alignment: Alignment.center,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  alignment: Alignment.center,
                  text: ' او ',
                  color: Colors.black,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSocialButton(
                  text: 'عن طريق جوجل',
                  image: 'assets/images/google-icon.png',
                  onPressed: () {
                    controller.googleSignMethod();
                  },
                  borderColor: Colors.redAccent,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSocialButton(
                  text: 'عن طريق فيسبوك',
                  image: 'assets/images/facebook-icon.png',
                  onPressed: () {
                    // controller.facebookSigninMethod();
                  },
                  borderColor: Colors.blueAccent,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
