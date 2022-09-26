part of 'pages.dart';

class ShopsListsPage extends StatelessWidget {
  const ShopsListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        Provider.of<ThemeChanger>(context, listen: true).isDarkTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppBarTitle(
          fontSize: 20,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings,
                color: isDarkTheme
                    ? Colors.white
                    : Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.pushNamed(context, 'settings_page');
            },
          ),
        ],
      ),
      body: PageContainer(
        paddingVertical: 10,
        child: Column(
          children: [
            SearchBox(isDarkTheme: isDarkTheme),
            /* const TitlesSeparator(
                title: 'Volver a escuchar', moreText: 'MÁS', fontSize: 23), */
            const SizedBox(height: 10),
            Expanded(
              /* remove shadow */
              child: GridView.count(
                primary: false,
                /* padding: const EdgeInsets.all(20), */
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: shopData.map((e) => ShopCard(shopModel: e)).toList(),
              ),
            ),
            /*  TitlesSeparator(title: 'Volver a escuchar', moreText: 'MÁS'),
            
            ), */
          ],
        ),
      ),
    );
  }
}

class TitlesSeparator extends StatelessWidget {
  final String title;
  final String moreText;
  final double fontSize;
  const TitlesSeparator({
    Key? key,
    required this.title,
    required this.moreText,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SimpleText(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
        SimpleText(
          text: moreText,
          fontSize: fontSize - 6,
        ),
      ],
    );
  }
}
