part of 'pages.dart';

class ShopsListsPage extends StatelessWidget {
  const ShopsListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageContainer(
        child: Column(
          children: [
            TitlesSeparator(title: 'Volver a escuchar', moreText: 'MÁS'),
            Expanded(
              child: GridView.count(
                primary: false,
                /* padding: const EdgeInsets.all(20), */
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  ShopCard(),
                  ShopCard(),
                  ShopCard(),
                  ShopCard(),
                ],
              ),
            ),
            TitlesSeparator(title: 'Mixes para ti', moreText: 'MÁS'),
            ShopCard(),
          ],
        ),
      ),
    );
  }
}

class TitlesSeparator extends StatelessWidget {
  final String title;
  final String moreText;
  const TitlesSeparator({
    Key? key,
    required this.title,
    required this.moreText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SimpleText(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        SimpleText(
          text: moreText,
          fontSize: 15,
        ),
      ],
    );
  }
}
