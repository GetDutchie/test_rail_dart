import 'package:test_rail_dart/test_result.dart';
import 'package:test_rail_dart/src/test_rail_http_client.dart';
import 'package:test_rail_dart/test_rail.dart';
import 'package:test_rail_dart/test_runs.dart';

class TestRun {
  final int? assignedtoId;
  final int? blockedCount;
  final DateTime? completedOn;
  final String? config;
  final List<int>? configIds;
  final int? createdBy;
  final DateTime? createdOn;
  final int? customStatus1Count;
  final int? customStatus2Count;
  final int? customStatus3Count;
  final int? customStatus4Count;
  final int? customStatus5Count;
  final int? customStatus6Count;
  final int? customStatus7Count;
  final String? description;
  final int? failedCount;
  final int id;
  final bool? includeAll;
  final bool? isCompleted;
  final int? milestoneId;
  final String? name;
  final int? passedCount;
  final int? planId;
  final int? projectId;
  final String? refs;
  final int? retestCount;
  final int? suiteId;
  final int? untestedCount;
  final DateTime? updatedOn;
  final String? url;

  TestRun({
    this.assignedtoId,
    this.blockedCount,
    this.completedOn,
    this.config,
    this.configIds,
    this.createdBy,
    this.createdOn,
    this.customStatus1Count,
    this.customStatus2Count,
    this.customStatus3Count,
    this.customStatus4Count,
    this.customStatus5Count,
    this.customStatus6Count,
    this.customStatus7Count,
    this.description,
    this.failedCount,
    required this.id,
    this.includeAll,
    this.isCompleted,
    this.milestoneId,
    this.name,
    this.passedCount,
    this.planId,
    this.projectId,
    this.refs,
    this.retestCount,
    this.suiteId,
    this.untestedCount,
    this.updatedOn,
    this.url,
  });

  factory TestRun.fromJson(Map<String, dynamic> json) {
    DateTime? completedOn;
    DateTime? createdOn;
    DateTime? updatedOn;

    if (json['completed_on'] != null) {
      completedOn = DateTime.fromMillisecondsSinceEpoch(json['completed_on']);
    }

    if (json['created_on'] != null) {
      createdOn = DateTime.fromMillisecondsSinceEpoch(json['created_on']);
    }

    if (json['updated_on'] != null) {
      updatedOn = DateTime.fromMillisecondsSinceEpoch(json['updated_on']);
    }

    return TestRun(
      assignedtoId: json['assignedto_id'],
      blockedCount: json['blocked_count'],
      completedOn: completedOn,
      config: json['config'],
      configIds: json['config_ids']?.cast<int>(),
      createdBy: json['created_by'],
      createdOn: createdOn,
      customStatus1Count: json['custom_status1_count'],
      customStatus2Count: json['custom_status2_count'],
      customStatus3Count: json['custom_status3_count'],
      customStatus4Count: json['custom_status4_count'],
      customStatus5Count: json['custom_status5_count'],
      customStatus6Count: json['custom_status6_count'],
      customStatus7Count: json['custom_status7_count'],
      description: json['description'],
      failedCount: json['failed_count'],
      id: json['id'],
      includeAll: json['include_all'],
      isCompleted: json['is_completed'],
      milestoneId: json['milestone_id'],
      name: json['name'],
      passedCount: json['passed_count'],
      planId: json['plan_id'],
      projectId: json['project_id'],
      refs: json['refs'],
      retestCount: json['retest_count'],
      suiteId: json['suite_id'],
      untestedCount: json['untested_count'],
      updatedOn: updatedOn,
      url: json['url'],
    );
  }

  Future<TestResult> addResultForCase(
    int caseId, {
    String? comment,
    // in `1m 38s` format
    String? elapsed,
    required int statusId,
  }) async {
    final response = await TestRail.instance.client.request(
      '/add_result_for_case/$id/$caseId',
      RequestMethod.post,
      params: {
        'status_id': statusId,
        if (comment != null) 'comment': comment,
        if (elapsed != null) 'elapsed': elapsed,
      },
    );

    return TestResult.fromJson(response);
  }

  Future<TestRun> close() async {
    final response = await TestRail.instance.client
        .request('/close_run/$id', RequestMethod.post);
    return TestRun.fromJson(response);
  }

  static Future<TestRun> create({
    Iterable<int>? caseIds,
    String? description,
    bool includeAll = false,
    required String name,
    required int projectId,
  }) async {
    final response = await TestRail.instance.client.request(
      '/add_run/$projectId',
      RequestMethod.post,
      params: <String, dynamic>{
        if (caseIds != null) 'case_ids': caseIds,
        if (description != null) 'description': description,
        'include_all': includeAll,
        'name': name,
      },
    );
    return TestRun.fromJson(response);
  }

  static Future<TestRun> get(int runId) async {
    final response = await TestRail.instance.client
        .request('/get_run/$runId', RequestMethod.get);
    return TestRun.fromJson(response);
  }

  static Future<TestRuns> getAll({
    required int projectId,
    DateTime? createdAfter,
    DateTime? createdBefore,
    Iterable<int>? createdBy,
    bool? isCompleted,
    int? limit,
    int? offset,
    Iterable<int>? milestoneId,
    String? refsFilter,
    Iterable<int>? suiteId,
  }) async {
    final queryParameters = <String, dynamic>{
      'created_after': createdAfter?.millisecondsSinceEpoch,
      'created_before': createdBefore?.millisecondsSinceEpoch,
      'created_by': createdBy?.join(','),
      'is_completed': isCompleted,
      'limit': limit,
      'offset': offset,
      'milestone_id': milestoneId?.join(','),
      'refs_filter': refsFilter,
      'suite_id': suiteId?.join(','),
    };

    queryParameters.removeWhere((_, dynamic value) => value == null);

    final response = await TestRail.instance.client.request(
      '/get_runs/$projectId',
      RequestMethod.get,
      queryParameters: queryParameters,
    );

    return TestRuns.fromJson(response);
  }

  Future<TestRun> update({
    required Iterable<int> caseIds,
    bool includeAll = false,
  }) async {
    final response = await TestRail.instance.client.request(
      '/update_run/$id',
      RequestMethod.post,
      params: {
        'case_ids': caseIds,
        'include_all': includeAll,
      },
    );
    return TestRun.fromJson(response);
  }

  Map<String, dynamic> get asJson => {
        'assignedto_id': assignedtoId,
        'blocked_count': blockedCount,
        'completed_on': completedOn?.millisecondsSinceEpoch,
        'config_ids': configIds,
        'config': config,
        'created_by': createdBy,
        'created_on': createdOn?.millisecondsSinceEpoch,
        'custom_status1_count': customStatus1Count,
        'custom_status2_count': customStatus2Count,
        'custom_status3_count': customStatus3Count,
        'custom_status4_count': customStatus4Count,
        'custom_status5_count': customStatus5Count,
        'custom_status6_count': customStatus6Count,
        'custom_status7_count': customStatus7Count,
        'description': description,
        'failed_count': failedCount,
        'id': id,
        'include_all': includeAll,
        'is_completed': isCompleted,
        'milestone_id': milestoneId,
        'name': name,
        'passed_count': passedCount,
        'plan_id': planId,
        'project_id': projectId,
        'refs': refs,
        'retest_count': retestCount,
        'suite_id': suiteId,
        'untested_count': untestedCount,
        'updated_on': updatedOn?.millisecondsSinceEpoch,
        'url': url,
      };
}
