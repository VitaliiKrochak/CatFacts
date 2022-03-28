import 'package:cat_facts_app/abstractions/i_home_services.dart';
import 'package:cat_facts_app/controllers/home_controller.dart';
import 'package:cat_facts_app/services/home_services.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<IHomeService>(HomeService());
    Get.put(HomeController(Get.find()));
  }
}
