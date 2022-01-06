// ignore_for_file: unused_local_variable
import 'package:test_rail/test_rail.dart';
import 'package:test_rail/test_case.dart';
import 'package:test_rail/test_run.dart';
import 'package:test_rail/test_section.dart';

void main(List<String> args) async {
  TestRail.configure(
    serverDomain: args[0],
    username: args[1],
    password: args[2],
  );

  // replace with your own caseId
  final testCase = await TestCase.get(142864);

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

  await newRun.update(
    caseIds: [1, 6, 7],
    includeAll: false,
  );

  // Replace with attachment path
  await testCaseResult.addAttachment('<attachment_path>');
}