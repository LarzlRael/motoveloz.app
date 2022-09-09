part of 'models.dart';

class ShopModel {
  int? id;
  String imageAsset;
  String shopName;
  String shopDescription;
  String shopAddress;
  String shopPhone;
  String goToUrl;
  ShopModel({
    required this.imageAsset,
    required this.shopName,
    required this.shopDescription,
    required this.shopAddress,
    required this.shopPhone,
    required this.goToUrl,
    this.id,
  });
}
