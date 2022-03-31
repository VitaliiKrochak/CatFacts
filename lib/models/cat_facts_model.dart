class CatFactsModel {
  CatFactsModel({required this.text, required this.updatedAt});

  String text = '';
  DateTime updatedAt = DateTime.now();

  factory CatFactsModel.fromJson(Map<String, dynamic> json) => CatFactsModel(
        text: json["text"],
        updatedAt: DateTime.parse(
          json["updatedAt"],
        ),
      );
}
