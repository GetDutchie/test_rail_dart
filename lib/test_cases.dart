import 'package:test_rail_dart/shared_links.dart';
import 'package:test_rail_dart/test_case.dart';

class TestCases {
  final int? limit;
  final Links? links;
  final int? offset;
  final List<TestCase>? runs;
  final int? size;

  TestCases({
    this.limit,
    this.links,
    this.offset,
    this.runs,
    this.size,
  });

  factory TestCases.fromJson(Map<String, dynamic> json) {
    final runs = json['cases']
        ?.map((r) => TestCase.fromJson(r))
        .toList()
        .cast<TestCase>();

    return TestCases(
      limit: json['limit'],
      links: Links.fromJson(json['_links']),
      offset: json['offset'],
      runs: runs,
      size: json['size'],
    );
  }

  Map<String, dynamic> get asJson => {
        'limit': limit,
        '_links': links?.asJson,
        'offset': offset,
        'cases': runs?.map((e) => e.asJson).toList(),
        'size': size,
      };
}
