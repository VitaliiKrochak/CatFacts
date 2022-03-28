import 'package:cat_facts_app/abstractions/i_home_services.dart';
import 'package:cat_facts_app/config/app_settings.dart';
import 'package:cat_facts_app/extensions/extension.dart';
import 'package:cat_facts_app/models/cat_facts_model.dart';
import 'package:dio/dio.dart';

class HomeService extends IHomeService {
  Dio dio = Dio();

  @override
  Future<CatFactsModel> getCatFacts() async {
    try {
      final response = await dio.get(AppSettings.catsFactsUrl);
      if (response.isSuccessStatusCode) {
        return CatFactsModel.fromJson(response.data);
      } else {
        return CatFactsModel(text: '', updatedAt: DateTime.now(),);
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
