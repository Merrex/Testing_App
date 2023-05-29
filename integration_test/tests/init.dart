import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/main.dart';

Future<void> initApp() async {
  // Future.delayed(const Duration(seconds: 2), () async {
  //   var size = await DesktopWindow.getWindowSize();
  //   await DesktopWindow.setFullScreen(true);
  //   await DesktopWindow.setMinWindowSize(Size(size.width, size.height));
  // });
  Future.delayed(const Duration(seconds: 2));

  runApp(const TestingApp());
}

Future<void> pumpMainApp(
  WidgetTester tester,
) async {
  await tester.pumpWidget(const TestingApp());
  await tester.pump(const Duration(seconds: 5));
}
