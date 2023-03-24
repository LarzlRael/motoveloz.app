part of 'pages.dart';

class WebViewPage extends StatefulWidget {
  final LoadWeb loadWeb;

  const WebViewPage({Key? key, required this.loadWeb}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
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
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
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
                  SimpleText(
                    text: widget.loadWeb.title.toTitleCase(),
                    /* marginVertical: 10, */
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  const CircularProgressIndicator(),
                ],
              ))
            : WebViewWidget(
                controller: controller,
              ),
      ),
    );
  }
}
