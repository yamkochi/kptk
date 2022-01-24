import 'package:av_net_shop/sub_ragam/controller/crud_controller.dart';
import 'package:av_net_shop/sub_ragam/controller/sub_form_controller.dart';
import 'package:get/get.dart';

class SubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubFormController>(
      () => SubFormController(),
    );
     Get.lazyPut<CrudController>(
      () => CrudController(),
    );
  }
}