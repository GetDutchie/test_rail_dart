import 'package:test_rail_dart/src/test_rail_http_client.dart';
import 'package:test_rail_dart/test_rail.dart';

class TestCase {
  final int? createdBy;
  final DateTime? createdOn;
  final String? customExpected;
  final String? customPreconds;
  final String? customSteps;
  final List<CustomStep>? customStepsSeparated;
  final String? estimate;
  final String? estimateForecast;
  final int id;
  final int? milestoneId;
  final int? priorityId;
  final String? refs;
  final int? sectionId;
  final int? suiteId;
  final String? title;
  final int? typeId;
  final int? updatedBy;
  final DateTime? updatedOn;

  TestCase({
    this.createdBy,
    this.createdOn,
    this.customExpected,
    this.customPreconds,
    this.customSteps,
    this.customStepsSeparated,
    this.estimate,
    this.estimateForecast,
    required this.id,
    this.milestoneId,
    this.priorityId,
    this.refs,
    this.sectionId,
    this.suiteId,
    this.title,
    this.typeId,
    this.updatedBy,
    this.updatedOn,
  });

  factory TestCase.fromJson(Map<String, dynamic> json) {
    DateTime? createdOn;
    DateTime? updatedOn;

    if (json['created_on'] != null) {
      createdOn = DateTime.fromMillisecondsSinceEpoch(json['created_on']);
    }

    if (json['updated_on'] != null) {
      updatedOn = DateTime.fromMillisecondsSinceEpoch(json['updated_on']);
    }
    var customStepsSeparated = <CustomStep>[];

    if (json['custom_steps_separated'] != null) {
      customStepsSeparated = List.from(
        json['custom_steps_separated'].map(
          (stepJson) => CustomStep.fromJson(stepJson),
        ),
      );
    }

    return TestCase(
      createdBy: json['created_by'],
      createdOn: createdOn,
      customExpected: json['custom_expected'],
      customPreconds: json['custom_preconds'],
      customSteps: json['custom_steps'],
      customStepsSeparated: customStepsSeparated,
      estimate: json['estimate'],
      estimateForecast: json['estimate_forecast'],
      id: json['id'],
      milestoneId: json['milestone_id'],
      priorityId: json['priority_id'],
      refs: json['refs'],
      sectionId: json['section_id'],
      suiteId: json['suite_id'],
      title: json['title'],
      typeId: json['type_id'],
      updatedBy: json['updated_by'],
      updatedOn: updatedOn,
    );
  }

  static Future<TestCase> get(int caseId) async {
    final response = await TestRail.instance.client
        .request('/get_case/$caseId', RequestMethod.get);
    return TestCase.fromJson(response);
  }

  Map<String, dynamic> get asJson => {
        'created_by': createdBy,
        'created_on': createdOn?.millisecondsSinceEpoch,
        'custom_steps_separated':
            customStepsSeparated?.map((v) => v.asJson).toList(),
        'custom_expected': customExpected,
        'custom_preconds': customPreconds,
        'custom_steps': customSteps,
        'estimate': estimate,
        'estimate_forecast': estimateForecast,
        'id': id,
        'milestone_id': milestoneId,
        'priority_id': priorityId,
        'refs': refs,
        'section_id': sectionId,
        'suite_id': suiteId,
        'title': title,
        'type_id': typeId,
        'updated_by': updatedBy,
        'updated_on': updatedOn?.millisecondsSinceEpoch,
      };
}

class CustomStep {
  final String? content;
  final String? additionalInfo;
  final String? expected;
  final String? refs;
  final int? sharedStepId;

  CustomStep({
    this.content,
    this.additionalInfo,
    this.expected,
    this.refs,
    this.sharedStepId,
  });

  factory CustomStep.fromJson(Map<String, dynamic> json) {
    return CustomStep(
      content: json['content'],
      additionalInfo: json['additional_info'],
      expected: json['expected'],
      refs: json['refs'],
      sharedStepId: json['shared_step_id'],
    );
  }

  Map<String, dynamic> get asJson => {
        'content': content,
        'additional_info': additionalInfo,
        'expected': expected,
        'refs': refs,
        if (sharedStepId != null) 'shared_step_id': sharedStepId,
      };
}
