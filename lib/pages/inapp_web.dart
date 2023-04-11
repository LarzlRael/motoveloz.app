part of 'pages.dart';

class InappWeb extends StatefulWidget {
  const InappWeb({super.key, required this.loadWeb});

  @override
  State<InappWeb> createState() => _InappWebState();
  final LoadWeb loadWeb;
}

class _InappWebState extends State<InappWeb> {
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
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryColor),
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      )
                    : Container(),
              ),
              Expanded(
                child: Container(
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
                      setState(() {
                        this.progress = progress / 100;
                      });
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
