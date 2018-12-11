import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url = "https://www.dbank.co.id";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Example',
      theme: ThemeData.dark(),
      routes: {
        "/": (_) =>
            WebviewScaffold(
              url: url,
              appBar: AppBar(
                title: Text('WebView Details'),
              ),
              withJavascript: true,
              withLocalStorage: true,
              withZoom: true,
            ),
      },
    );
  }
}

class WebView extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {

  final _webView = FlutterWebviewPlugin();
  TextEditingController _controller = TextEditingController(text: url);

  @override
  void initState() {
    super.initState();
    _webView.close();
    _controller.addListener(() {
      url = _controller.text;
    });
  }

  @override
  void dispose() {
    _webView.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
              ),
            ),
            RaisedButton(
              child: Text('Open WebView'),
              onPressed: () {
                Navigator.of(context).pushNamed('/webview');
              },
            ),
          ],
        ),
      ),
    );
  }
}
