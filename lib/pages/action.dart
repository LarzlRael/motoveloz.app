part of 'pages.dart';

class ActionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
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
              expandedButton(
                context,
                "Denegar",
                Colors.white,
                primaryColor,
                () {},
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
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
                      onPressed: context.pop,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget expandedButton(
  BuildContext context,
  String textButton,
  Color colorButton,
  Color colorTextButton,
  void Function()? onPressed,
) {
  return Row(
    children: [
      Expanded(
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
          onPressed: context.pop,
        ),
      ),
    ],
  );
}
