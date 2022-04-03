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
    'custom_steps_separated': [
      {'content': 'Step 1', 'expected': 'Expected Result 1'},
      {'content': 'Step 2', 'expected': 'Expected Result 2'},
      {'shared_step_id': 3},
    ]
  }
};

final sampleForTestCaseHistory = {
  'offset': 0,
  'limit': 250,
  'size': 2,
  '_links': {'next': null, 'prev': null},
  'history': [
    {
      'id': 19870,
      'type_id': 6,
      'created_on': 1643711498,
      'user_id': 30,
      'changes': [
        {
          'type_id': 6,
          'old_text': null,
          'new_text': null,
          'label': 'Preconditions',
          'options': {
            'is_required': false,
            'default_value': '',
            'format': 'markdown',
            'rows': '7'
          },
          'field': 'custom_preconds',
          'old_value': null,
          'new_value': 'Test case preconditions'
        }
      ]
    },
    {
      'id': 19871,
      'type_id': 6,
      'created_on': 1643711560,
      'user_id': 30,
      'changes': [
        {
          'type_id': 1,
          'old_text': 'Other',
          'new_text': 'Compatibility',
          'field': 'type_id',
          'old_value': 7,
          'new_value': 4
        },
        {
          'type_id': 1,
          'old_text': null,
          'new_text': 'E2E',
          'label': 'Automation Type',
          'options': {
            'is_required': false,
            'default_value': '0',
            'items': '0, None\n1, E2E'
          },
          'field': 'custom_automation_type',
          'old_value': 0,
          'new_value': 1
        }
      ]
    }
  ]
};

final sampleForSoftDeleteCase = {'tests': 2, 'results': 0};

