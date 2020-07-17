import 'package:dreambody/bloc/IntakeInfoBloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dreambody/bloc/BlocProvider.dart';
import 'package:dreambody/bloc/UserInfoBloc.dart';

import 'widgets/hexColor.dart';
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

import './screens/dashboardScreen/perDayDashboard.dart';

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
<<<<<<< HEAD
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserInfoBloc(),
      child: MaterialApp(
=======
  final AuthRepository authRepository;
  const DreamBodyApp({Key key, this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlService.getClient(authRepository: authRepository),
      child: CacheProvider(
          child: MaterialApp(
>>>>>>> 527cd0169a16eb590a6652b606af009cfb20a07c
        theme: ThemeData(
          primaryColor: Color.fromRGBO(127, 102, 255, 1),
          accentColor: HexColor('#ffcc00'),
        ),
        title: 'Dream Body',
        initialRoute: '/',
        routes: {
<<<<<<< HEAD
          '/': (context) => HomeScreen(),
          '/login': (context) => SignInScreen(),
          '/questions': (context) => TypeSelection(),
          '/water': (context) => WaterDashboard(),
        },
      ),
=======
          '/': (context) => HomeScreen(authRepository: authRepository),
          '/login': (context) => SignInScreen(authRepository: authRepository),
          '/questions': (context) => TypeSelection(),
          '/water': (context) => WaterDashboard(),
        },
      )),
>>>>>>> 527cd0169a16eb590a6652b606af009cfb20a07c
    );
  }
}