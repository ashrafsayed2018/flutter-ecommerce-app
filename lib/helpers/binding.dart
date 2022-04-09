import 'package:ecommerce_app/core/view_model/auth_controller.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}
