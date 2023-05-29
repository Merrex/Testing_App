flutter pub global activate dart_dot_reporter
flutter test --machine integration_test/suite/all_test.dart -d chrome > machine.log
flutter pub global run dart_dot_reporter machine.log