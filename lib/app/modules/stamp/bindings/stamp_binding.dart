import 'package:get/get.dart';

import '../controllers/stamp_controller.dart';

class StampBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StampController>(
      () => StampController(),
    );
  }
}
