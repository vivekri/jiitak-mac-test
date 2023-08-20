import 'package:get/get.dart';

import '../controllers/punchin_controller.dart';

class PunchinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PunchinController>(
      () => PunchinController(),
    );
  }
}
