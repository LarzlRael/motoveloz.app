part of 'models.dart';
// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

List<StoreModel> storeModelFromJson(String str) =>
    List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
  StoreModel({
    required this.storeVisiblity,
    required this.id,
    required this.storeName,
    this.storePublicImageId,
    required this.imageUrl,
    required this.storeDescription,
    required this.storeAddress,
    required this.storePhone,
    required this.storeUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  bool storeVisiblity;
  String id;
  String storeName;
  dynamic storePublicImageId;
  String imageUrl;
  String storeDescription;
  String storeAddress;
  String storePhone;
  String storeUrl;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        storeVisiblity: json["storeVisiblity"],
        id: json["_id"],
        storeName: json["storeName"],
        storePublicImageId: json["storePublicImageId"],
        imageUrl: json["imageUrl"],
        storeDescription: json["storeDescription"],
        storeAddress: json["storeAddress"],
        storePhone: json["storePhone"],
        storeUrl: json["storeUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "storeVisiblity": storeVisiblity,
        "_id": id,
        "storeName": storeName,
        "storePublicImageId": storePublicImageId,
        "imageUrl": imageUrl,
        "storeDescription": storeDescription,
        "storeAddress": storeAddress,
        "storePhone": storePhone,
        "storeUrl": storeUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
