part of 'widgets.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Image.network(
            'https://placeimg.com/640/480/any',
            fit: BoxFit.fill,
          ),
          SimpleText(
            text: 'Shop Name',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            marginVertical: 10,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
