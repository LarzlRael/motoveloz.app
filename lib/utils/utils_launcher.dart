part of 'utils.dart';

/* void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
} */

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
    'go_url',
    arguments: loadWeb,
  );
}
