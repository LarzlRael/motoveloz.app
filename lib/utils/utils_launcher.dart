part of 'utils.dart';

void launchURL(String url, {String webComes = ""}) async {
  final bool isWhatsapp = url.contains('whatsapp');
  final phone = '+59178972475';
  final message =
      'Hola, vengo de $webComes Deseo realizar el siguiente pedido: ';

  final whatsappUrl = sendWhatsappMessage(phone, message);
  final loadUrl = isWhatsapp ? whatsappUrl : url;

  if (await canLaunchUrlString(loadUrl)) {
    await launchUrlString(loadUrl);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchURLString(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

String convertirString(String input) {
  // Reemplazar el protocolo "https" por "https:"
  String output = input.replaceFirst("whatsapp:", "whatsapp.com");

  // Eliminar la barra diagonal adicional antes del parámetro "send"
  output = output.replaceFirst("//send", "/send");

  final getPhoneAndNumer = sendWAMessage(output);
  final phone = getPhoneAndNumer['phone']!;
  final text = getPhoneAndNumer['text']!;
  return sendWhatsappMessage(phone, text);
}

Map<String, String> sendWAMessage(String url) {
  Uri uri = Uri.parse(url);

  String phone = uri.queryParameters['phone']!;
  String text = Uri.decodeFull(uri.queryParameters['text']!);
  return {'phone': phone, 'text': text};
}

String sendWhatsappMessage(String phone, String message) {
  return Platform.isAndroid
      ?
      // add the [https]
      "whatsapp://send?phone=${phone}" + "&text=${Uri.encodeComponent(message)}"

      // add the [https]
      : "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}";
}

class LoadWeb {
  final String url;
  final String title;
  final String imageAsset;

  LoadWeb({
    required this.url,
    required this.title,
    required this.imageAsset,
  });
}

/* Future<void> openBrowserTab(String urlToGo) async {
  await FlutterWebBrowser.openWebPage(
    url: urlToGo,
    customTabsOptions: CustomTabsOptions(
      colorScheme: CustomTabsColorScheme.dark,
      toolbarColor: Colors.deepPurple,
      secondaryToolbarColor: Colors.green,
      shareState: CustomTabsShareState.on,
      instantAppsEnabled: true,
      showTitle: false,
      urlBarHidingEnabled: false,
    ),
    safariVCOptions: SafariViewControllerOptions(),
  );
}
 */

void goUrlSelected(BuildContext context, LoadWeb loadWeb) {
  Navigator.pushNamed(
    context,
    'web_view',
    arguments: loadWeb,
  );
}
