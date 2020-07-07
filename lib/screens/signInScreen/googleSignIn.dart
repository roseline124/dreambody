import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:dreambody/.env.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dreambody/blocs/login/loginBloc.dart';
import 'package:dreambody/blocs/login/events.dart';

final serverBaseUrl = environment['SERVER_BASE_URL'];
final loginUrl =
    '$serverBaseUrl/oauth2/authorize/google?redirect_uri=$serverBaseUrl/oauth2/redirect';
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
          if (url.startsWith('$serverBaseUrl/oauth2/redirect')) {
            RegExp regExp = new RegExp("(?<=token=)(.*)");
            this.token = regExp.firstMatch(url)?.group(1);

            BlocProvider.of<LoginBloc>(context)
                .add(LoginButtonPressed(token: token));

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
