![Dutchie Logo](https://dutchie.com/favicons/default/apple-touch-icon.png)

# Test Rail Dart

This package is a thin wrapper around the TestRail API that will allow for automated test reporting in Dart. It enables a user to start, report case pass/fail, and close your test runs from a Dart interface.

## Getting Started

Initialize the TestRail instance using the config method:

```dart
TestRail.config(
  username: 'USERNAME',
  password: 'PASSWORD',
  /// The url that points to the test rail server => https://example.testrail.com
  serverDomain: 'https://YOUR_SERVER.testrail.com'
)
```

## Usage

### Create Test case
```dart
/// Create new test case in section
final createdTestCase = await TestCase.create(
  // Replace with your own sectionId
  1,
  title: 'Test case from API',
  customValues: <String, dynamic>{
    // Custom fields start with "custom_" prefix
    'custom_feedback': 'This case should be tested last',
  },
);
```

### Create or Update Runs

```dart
/// Start by creating a new run
final newRun = await TestRun.create(
  name: 'Test execution',
  projectId: 1
);

/// Add cases to the run
await newRun.updateRun(
  caseIds: [1, 2, 3, 5],
);
```

Once the run is created, results can be reported by case:

```dart
final result = await newRun.addResultForCase(
  caseId: 1,
  statusId: 1,
);

// Optionally add a screenshot or other image to the result
await result.addAttachmentToResult(
  '/workspace/attachments/failure.png',
);
```

### Get

Historical runs, cases, and sections can be retrieved:

```dart
final testCase = await TestCase.get(1);

final testCases = await TestCase.getAll(1);

final testRun = await TestRun.get(1);

final testSection = await TestSection.get(1);
```

Completed or ongoing test run results can be retrieved:

```dart
final caseResults = await TestResult.getCaseResults(
  // Case ID is from TestCases, not TestRun
  184234,
  runId: 1833,
);

final runResults = await TestResult.getRunResults(
  1818,
  statusId: [5, 1],
);

final testResults = await TestResult.getTestResults(
  // Test ID from particular TestRun
  1868150,
);
```

### Delete
```dart
final deletedTestCase = await TestCase.delete(
  1,
  // Soft does not delete case, but show's involved resources
  soft: true,
);
```

## About Dutchie

We’re not just building the future of shopping for cannabis, we’re building a culture of innovation, customer care, and challenge to the status quo.

Inspired? Join our team of [Dart and Flutter developers](https://dutchie.com/careers) today