part of 'pages.dart';

class ShopsListsPage extends StatefulWidget {
  const ShopsListsPage({super.key});

  @override
  State<ShopsListsPage> createState() => _ShopsListsPageState();
}

class _ShopsListsPageState extends State<ShopsListsPage> {
  @override
  void initState() {
    super.initState();
    checkLocationPermission(context);
    _loadStores();
  }

  final _refreshController = RefreshController();
  List<StoreModel> _stores = [];
  Future<void> _loadStores() async {
    final stores = await StoreServices().getAllStores();
    setState(() {
      _stores = stores;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = UserPreferences.isDarkTheme;
    final themeChanger = Provider.of<ThemeProvider>(context, listen: true);
    StoreServices storeServices = StoreServices();
    storeServices.saveDeviceId().then((value) => print(value)).catchError((e) {
      print(e);
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'assets/moto_veloz_logo.jpeg',
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
            const SizedBox(height: 10),
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: () async {
                  await _loadStores();
                  _refreshController.refreshCompleted();
                },
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: _stores
                      .map((e) => ShopCard(
                            storeModel: e,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
