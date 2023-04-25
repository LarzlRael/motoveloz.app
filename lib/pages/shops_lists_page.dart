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
  bool isLoading = false;
  List<StoreModel> _stores = [];
  Future<void> _loadStores() async {
    isLoading = true;
    setState(() {});
    final stores = await StoreServices().getAllStores();

    isLoading = false;
    _stores = stores;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkThemeActive = UserPreferences.isDarkTheme;
    final searchProvider = Provider.of<SearchProvider>(context);
    final themeChanger =
        Provider.of<ThemeProviderNotifier>(context, listen: true);
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
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    query: searchProvider.getQuerySearched,
                    delegate: SearchShopStoreDelegate(
                      searchProvider,
                    ));
              },
              icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              UserPreferences.isDarkTheme = !isDarkThemeActive;
              themeChanger.toggleTheme();
            },
            icon: isDarkThemeActive
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),

            /* onChanged: (value) {
              setState(() {
                isSwitched = value;
                /* themeChanger.setDarkTheme = isSwitched; */
              });
            }, */
          ),
        ],
      ),
      body: PageContainer(
        paddingPage: EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            /* Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: SearchBox(),
            ), */
            Expanded(
              child: isLoading
                  ? Center(child: const CircularProgressIndicator())
                  : SmartRefresher(
                      controller: _refreshController,
                      onRefresh: () async {
                        await _loadStores();
                        _refreshController.refreshCompleted();
                      },
                      child: GridView.count(
                        primary: false,
                        crossAxisSpacing: 10,
                        /* mainAxisSpacing: 10, */
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
