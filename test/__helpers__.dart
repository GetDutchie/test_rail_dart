import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_rail_dart/test_rail.dart';
import 'package:http/testing.dart' as testing;

TestRail stubTestRailConfig(Map<String, dynamic> sample) {
  return TestRail.configure(
    username: 'userName',
    password: 'password',
    serverDomain: 'test.testrail.com',
    client: testing.MockClient((request) async {
      return http.Response(jsonEncode(sample), 200);
    }),
  );
}
