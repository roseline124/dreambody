import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/graphqlService.dart';

// authenticate
import 'blocs/auth/authRepository.dart';
import 'blocs/auth/authBloc.dart';
import 'blocs/auth/events.dart';
import 'blocs/simpleBlocObserver.dart';

// screens
import 'screens/typeSelectionScreen/typeSelection.dart';
import 'screens/homeScreen/homeScreen.dart';
import 'screens/dashboardScreen/waterDashboard.dart';
import 'screens/signInScreen/signIn.dart';
import 'theme/index.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final authRepository = AuthRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(authRepository: authRepository)
          ..add(AuthenticationStarted());
      },
      child: DreamBodyApp(authRepository: authRepository),
    ),
  );
}

class DreamBodyApp extends StatelessWidget {
  final AuthRepository authRepository;
  const DreamBodyApp({Key key, this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlService.getClient(authRepository: authRepository),
      child: CacheProvider(
          child: MaterialApp(
        theme: dreamBodyTheme,
        title: 'Dream Body',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(authRepository: authRepository),
          '/login': (context) => SignInScreen(authRepository: authRepository),
          '/questions': (context) => TypeSelection(),
          '/water': (context) => WaterDashboard(),
        },
      )),
    );
  }
}
