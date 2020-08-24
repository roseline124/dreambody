import 'dart:async';
import 'package:dreambody/blocs/info/infoRepository.dart';
import 'package:dreambody/screens/dashboardScreen/dashBoardScreen.dart';
import 'package:dreambody/screens/typeSelectionScreen/typeSelection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:dreambody/config.dart';
import 'package:dreambody/blocs/auth/authRepository.dart';
import 'package:dreambody/blocs/auth/authBloc.dart';
import 'package:dreambody/blocs/login/loginBloc.dart';
import 'package:dreambody/blocs/login/events.dart';

const String getUserInfo = r'''
  query getUserInfo {
    userInfo {
        id
    }
}
''';

class GoogleSignInScreen extends StatefulWidget {
  final AuthRepository authRepository;
  final InfoRepository infoRepository;
  GoogleSignInScreen({Key key, this.authRepository, this.infoRepository});

  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  LoginBloc _loginBloc;

  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;

  String token;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        authRepository: widget.authRepository);
    flutterWebviewPlugin.close();

    _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {});
    _onUrlChanged =
        flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      GraphQLClient client = GraphQLProvider.of(context).value;

      final result =
          await client.query(QueryOptions(documentNode: gql(getUserInfo)));

      if (mounted) {
        setState(() {
          if (url.startsWith('$serverBaseUrl/oauth2/redirect')) {
            RegExp regExp = new RegExp("(?<=token=)(.*)");

            this.token = regExp.firstMatch(url)?.group(1);
            _loginBloc.add(LoginSucceed(token: this.token));

            if (result.hasException) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TypeSelection(),
                  ));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoardScreen(token: this.token),
                  ));
            }

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
    return BlocProvider<LoginBloc>(
      create: (context) => _loginBloc,
      child: WebviewScaffold(
        userAgent: K_Android_UserAgent,
        url: loginUrl,
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
      ),
    );
  }
}
