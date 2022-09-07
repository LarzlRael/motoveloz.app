part of 'widgets.dart';

class ShopCard extends StatelessWidget {
  final ShopModel shopModel;
  const ShopCard({
    super.key,
    required this.shopModel,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      /* color: Colors.blue, */
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              launchURL(shopModel.goToUrl);
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Column(
                children: [
                  Image.asset(
                    height: size.height * 0.15,
                    width: double.infinity,
                    shopModel.imageAsset,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              /* margin: const EdgeInsets.symmetric(vertical: 10), */
            ),
          ),
          SimpleText(
            marginVertical: 5,
            text: shopModel.shopName.toUpperCase(),
            fontWeight: FontWeight.w700,
            fontSize: 14,

            /* marginVertical: 5, */
          ),
        ],
      ),
    );
  }
}
