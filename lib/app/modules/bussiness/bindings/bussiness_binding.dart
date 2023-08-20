import 'package:get/get.dart';

import '../controllers/bussiness_controller.dart';

class BussinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BussinessController>(
      () => BussinessController(),
    );
  }
}
