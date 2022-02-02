import 'package:test/test.dart';
import 'package:test_rail_dart/test_case_history.dart';
import '__helpers__.dart';
import 'data/sample_test_case.dart';

void main() {
  group('TestCase', () {
    test('.get', () async {
      stubTestRailConfig(sampleForTestCaseHistory);
      final result = await TestCaseHistory.get(1);
      expect(result.asJson, sampleForTestCaseHistory);
    });
  });
}
