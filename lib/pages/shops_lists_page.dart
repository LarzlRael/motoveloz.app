part of 'pages.dart';

class ShopsListsPage extends StatefulWidget {
  const ShopsListsPage({super.key});

  @override
  State<ShopsListsPage> createState() => _ShopsListsPageState();
}

class _ShopsListsPageState extends State<ShopsListsPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'assets/wara_shop_icon.png',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          const Text('WaraShops')
        ]),
        backgroundColor: Color(0xff33b5e6),
        actions: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
                themeChanger.setDarkTheme = isSwitched;
              });
            },
          ),
        ],
      ),
      body: PageContainer(
        paddingVertical: 0,
        paddingHorizontal: 8,
        child: Column(
          children: [
            SearchBox(),
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
                ],
              ),
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
