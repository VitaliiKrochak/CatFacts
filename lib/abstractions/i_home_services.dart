import 'package:cat_facts_app/models/cat_facts_model.dart';

abstract class IHomeService {
  Future<CatFactsModel> getCatFacts();
}