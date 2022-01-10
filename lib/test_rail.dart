import 'package:http/http.dart' as http;
import 'package:test_rail_dart/src/test_rail_http_client.dart';

class TestRail {
  final TestRailHttpClient client;

  TestRail._({
    required this.client,
  });

  static late TestRail instance;

  static TestRail configure({
    required String password,

    /// The url that points to the TestRail server => https://example.testrail.com
    required String serverDomain,
    required String username,
    http.Client? client,
  }) {
    return instance = TestRail._(
      client: TestRailHttpClient(
        client: client,
        password: password,
        serverDomain: serverDomain,
        username: username,
      ),
    );
  }
}
