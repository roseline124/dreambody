import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'widgets/hexColor.dart';
import 'services/graphqlService.dart';
import 'package:dreambody/screens/typeSelectionScreen/typeSelection.dart';
import './screens/homeScreen/homeScreen.dart';
import './screens/dashboardScreen/waterDashboard.dart';
import './screens/signInScreen/signIn.dart';

void main() {
  runApp(DreamBodyApp());
}

class DreamBodyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlService.client,
      child: CacheProvider(
          child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color.fromRGBO(127, 102, 255, 1),
          accentColor: HexColor('#ffcc00'),
        ),
        title: 'Dream Body',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/login': (context) => SignInScreen(),
          '/questions': (context) => TypeSelection(),
          '/water': (context) => WaterDashboard()
        },
      )),
    );
  }
}
