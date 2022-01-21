import 'package:test_rail_dart/shared_links.dart';
import 'package:test_rail_dart/test_result.dart';

class TestResults {
  final int? limit;
  final Links? links;
  final int? offset;
  final List<TestResult>? results;
  final int? size;

  TestResults({
    this.limit,
    this.links,
    this.offset,
    this.results,
    this.size,
  });

  factory TestResults.fromJson(Map<String, dynamic> json) {
    final results = json['results']
        ?.map((r) => TestResult.fromJson(r))
        .toList()
        .cast<TestResult>();

    return TestResults(
      limit: json['limit'],
      links: Links.fromJson(json['_links']),
      offset: json['offset'],
      results: results,
      size: json['size'],
    );
  }

  Map<String, dynamic> get asJson => {
        'limit': limit,
        '_links': links?.asJson,
        'offset': offset,
        'results': results?.map((e) => e.asJson).toList(),
        'size': size,
      };
}
