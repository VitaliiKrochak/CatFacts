import 'package:cat_facts_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  final scrollController = ScrollController();

  Home({Key? key}) : super(key: key);

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
                controller.isLoading == false
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              '${controller.catsImagesUrl}?${DateTime.now().millisecondsSinceEpoch.toString()}',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              controller.model.text,
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(controller.model.updatedAt),
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    : Container(padding: EdgeInsets.all(20),alignment: Alignment.center,child: CircularProgressIndicator(),),
                TextButton(
                  onPressed: controller.getCatFact,
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  child: const Text(
                    'Another fact',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: controller.onHistoryPressed,
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    child: const Text(
                      'History',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
