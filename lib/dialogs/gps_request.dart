import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

gps_request(BuildContext context, String title, Widget content,
    VoidCallback confirmOnTap) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      context.pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continuar"),
    onPressed: () {
      /* TODO onclickByArgument */
      confirmOnTap();
      context.pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
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
