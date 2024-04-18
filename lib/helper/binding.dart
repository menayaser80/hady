import 'package:get/get.dart';
import 'package:lava/core/viewmodel/home_page_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController);
  }
}
