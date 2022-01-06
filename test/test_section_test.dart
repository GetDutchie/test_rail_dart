import 'package:test/test.dart';
import 'package:test_rail/test_section.dart';
import '__helpers__.dart';
import 'data/sample_test_section.dart';

void main() {
  group('TestSection', () {
    test('#get', () async {
      stubTestRailConfig(sampleTestSection);
      final result = await TestSection.get(1);

      expect(result.asJson, sampleTestSection);
    });
  });
}
