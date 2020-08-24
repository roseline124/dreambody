import 'package:dreambody/blocs/info/infoBloc.dart';
import 'package:dreambody/blocs/info/infoRepository.dart';
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
import 'screens/dashboardScreen/waterDashBoard/waterDashboard.dart';
import 'screens/signInScreen/googleSignIn.dart';
import 'screens/dashboardScreen/dashBoardScreen.dart';

import 'theme/index.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final authRepository = AuthRepository();
  final infoRepository = InfoRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(authRepository: authRepository)
          ..add(AuthenticationStarted());
      },
      child: BlocProvider<InformationBloc>(
        create: (context) {
          return InformationBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            authRepository: authRepository,
            infoRepository: infoRepository,
          );
        },
        child: DreamBodyApp(authRepository: authRepository, infoRepository: infoRepository),
      ),
    ),
  );
}

class DreamBodyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final InfoRepository infoRepository;
  const DreamBodyApp({Key key, this.authRepository, this.infoRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlService.getClient(authRepository: authRepository),
      child: CacheProvider(
          child: MaterialApp(
            theme: dreamBodyTheme,
            title: 'Dream Body',
            routes: {
              '/': (context) => GoogleSignInScreen(authRepository: authRepository, infoRepository: infoRepository),
              '/login': (context) =>
                  GoogleSignInScreen(authRepository: authRepository, infoRepository: infoRepository),
              '/questions': (context) => TypeSelection(),
              '/dashboard': (context) => DashBoardScreen(),
              '/water': (context) => WaterDashboard(),
            },
      )),
    );
  }
}
