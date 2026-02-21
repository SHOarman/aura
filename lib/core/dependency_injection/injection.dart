import 'package:aura/core/services/globelcontroller.dart';
import 'package:get/get.dart';

class DependencyInjection {

  static void bindings() {


    Get.lazyPut(() => Globelcontroller());





  }
}