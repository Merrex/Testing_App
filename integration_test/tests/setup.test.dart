import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'init.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Test Setup Initialization', (WidgetTester tester) async {
    await initApp();
  });
}
