import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:dreambody/config.dart';
import 'package:dreambody/services/authService.dart';

class GoogleSignInScreen extends StatefulWidget {
  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final AuthService authService = AuthService();

  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;

  String token;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();

    _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {});
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          if (url.startsWith('$serverBaseUrl/oauth2/redirect')) {
            RegExp regExp = new RegExp("(?<=token=)(.*)");
            this.token = regExp.firstMatch(url)?.group(1);
            authService.saveToken(token: this.token);

            Navigator.of(context).pushNamed("/questions");
            flutterWebviewPlugin.close();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    flutterWebviewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      userAgent: K_Android_UserAgent,
      url: loginUrl,
      appBar: new AppBar(
        title: const Text('구글 로그인'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 30),
              Text(
                '잠시만 기다려주세요.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              )
            ],
          ),
        ),
      ),
    );
  }
}
