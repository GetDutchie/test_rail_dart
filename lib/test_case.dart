import 'package:test_rail_dart/src/test_rail_http_client.dart';
import 'package:test_rail_dart/test_cases.dart';
import 'package:test_rail_dart/test_rail.dart';

class TestCase {
  final int? createdBy;
  final DateTime? createdOn;
  final Map<String, dynamic>? customAttributes;
  final int? displayOrder;
  final String? estimate;
  final String? estimateForecast;
  final int id;
  final int? isDeleted;
  final int? milestoneId;
  final int? priorityId;
  final String? refs;
  final int? sectionId;
  final int? suiteId;
  final int? templateId;
  final String? title;
  final int? typeId;
  final int? updatedBy;
  final DateTime? updatedOn;

  TestCase({
    this.createdBy,
    this.createdOn,
    this.displayOrder,
    this.estimate,
    this.estimateForecast,
    required this.id,
    this.isDeleted,
    this.milestoneId,
    this.priorityId,
    this.refs,
    this.sectionId,
    this.suiteId,
    this.templateId,
    this.title,
    this.typeId,
    this.updatedBy,
    this.updatedOn,
    this.customAttributes,
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

    Map<String, dynamic> customAttributes = {};
    var customStepsSeparated = [];

    for (final element in json.entries) {
      if (element.key.contains("custom_")) {
        customAttributes.putIfAbsent(element.key, () => element.value);
      }

      if (element.key == "custom_steps_separated" && element.value != null) {
        customStepsSeparated = List.from(
          element.value.map(
            (stepJson) => CustomStep.fromJson(stepJson),
          ),
        );
        customAttributes.update(element.key, (value) => customStepsSeparated);
      }
    }

    return TestCase(
      createdBy: json['created_by'],
      createdOn: createdOn,
      displayOrder: json['display_order'],
      estimate: json['estimate'],
      estimateForecast: json['estimate_forecast'],
      id: json['id'],
      isDeleted: json['is_deleted'],
      milestoneId: json['milestone_id'],
      priorityId: json['priority_id'],
      refs: json['refs'],
      sectionId: json['section_id'],
      suiteId: json['suite_id'],
      templateId: json['template_id'],
      title: json['title'],
      typeId: json['type_id'],
      updatedBy: json['updated_by'],
      updatedOn: updatedOn,
      customAttributes: customAttributes['custom_attributes'],
    );
  }

  static Future<TestCase> create(
    int sectionId, {
    required String title,
    int? templateId,
    int? typeId,
    int? priorityId,
    String? estimate,
    int? milestoneId,
    String? refs,
    Map<String, dynamic>? customValues,
  }) async {
    final parametersMap = {
      'title': title,
      if (templateId != null) 'template_id': templateId,
      if (typeId != null) 'type_id': typeId,
      if (priorityId != null) 'priority_id': priorityId,
      if (estimate != null) 'estimate': estimate,
      if (milestoneId != null) 'milestone_id': milestoneId,
      if (refs != null) 'refs': refs,
    };

    customValues?.forEach((key, value) {
      parametersMap.putIfAbsent(key, () => value);
    });

    final response = await TestRail.instance.client.request(
      '/add_case/$sectionId',
      RequestMethod.post,
      params: parametersMap,
    );

    return TestCase.fromJson(response);
  }

  static Future<TestCase> get(int caseId) async {
    final response = await TestRail.instance.client
        .request('/get_case/$caseId', RequestMethod.get);
    return TestCase.fromJson(response);
  }

  static Future<TestCases> getAll(
    int projectId, {
    DateTime? createdAfter,
    DateTime? createdBefore,
    Iterable<int>? createdBy,
    String? filter,
    int? limit,
    int? offset,
    Iterable<int>? milestoneId,
    Iterable<int>? priorityId,
    String? refs,
    int? sectionId,
    Iterable<int>? templateId,
    Iterable<int>? typeId,
    DateTime? updatedAfter,
    DateTime? updatedBefore,
    Iterable<int>? updatedBy,
  }) async {
    final queryParameters = <String, dynamic>{
      'created_after': createdAfter?.millisecondsSinceEpoch,
      'created_before': createdBefore?.millisecondsSinceEpoch,
      'created_by': createdBy?.join(','),
      'filter': filter,
      'limit': limit,
      'offset': offset,
      'milestone_id': milestoneId?.join(','),
      'priority_id': priorityId?.join(','),
      'refs_filter': refs,
      'section_id': sectionId,
      'template_id': templateId?.join(','),
      'type_id': typeId?.join(','),
      'updated_after': updatedAfter?.millisecondsSinceEpoch,
      'updated_before': updatedBefore?.millisecondsSinceEpoch,
      'updated_by': updatedBy?.join(','),
    };

    queryParameters.removeWhere((_, dynamic value) => value == null);

    final response = await TestRail.instance.client.request(
      '/get_cases/$projectId',
      RequestMethod.get,
      queryParameters: queryParameters,
    );
    return TestCases.fromJson(response);
  }

  Map<String, dynamic> get asJson => {
        'created_by': createdBy,
        'created_on': createdOn?.millisecondsSinceEpoch,
        'custom_attributes': customAttributes,
        'display_order': displayOrder,
        'estimate': estimate,
        'estimate_forecast': estimateForecast,
        'id': id,
        'is_deleted': isDeleted,
        'milestone_id': milestoneId,
        'priority_id': priorityId,
        'refs': refs,
        'section_id': sectionId,
        'suite_id': suiteId,
        'template_id': templateId,
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
