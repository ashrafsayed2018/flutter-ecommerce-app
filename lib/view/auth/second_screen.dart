import 'package:ecommerce_app/core/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text('Counter'),
        ),
      ),
    );
  }
}
