part of 'pages.dart';

class WebViewPage extends StatefulWidget {
  final LoadWeb loadWeb;

  const WebViewPage({Key? key, required this.loadWeb}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  int progressLoading = 0;
  bool isLoading = true;
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              progressLoading = progress;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print("**********");
            print(request.url);
            print("**********");
            if (request.url.startsWith('https://www.youtube.com/')) {
              launchURL(
                request.url,
                webComes: widget.loadWeb.url,
              );
            }
            if (request.url.contains('whatsapp:/')) {
              launchURL(
                request.url,
                webComes: widget.loadWeb.url,
              );
              return NavigationDecision.prevent;
            }
            if (request.url.contains('facebook.com') ||
                request.url.contains('fb://')) {
              launchURL(
                request.url,
                webComes: widget.loadWeb.url,
              );
              return NavigationDecision.prevent;
            }
            if (request.url.contains('tel:')) {
              launchURL(
                request.url,
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.loadWeb.url));
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                widget.loadWeb.imageAsset,
                width: 40,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: isLoading
            ? Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          10.0), // Ajusta el valor de 10.0 según tus necesidades
                    ),
                    child: Image.asset(
                      widget.loadWeb.title,
                      fit: BoxFit.cover,
                    ),
                  ), */
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Hero(
                      tag: widget.loadWeb.title,
                      child: Image.asset(
                        widget.loadWeb.imageAsset,
                        width: 250.0,
                        height: 200.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  /* const CircularProgressIndicator(), */
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 300,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: progressLoading / 100,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xffff5400)),
                        backgroundColor: Color(0xffD6D6D6),
                      ),
                    ),
                  )
                ],
              ))
            : WillPopScope(
                child: WebViewWidget(
                  controller: controller,
                ),
                onWillPop: () async {
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                    return false;
                  } else {
                    return true;
                  }
                },
              ),
      ),
    );
  }
}
