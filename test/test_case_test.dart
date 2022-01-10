import 'package:test/test.dart';
import 'package:test_rail_dart/test_case.dart';
import '__helpers__.dart';
import 'data/sample_test_case.dart';

void main() {
  group('TestSection', () {
    test('#get', () async {
      stubTestRailConfig(sampleTestCase);
      final result = await TestCase.get(1);
      expect(result.asJson, sampleTestCase);
    });
  });
}
