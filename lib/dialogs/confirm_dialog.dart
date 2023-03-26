import 'package:WaraShops/widgets/widgets.dart';
import 'package:flutter/material.dart';
/* import math package */
import 'package:vector_math/vector_math.dart' as math;

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
              text: "Para poder usar la aplicación es necesario activar el GPS",
              fontSize: 14,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              lightColor: Colors.grey[700],
              padding: EdgeInsets.symmetric(
                vertical: 8,
              ),
            ),
            ElevatedButton(
              child: Text("Continuar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffff5400),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                confirmOnTap();
                Navigator.of(context).pop();
              },
            )
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
