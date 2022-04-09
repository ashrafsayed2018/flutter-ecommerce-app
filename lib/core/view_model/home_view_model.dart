import 'package:ecommerce_app/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class HomeViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeView();
  int get getnavigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;
  changeSelectedValue(int value) {
    _navigatorValue = value;
    switch (value) {
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = const CartView();
        break;
      case 2:
        _currentScreen = const ProfileView();
        break;
    }
    update();
  }
}
