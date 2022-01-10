import 'sample_test_run.dart';

final sampleTestRuns = {
  'offset': 8,
  'limit': 2,
  'size': 2,
  '_links': {
    'next': '/api/v2/get_runs/8&limit=2&offset=12',
    'prev': '/api/v2/get_runs/8&limit=2&offset=8'
  },
  'runs': [sampleTestRun]
};
