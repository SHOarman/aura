import 'package:aura/core/services/globelcontroller.dart';
import 'package:get/get.dart';

import '../services/aicontrollergrobel.dart';
import '../services/profilecontroller.dart';

class DependencyInjection {

  static void bindings() {


    Get.lazyPut(() => Globelcontroller());
    Get.lazyPut(()=>AiControllerGlobal());
    Get.lazyPut(()=>ProfileController());





  }
}