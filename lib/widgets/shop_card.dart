part of 'widgets.dart';

class ShopCard extends StatelessWidget {
  final StoreModel storeModel;
  const ShopCard({
    super.key,
    required this.storeModel,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              goUrlSelected(
                context,
                LoadWeb(
                  title: storeModel.storeName,
                  url: storeModel.storeUrl,
                  imageAsset: storeModel.imageUrl,
                ),
              );
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
                  Hero(
                    tag: storeModel.storeName,
                    child: Image.network(
                      height: size.height * 0.15,
                      width: double.infinity,
                      storeModel.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                storeModel.storeName.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
