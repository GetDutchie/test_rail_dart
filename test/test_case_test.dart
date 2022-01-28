import 'package:test/test.dart';
import 'package:test_rail_dart/test_case.dart';
import '__helpers__.dart';
import 'data/sample_test_case.dart';

void main() {
  group('TestSection', () {
    test('#create', () async {
      stubTestRailConfig(sampleForNewTestCase);
      final result = await TestCase.create(5598, title: 'Case #2');
      expect(result.asJson, sampleForNewTestCase);
    });

    test('#get', () async {
      stubTestRailConfig(sampleTestCase);
      final result = await TestCase.get(1);
      expect(result.asJson, sampleTestCase);
    });

    test('#getAll', () async {
      stubTestRailConfig(sampleForTestCases);
      final result = await TestCase.getAll(1);
      expect(result.asJson, sampleForTestCases);
    });
  });
}
