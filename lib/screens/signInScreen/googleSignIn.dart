import 'dart:async';

// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const loginRedirectUrl =
    'http://localhost:8080/oauth2/authorize/google?redirect_uri=http://localhost:8080/oauth2/redirect';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

class GoogleSignInScreen extends StatefulWidget {
  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

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
          // todo: 환경변수, constants로 빼기
          // constant: https://stackoverflow.com/questions/54069239/whats-the-best-practice-to-keep-all-the-constants-in-flutter
          if (url.startsWith('http://localhost:8080/oauth2/redirect')) {
            RegExp regExp = new RegExp("(?<=token=)(.*)");
            this.token = regExp.firstMatch(url)?.group(1);

            // todo: login with token
            print(this.token);
            // http.get('http://localhost:8080/user/me',
            //     headers: {'Authorization': 'Bearer ${this.token}'});
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
    return new WebviewScaffold(
      userAgent: kAndroidUserAgent,
      url: loginRedirectUrl,
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
