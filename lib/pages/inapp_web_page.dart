part of 'pages.dart';

class InappWebPage extends StatefulWidget {
  const InappWebPage({super.key, required this.loadWeb});

  @override
  State<InappWebPage> createState() => _InappWebPageState();
  final LoadWeb loadWeb;
}

class _InappWebPageState extends State<InappWebPage> {
  late InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;
  @override
  void initState() {
    checkLocationPermission(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.loadWeb.title.toTitleCase()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: widget.loadWeb.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.loadWeb.imageAsset,
                  width: 40,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: progress < 1.0
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 300,
                        height: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
              Expanded(
                child: Container(
                  child: WillPopScope(
                    child: InAppWebView(
                      androidOnGeolocationPermissionsShowPrompt:
                          (InAppWebViewController controller,
                              String origin) async {
                        return GeolocationPermissionShowPromptResponse(
                          origin: origin,
                          allow: true,
                          retain: true,
                        );
                      },
                      initialUrlRequest:
                          URLRequest(url: Uri.parse(widget.loadWeb.url)),
                      initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                              /* debuggingEnabled: true, */
                              )),
                      onWebViewCreated: (InAppWebViewController controller) {
                        _webViewController = controller;
                      },
                      onLoadError: (controller, url, code, message) async {
                        /* _webViewController.goBack(); */

                        /*  await controller.loadUrl(
                          urlRequest: URLRequest(
                            url: Uri.parse(widget.loadWeb.url),
                          ),
                        ); */
                        Navigator.pushReplacementNamed(context, 'loading_page');
                        String action = url.toString().split(':').first;
                        List<String> customActions = [
                          'tel',
                          'whatsapp',
                          'mailto',
                          'fb',
                        ];
                        bool isCustomAction = customActions.contains(action);
                        if (isCustomAction) {
                          launchURLString(url.toString());
                        }
                      },

                      /* onLoadStart: (InAppWebViewController controller, String url) {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onLoadStop:
                      (InAppWebViewController controller, String url) async {
                    setState(() {
                      this.url = url;
                    });
                  }, */

                      onProgressChanged:
                          (InAppWebViewController controller, int progress) {
                        print(progress);
                        setState(() {
                          this.progress = (progress / 100);
                        });
                      },
                    ),
                    onWillPop: () async {
                      if (await _webViewController.canGoBack()) {
                        await _webViewController.goBack();
                        return false;
                      } else {
                        return true;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
