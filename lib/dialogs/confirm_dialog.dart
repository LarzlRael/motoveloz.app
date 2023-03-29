import 'package:WaraShops/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

showAlertDialog(
  BuildContext context,
  String title,
  Widget content,
  VoidCallback confirmOnTap,
) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continuar"),
    onPressed: () {
      /* TODO onclickByArgument */
      confirmOnTap();
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title, style: TextStyle(fontSize: 18)),
    content: content,
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

requestGPSactivation(
  BuildContext context,
  VoidCallback confirmOnTap,
) {
  // set up the buttons

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: SimpleText(
      text: "Por favor activa el GPS ",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      lightColor: Colors.grey[700],
      textAlign: TextAlign.center,
    ),
    content: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          /* color: Colors.grey[200], */
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleText(
                  text: "ACCIÓN NECESARIA ",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  lightColor: Colors.grey[700],
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 25,
                ),
              ],
            ),
            SimpleText(
              text:
                  "Para utilizar todas las funciones de esta aplicación, es necesario activar el GPS y permitir el acceso a tu ubicación en segundo plano.",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              lightColor: Colors.grey[700],
              padding: EdgeInsets.symmetric(
                vertical: 4,
              ),
            ),
            SimpleText(
              text:
                  "Funciones que utilizan la ubicación en segundo plano incluyen la búsqueda de negocios cercanos, la navegación paso a paso y las recomendaciones personalizadas basadas en tu ubicación actual",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              lightColor: Colors.grey[700],
              padding: EdgeInsets.symmetric(
                vertical: 4,
              ),
            ),
            SimpleText(
              text:
                  "Pulsa el botón \"\Continuar\"\ para permitir que la aplicación acceda a tu ubicación en segundo plano y disfrutar de todas las funciones",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              lightColor: Colors.grey[700],
              padding: EdgeInsets.symmetric(
                vertical: 8,
              ),
            ),
            ElevatedButton(
              child:
                  Text("Denegar", style: TextStyle(color: Color(0xffff5400))),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  color: Color(0xffff5400),
                  width: 1,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 75,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Continuar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffff5400),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 75,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                confirmOnTap();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
  // show the dialog
  showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: alert,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}

showDivulgationDialog(BuildContext context) {
  final dialogContext = context;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Necesitamos acceder a tu ubicación en segundo plano"),
      content: Text(
          "Para ofrecerte la mejor experiencia de navegación, necesitamos acceder a tu ubicación en segundo plano. No compartiremos tu ubicación con terceros."),
      actions: [
        TextButton(
          child: Text("Aceptar"),
          onPressed: () async {
            Navigator.of(context).pop();

            await checkLocationPermission(dialogContext);
          },
        ),
        TextButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
