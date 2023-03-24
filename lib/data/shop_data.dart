import 'package:WaraShops/models/models.dart';

final List<ShopModel> shopData = [
  ShopModel(
    imageAsset: 'assets/shops/pollos_copacabana.jpeg',
    shopName: 'pollos copacabana',
    shopDescription: 'Shop Description',
    shopAddress: 'Shop Address',
    shopPhone: '77596102',
    goToUrl: 'https://pollos-copacabana.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/pollos_cochabamba.jpeg',
    shopName: 'pollos cochabamba',
    shopDescription: 'Shop Description',
    shopAddress: 'Shop Address',
    shopPhone: '77596102',
    goToUrl: 'https://pollos-cochabamba.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/el_pueblo_pique_exress.jpeg',
    shopName: 'el pueblo del pique express',
    shopDescription: 'Shop Description',
    shopAddress: 'Shop Address',
    shopPhone: '77596102',
    goToUrl: 'https://el-pueblo-del-pique-express.ola.click/products',
  ),
];

List<ShopModel> sortedShopByName() {
  return shopData.map((shop) => shop).toList()
    ..sort((a, b) => a.shopName.compareTo(b.shopName));
}
