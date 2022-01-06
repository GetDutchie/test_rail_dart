# Contributing

## Road Map

There are some outstanding models and endpoints that need to be implemented. Feel free to follow the docs and push up a pr for some of these outstanding models.

[Categories](https://gurock.com/testrail/docs/api/reference/)
- Case Fields
- Case Types
- Configurations
- Milestones
- Plans
- Priorities
- Projects
- Reports
- Results
- Result Fields
- Shared Steps
- Statuses
- Suites
- Template
- Tests
- Users

## Guidelines

This repo is perfect for people looking to make their first contribution to open source.

You can checkout this guide in order to learn how to [fork our branch](https://github.com/firstcontributions/first-contributions) and make your first contribution.

You can use the app [Quick Type](https://app.quicktype.io/) to autogenerate the expected responses for the models from the above endpoints then you can clean it up to follow our style guide below.

# Dart Style Guide

The purpose of this styling guide is to provide a consistent format to make contributions to our Dart app. We align as much as possible with the best practices set forth by the [Flutter team](https://flutter.dev/docs).
## Writing Unit Tests

Generally speaking, keeping `expect()` as close to one as possible per test helps them stay resilient to refactors. (assert one behavior as it won't break unrelated tests when that functionality changes).

We created a helper *stubTestRailConfig* which you can use in order to pass in sample data for the testcase.

```dart
void main() {
  group('TestSection', () {
    test('#get', () async {
      stubTestRailConfig(sampleTestCase);
      final result = await TestCase.get(1);
      expect(result.asJson, sampleTestCase);
    });
  });
}
```

## Styling

### Declaration

**_Do_** create declarations that are immutable as much as possible

```dart
/// bad
var response = 'www.dutchie.com';

/// good
final response = 'www.dutchie.com';
const response = 'www.dutchie.com';
```

### Trailing Commas

**_Do_** Add a trailing comma as it makes code more readable when its closing brackets are on a new line

```dart
// bad
TestCase({
  this.createdBy,
  this.createdOn,
  this.suiteId});

/// good
TestCase({
  this.createdBy,
  this.createdOn,
  this.suiteId,
});
```

### Ordering

- instance fields
- static fields
- constructor
- instance methods
- static methods

```dart
class Example {
  final int age;
  final int get dogName {
    return age * 7;
  }
  final String name;
  static const List<String> names = <String>[];

  Example(
    this.age,
    this.name,
  );

  String sayName(String name) {
    print("My name is $name")
  }

  static void saveName(String name) {
    names.add(name);
  }
}
```