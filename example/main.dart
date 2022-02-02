// ignore_for_file: unused_local_variable
import 'package:test_rail_dart/test_rail.dart';
import 'package:test_rail_dart/test_case.dart';
import 'package:test_rail_dart/test_case_history.dart';
import 'package:test_rail_dart/test_run.dart';
import 'package:test_rail_dart/test_section.dart';

void main(List<String> args) async {
  TestRail.configure(
    serverDomain: args[0],
    username: args[1],
    password: args[2],
  );

  // replace with your own caseId
  final testCase = await TestCase.get(142864);

  final createdTestCase = await TestCase.create(
    // replace with your own sectionId
    1,
    title: 'Test case from API',
    customValues: <String, dynamic>{
      // Custom fields start with "custom_" prefix
      'custom_feedback': 'This case should be tested last',
    },
  );

  final testCases = await TestCase.getAll(9, limit: 1);

  // replace with your own projectId, extra parameters available in method
  final testRuns = await TestRun.getAll(projectId: 1125, limit: 10);

  // replace with your own projectId
  final testRun = await TestRun.get(1125);

  // replace with your own sectionId
  final section = await TestSection.get(13);
  final newRun = await TestRun.create(
    caseIds: [testCase.id],
    description: '121',
    name: 'newRun',
    // replace with your own projectId
    projectId: 134,
  );

  final testCaseResult = await newRun.addResultForCase(
    testCase.id,
    // Status - 1: PASSED
    statusId: 1,
  );

  final testCaseHistory = await TestCaseHistory.get(1231);
}
