import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MYWeb extends StatefulWidget {

  @override
  State<MYWeb> createState() => _WebVIewState();
}

class _WebVIewState extends State<MYWeb> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      const WebView(
        initialUrl: 'https://krishworks.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}


class MyWeb1 extends StatefulWidget {
  const MyWeb1({Key? key}) : super(key: key);

  @override
  State<MyWeb1> createState() => _MyWeb1State();
}

class _MyWeb1State extends State<MyWeb1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      const WebView(
        initialUrl: 'https://krishworks.com/about/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );  }
}


class MyWeb2 extends StatefulWidget {
  const MyWeb2({Key? key}) : super(key: key);

  @override
  State<MyWeb2> createState() => _MyWeb2State();
}

class _MyWeb2State extends State<MyWeb2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      const WebView(
        initialUrl: 'https://krishworks.com/updates/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class MyWeb3 extends StatefulWidget {
  const MyWeb3({Key? key}) : super(key: key);

  @override
  State<MyWeb3> createState() => _MyWeb3State();
}

class _MyWeb3State extends State<MyWeb3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      Center(
        child: const WebView(
          initialUrl: 'https://krishworks.com/gallery/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

class MyWeb4 extends StatefulWidget {
  const MyWeb4({Key? key}) : super(key: key);

  @override
  State<MyWeb4> createState() => _MyWeb4State();
}

class _MyWeb4State extends State<MyWeb4> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      Container(
        height: 300,
        child: Center(
          child: const WebView(
            initialUrl: 'https://krishworks.com/contact/',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}




