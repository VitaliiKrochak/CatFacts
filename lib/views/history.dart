import 'package:cat_facts_app/controllers/home_controller.dart';
import 'package:cat_facts_app/models/cat_facts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

class History extends StatelessWidget {
  final scrollController = ScrollController();

  History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          child: GetBuilder<HomeController>(
            builder: (controller) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: Get.back,
                    icon: const Icon(Icons.arrow_back_ios),
                    alignment: Alignment.topLeft,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return cards(controller.factList[index],controller);
                    },
                    itemCount: controller.factList.length),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cards(CatFactsModel model,controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            model.text,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            DateFormat('yyyy-MM-dd').format(controller.model.updatedAt),
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
