part of 'pages.dart';

class ShopsListsPage extends StatefulWidget {
  const ShopsListsPage({super.key});

  @override
  State<ShopsListsPage> createState() => _ShopsListsPageState();
}

class _ShopsListsPageState extends State<ShopsListsPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    checkLocationPermission(context);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (!await Permission.location.isGranted) {
        checkLocationPermission(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = UserPreferences.isDarkTheme;
    final themeChanger = Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'assets/moto_veloz_logo2.jpeg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          const Text(appName)
        ]),
        actions: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                UserPreferences.isDarkTheme = isSwitched;
                themeChanger.setDarkTheme = isSwitched;
              });
            },
          ),
        ],
      ),
      body: PageContainer(
        paddingPage: EdgeInsets.symmetric(horizontal: 8),
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
