import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../core/view_model/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_social_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_feild.dart';

class RegisterScreen extends GetWidget<AuthController> {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(() => LoginScreen());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: const CustomText(
                    text: "لديك حساب بالفعل؟",
                    color: kPrimaryColor,
                    fontSize: 20,
                    alignment: Alignment.bottomRight,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hint: 'اسم المستخدم',
                  text: ' اسم المستخدم',
                  onSaved: (String? value) {
                    controller.name = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return ' اسم المستخدم مطلوب';
                    }
                    return null;
                  },
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
                  text: 'تسجيل مستخدم جديد',
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
