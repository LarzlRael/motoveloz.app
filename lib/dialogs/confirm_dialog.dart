import 'package:WaraShops/widgets/widgets.dart';
import 'package:WaraShops/data/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';
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

requestGPSactivationDialog(
  BuildContext context,
  VoidCallback confirmOnTap,
) {
  final isDarkModeEnabled =
      Provider.of<ThemeProvider>(context, listen: false).isDarkModeEnabled;

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
                  "Para utilizar todas las funciones de esta aplicación, es necesario activar el GPS.",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              lightColor: Colors.grey[700],
              padding: EdgeInsets.symmetric(
                vertical: 4,
              ),
            ),
            SimpleText(
              text:
                  "Para brindarte un servicio de entrega rápido y preciso, necesitamos acceder a tu ubicación actual. Esto nos permitirá saber dónde realizar la entrega y ofrecerte una experiencia de entrega personalizada. Tu ubicación se utilizará exclusivamente para fines de entrega y no se compartirá con terceros",
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
              child: Text("Denegar", style: TextStyle(color: primaryColor)),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isDarkModeEnabled ? Colors.grey[800] : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  color: primaryColor,
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
            SizedBox(height: 5),
            ElevatedButton(
              child: Text("Continuar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 75,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                confirmOnTap();
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

Widget expandedButton(
  BuildContext context,
  String textButton,
  Color colorButton,
  Color colorTextButton,
  void Function()? onPressed,
) {
  return Expanded(
    child: ElevatedButton(
      child: Text(textButton, style: TextStyle(color: colorTextButton)),
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
  );
} /* confirmOnTap(); */
