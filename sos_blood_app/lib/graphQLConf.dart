import 'dart:io' show Platform;
import 'package:flutter/material.dart';
// import 'package:universal_platform/universal_platform.dart';
import 'package:platform/platform.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String get host {
  if (Platform.android != null) {
    return '10.0.2.2';
  } else {
    return '127.0.0.1';
  }
}

final graphEndPoint = 'http://$host:8000/graphql';

// class AuthenticationState with ChangeNotifier {
//   final _token = [];
//   dynamic get authenticationToken => _token;

//   void isAuthenticated() {
//     _token.add("tokenAdded");
//     notifyListeners();
//   }

//   void isNotAuthenticated() {
//     _token.clear();
//     notifyListeners();
//   }
// }

class GraphQLConfiguration {
  //   final AuthenticationState authenticationState = Provider.of<AuthenticationState>(context);
  //   late Link link;
  //   final HttpLink httpLink = HttpLink(graphEndPoint);
  // if (authenticationState.authenticationToken != null && authenticationState.authenticationToken.isNotEmpty) {
  //     final AuthLink authLink = AuthLink(
  //       getToken: () => 'Bearer ${authenticationState.authenticationToken}',
  //     );
  //     link = authLink.concat(httpLink);
  //   } else {
  //     link = httpLink;
  //   }

  static HttpLink httpLink = HttpLink(
    'https://sos-blood-backend.herokuapp.com/graphql',
    // Uri.parse(authenticationState.authenticationToken != null &&
    //         authenticationState.authenticationToken.isNotEmpty
    //     ? graphEndPoint
    //     : 'http://localhost:8000/graphql'),
    // 'http://10.0.2.2:8000/graphql',
    // 'http://127.0.0.1:8000/graphql',
    // 'http://localhost:8000/graphql',
    // graphEndPoint,
    // defaultHeaders: <String, String>{
    //   'authenticationToken': 'Bearer ${AuthenticationState.authenticationToken}',
    //   'Authorization': 'Bearer ${AuthenticationState.authenticationToken}',
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Access-Control-Allow-Origin': '*',
    //   'Access-Control-Allow-Methods': '*',
    //   'Access-Control-Allow-Headers': '*',
    //   'Access-Control-Allow-Credentials': 'true',
    //   'Access-Control-Expose-Headers': '*',
    //   'xmlHttpRequest': 'true',
    // },

    // 'http://10.0.2.2:8000/graphql',
    // defaultHeaders: const {
    //   'Authorization': 'true',
    // },
    // parser: const ResponseParser(),
    // httpResponseDecoder: (httpResponse) {
    //   final body = httpResponse.body;
    //   final statusCode = httpResponse.statusCode;
    //   final headers = httpResponse.headers;
    //   return body;
    // },
  );

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }
}
