import 'package:test/test.dart';
import 'package:test_rail_dart/test_result.dart';
import 'package:test_rail_dart/test_run.dart';
import 'package:test_rail_dart/test_section.dart';
import '__helpers__.dart';
import 'data/sample_test_case_result.dart';
import 'data/sample_test_result.dart';
import 'data/sample_test_results_test_result.dart';
import 'data/sample_test_run.dart';
import 'data/sample_test_run_results.dart';
import 'data/sample_test_runs.dart';
import 'data/sample_test_section.dart';

void main() {
  group('TestRun', () {
    test('.get', () async {
      stubTestRailConfig(sampleTestSection);
      final result = await TestSection.get(1);

      expect(result.asJson, sampleTestSection);
    });

    test('.create', () async {
      stubTestRailConfig(sampleTestRun);
      final result = await TestRun.create(
        caseIds: [1, 2, 3, 4, 7, 8],
        includeAll: false,
        name: 'This is a new test run',
        projectId: 1,
      );

      expect(result.asJson, sampleTestRun);
    });

    test('.getAll', () async {
      stubTestRailConfig(sampleTestRuns);
      final result = await TestRun.getAll(
        projectId: 1,
        offset: 2,
        limit: 2,
      );

      expect(result.asJson, sampleTestRuns);
    });

    test('#update', () async {
      stubTestRailConfig(sampleTestRun);
      final newRun = await TestRun.create(
        caseIds: [1, 2, 3, 4, 7, 8],
        includeAll: false,
        name: 'This is a new test run',
        projectId: 1,
      );
      final result = await newRun.update(caseIds: [], includeAll: false);
      expect(result.asJson, sampleTestRun);
    });

    test('#close', () async {
      stubTestRailConfig(sampleTestRun);
      final newRun = await TestRun.create(
        caseIds: [1, 2, 3, 4, 7, 8],
        includeAll: false,
        name: 'This is a new test run',
        projectId: 1,
      );
      final result = await newRun.close();
      expect(result.asJson, sampleTestRun);
    });

    test('#addResultForCase', () async {
      stubTestRailConfig(sampleForTestResult);
      final newRun = await TestRun.create(
        caseIds: [1, 2, 3, 4, 7, 8],
        includeAll: false,
        name: 'This is a new test run',
        projectId: 1,
      );
      final result = await newRun.addResultForCase(
        1257,
        comment: 'Test failed',
        elapsed: '1m 45s',
        statusId: 5,
      );
      expect(result.asJson, sampleForTestResult);
    });

    test('#getResultsForTest', () async {
      stubTestRailConfig(sampleForTestResultsTestResult);
      final runResults = await TestResult.getTestRunSingleTestResults(
        testId: 1868150,
      );

      expect(runResults.asJson, sampleForTestResultsTestResult);
    });

    test('#getResultsForRun', () async {
      stubTestRailConfig(sampleForTestRunResults);
      final runResults = await TestResult.getRunResults(
        1818,
        statusId: [5, 1],
      );

      expect(runResults.asJson, sampleForTestRunResults);
    });

    test('#getResultsForTestCaseFromTestRun', () async {
      stubTestRailConfig(sampleForTestCaseResult);
      final runResults = await TestResult.getCaseResults(
        184234,
        runId: 1818,
      );

      expect(runResults.asJson, sampleForTestCaseResult);
    });
  });
}
