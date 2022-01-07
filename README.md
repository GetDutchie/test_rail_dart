![Dutchie Logo](https://avatars.githubusercontent.com/u/39318984?s=200&v=4)

# Where innovation meets dedication

We’re not just building the future of shopping for cannabis, we’re building a culture of innovation, customer care, and challenge to the status quo.

# Test Rail Flutter

This package is a thin wrapper around the Test Rail API that will allow for automated test reporting in Flutter. It enables a user to start, report case pass/fail, and close your test runs from a Dart interface.

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

final testRun = await TestRun.get(1);

final testSection = await TestSection.get(1);
```

Checkout our [careers](https://dutchie.com/careers) here