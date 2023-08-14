part of 'widgets.dart';

class ShopCard extends StatelessWidget {
  final StoreModel storeModel;
  final Function(StoreModel storemodel) selected;
  const ShopCard({
    super.key,
    required this.storeModel,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    final size = MediaQuery.of(context).size;
    return FadeInOpacity(
      duration: Duration(milliseconds: 500),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                /* goUrlSelected(
                  context,
                  LoadWeb(
                    title: storeModel.storeName,
                    url: storeModel.storeUrl,
                    imageAsset: storeModel.imageUrl,
                  ),
                ); */
                selected(storeModel);
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
                      child: FadeInImage(
                        placeholder: AssetImage(loadingImage),
                        height: size.height * 0.15,
                        width: double.infinity,
                        image: NetworkImage(storeModel.imageUrl),
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
                  style: textStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
