part of 'pages.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
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
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (await Geolocator.isLocationServiceEnabled()) {
        Navigator.pushReplacement(
          context,
          navegarMapaFadeIn(
            context,
            ShopsListsPage(),
          ),
        );
      } else {
        print('no esta activo');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkGpsYLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Future checkGpsYLocation(BuildContext context) async {
  // PermisoGPS
  final permisoGPS = await Permission.location.isGranted;
  final gpsActivo = await Geolocator.isLocationServiceEnabled();

  if (permisoGPS && gpsActivo) {
    Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, ShopsListsPage()));
    return '';
  } else if (!permisoGPS) {
    Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, AccesoGpsPage()));
    return 'Es necesario el permiso de GPS';
  } else {
    return 'Active el GPS';
  }
}
