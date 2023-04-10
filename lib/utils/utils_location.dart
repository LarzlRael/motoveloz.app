part of 'utils.dart';

void accespGpsPermissionRequest(BuildContext context, PermissionStatus status) {
  switch (status) {
    case PermissionStatus.granted:
      return;

    case PermissionStatus.denied:
    case PermissionStatus.restricted:
    case PermissionStatus.permanentlyDenied:
      openAppSettings();
  }
}

Future checkGpsYLocation(BuildContext context) async {
  // PermisoGPS
  final permisoGPS = await Permission.location.isGranted;
  print('permisoGPS: $permisoGPS');
  // GPS está activo
  final gpsActivo = await Geolocator.isLocationServiceEnabled();

  if (permisoGPS && gpsActivo) {
    /*  Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, ShopsListsPage())); */
    return '';
  } else if (!permisoGPS) {
    /* Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, AccesoGpsPage())); */
    return 'Es necesario el permiso de GPS';
  } else {
    return 'Active el GPS';
  }
}

Future<void> checkLocationPermission(BuildContext context) async {
  final status = await Permission.location.request();
  // Aquí puedes llamar a la función accespGps con el status obtenido
  if (!await verifyGpsYLocation(context)) {
    /* Verify the permisions */
    accespGpsPermissionRequest(context, status);

    /* Verify the GPS */
    requestGPSactivationDialog(context, () async {
      if (!await Geolocator.isLocationServiceEnabled()) {
        if (await Permission.location.request().isGranted) {
          Geolocator.openLocationSettings();
        }
      }
    });
  }
}

Future<bool> verifyGpsYLocation(BuildContext context) async {
  // PermisoGPS
  final permisoGPS = await Permission.location.isGranted;
  final gpsActivo = await Geolocator.isLocationServiceEnabled();
  return permisoGPS && gpsActivo;
}
