final sampleTestCase = {
  'id': 25,
  'title': 'Case #1',
  'section_id': 37718,
  'template_id': 1,
  'type_id': 6,
  'priority_id': 4,
  'milestone_id': null,
  'refs': null,
  'created_by': 34,
  'created_on': 1638839681,
  'updated_by': 36,
  'updated_on': 1641893691,
  'estimate': null,
  'estimate_forecast': null,
  'suite_id': 886,
  'display_order': 1,
  'is_deleted': 0,
  'custom_attributes': {
    'custom_steps_separated': null,
  }
};

final sampleForTestCases = {
  'offset': 0,
  'limit': 250,
  'size': 2,
  '_links': {'next': null, 'prev': null},
  'cases': [sampleTestCase, sampleTestCase]
};

final sampleForNewTestCase = {
  'id': 547,
  'title': 'Case #3',
  'section_id': 12398,
  'template_id': 9898989,
  'type_id': 6,
  'priority_id': 2,
  'milestone_id': null,
  'refs': null,
  'created_by': 34,
  'created_on': 1638839681,
  'updated_by': 34,
  'updated_on': 1638839681,
  'estimate': null,
  'estimate_forecast': null,
  'suite_id': 886,
  'display_order': 5,
  'is_deleted': 0,
  'custom_attributes': {
    'custom_automation_type': null,
    'custom_expected': null,
    "custom_steps_separated": [
      {"content": "Step 1", "expected": "Expected Result 1"},
      {"content": "Step 2", "expected": "Expected Result 2"},
      {"shared_step_id": 3},
    ]
  }
};
