// https://pub.dev/packages/graphql_flutter#-readme-tab-
import 'package:dreambody/blocs/auth/authRepository.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:dreambody/config.dart';

class GraphqlService {
  static final String _serverBaseUrl = serverBaseUrl;

  ValueNotifier<GraphQLClient> getClient({authRepository: AuthRepository}) {
    final _authRepository = authRepository;
    final _authLink =
        AuthLink(getToken: () => 'Bearer ${_authRepository.token}');
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
