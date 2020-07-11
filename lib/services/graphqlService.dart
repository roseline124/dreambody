// https://pub.dev/packages/graphql_flutter#-readme-tab-
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'authService.dart';
import 'package:dreambody/config.dart';

class GraphqlService {
  static final _serverBaseUrl = serverBaseUrl;

  ValueNotifier<GraphQLClient> getClient() {
    final _auth = AuthService();
    final _authLink = AuthLink(getToken: () => _auth.getToken());

    final HttpLink _httpLink = HttpLink(
      uri: '$_serverBaseUrl/graphql',
    );
    final _link = _authLink.concat(_httpLink);

    return ValueNotifier(GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    ));
  }
}

final graphqlService = GraphqlService();
