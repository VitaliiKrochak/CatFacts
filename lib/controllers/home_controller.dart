import 'package:cat_facts_app/abstractions/i_home_services.dart';
import 'package:cat_facts_app/config/app_settings.dart';
import 'package:cat_facts_app/models/cat_facts_model.dart';
import 'package:cat_facts_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final IHomeService service;
  CatFactsModel model = CatFactsModel(text: '', updatedAt: DateTime.now());
  bool isLoading = false;
  String catsImagesUrl = AppSettings.catsImagesUrl;
  final factList = <CatFactsModel>[];
  HomeController(this.service);

  @override
  void onInit() async {
    final facts = await service.getCatFacts();
    model = facts;
    factList.add(facts);
    update();
    super.onInit();
  }

  void getCatFact() async {
    isLoading = true;
    update();
    final facts = await service.getCatFacts();
    model = facts;
    factList.add(facts);
    isLoading = false;
    update();
  }
  void onHistoryPressed(){
    Get.toNamed(Routes.history);
  }
}
