part of 'pages.dart';

class AccesoGpsPage extends StatefulWidget {
  @override
  State<AccesoGpsPage> createState() => _AccesoGpsPageState();
}

class _AccesoGpsPageState extends State<AccesoGpsPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
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
      if (await Permission.location.isGranted) {
        context.go('/loading_page');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Es necesario el GPS para usar esta app'),
              MaterialButton(
                child: Text('Solicitar Acceso'),
                color: Colors.black,
                textColor: Colors.white,
                shape: StadiumBorder(),
                elevation: 0,
                splashColor: Colors.transparent,
                onPressed: () async {
                  /* TODO verificar permisos */
                  final status = await Permission.location.request();
                  accespGps(status);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void accespGps(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        context.go('/loading_page');
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
  }
}
