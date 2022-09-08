part of 'models.dart';

class HistoryModel {
  int? id;
  String querySearched;

  HistoryModel({
    this.id,
    required this.querySearched,
  }) {}

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json["id"],
      querySearched: json["querySearched"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "querySearched": querySearched,
      };
}
