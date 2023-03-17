import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:url_launcher/url_launcher_string.dart';

void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> openBrowserTab(String urlToGo) async {
  await FlutterWebBrowser.openWebPage(
    url: urlToGo,
    customTabsOptions: CustomTabsOptions(
      showTitle: true,
      urlBarHidingEnabled: true,
    ),
  );
}
