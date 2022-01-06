import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum RequestMethod { get, post, postMultipart }

class TestRailHttpClient {
  final http.Client client;
  final String password;

  /// The url that points to the TestRail server => https://example.testrail.com
  final String serverDomain;
  final String username;

  static const String _apiVersion = '/index.php?/api/v2';

  TestRailHttpClient({
    http.Client? client,
    required this.password,
    required this.serverDomain,
    required this.username,
  }) : client = client ?? http.Client();

  Future<Map<String, dynamic>> request(
    String endpoint,
    RequestMethod method, {
    // Include `filePath` for `RequestMethod.postMultipart` requests
    String? filePath,
    Map<String, dynamic> params = const {},
  }) async {
    final url = '$serverDomain.$_apiVersion/$endpoint';
    final authorization =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final header = {'authorization': authorization};

    http.Response response;

    switch (method) {
      case RequestMethod.get:
        response = await client.get(Uri.parse(url), headers: header);
        break;
      case RequestMethod.post:
        response = await client.post(Uri.parse(url),
            headers: header, body: jsonEncode(params));
        break;
      case RequestMethod.postMultipart:
        final headers = {...header, 'Content-Type': 'multipart/form-data'};

        final request = http.MultipartRequest('POST', Uri.parse(url));
        final file = await http.MultipartFile.fromPath('attachment', filePath!);

        request.files.add(file);
        request.headers.addAll(headers);

        final streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
        break;
    }

    return jsonDecode(response.body);
  }
}
