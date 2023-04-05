part of 'models.dart';

class HistoryModel {
  int? id;
  String storeName;
  String storeUrl;
  String storeImageUrl;
  HistoryModel({
    this.id,
    required this.storeName,
    required this.storeUrl,
    required this.storeImageUrl,
  }) {}

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json["id"],
      storeName: json["storeName"],
      storeImageUrl: json["storeImageUrl"],
      storeUrl: json["storeUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "storeName": storeName,
        "storeImageUrl": storeImageUrl,
        "storeUrl": storeUrl,
      };
}
