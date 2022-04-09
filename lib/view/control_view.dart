import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/cart_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/auth_controller.dart';

class ControlView extends GetWidget<AuthController> {
  ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user == null)
          ? LoginScreen()
          : GetBuilder<HomeViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => BottomNavigationBar(
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade50,
          currentIndex: controller.getnavigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          items: const [
            BottomNavigationBarItem(
              activeIcon: Text('الرئيسية'),
              label: '',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              activeIcon: Text('الكارتات'),
              label: '',
              icon: Icon(Icons.shop),
            ),
            BottomNavigationBarItem(
              activeIcon: Text('حسابي'),
              label: '',
              icon: Icon(Icons.person_add_alt_outlined),
            )
          ]),
    );
  }
}
