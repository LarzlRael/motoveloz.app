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
    imageAsset: 'assets/shops/el_pueblo_pique_express.jpeg',
    shopName: 'el pueblo del pique express',
    shopDescription: 'Shop Description',
    shopAddress: 'Shop Address',
    shopPhone: '77596102',
    goToUrl: 'https://el-pueblo-del-pique-express.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/nikis.jpeg',
    shopName: 'niki\'\s',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'https://michelline.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/michelline.jpeg',
    shopName: 'michelline',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'https://michelline.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/don_pollo.jpeg',
    shopName: 'don pollo',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'https://don-pollo-el-alto.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/la_llajuita.jpeg',
    shopName: 'la llajuita',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'https://la-llajuita.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/pollos-yacks-alto.jpeg',
    shopName: 'pollos yacks alto',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'https://pollos-yacks-alto.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/la-vaca-cielo-mall.jpeg',
    shopName: 'la vaca cielo mall',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'https://la-vaca-cielo-mall.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/waikichas.jpeg',
    shopName: 'waikichas',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'https://waikichas.ola.click/products',
  ),
  ShopModel(
    imageAsset: 'assets/shops/sachi_salvaje.jpeg',
    shopName: 'salchi salvajes',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'http://google.com/',
  ),
  ShopModel(
    imageAsset: 'assets/shops/mr_piza.jpeg',
    shopName: 'mr. pizza',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'http://google.com/',
  ),
  ShopModel(
    imageAsset: 'assets/shops/elis_pizza.jpeg',
    shopName: 'elis\'\ pizza',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'http://google.com/',
  ),
  ShopModel(
    imageAsset: 'assets/shops/fricarriel.jpeg',
    shopName: 'fricarriel',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'http://google.com/',
  ),
  ShopModel(
    imageAsset: 'assets/shops/sabor_a_gaucho.jpeg',
    shopName: 'sabor a gaucho',
    shopDescription: '',
    shopAddress: '',
    shopPhone: '',
    goToUrl: 'http://google.com/',
  )
];

List<ShopModel> sortedShopByName() {
  return shopData.map((shop) => shop).toList()
    ..sort((a, b) => a.shopName.compareTo(b.shopName));
}
