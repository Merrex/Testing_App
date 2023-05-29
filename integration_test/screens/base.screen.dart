import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../components/element.dart';
import '../components/text.dart';

class BaseScreen {
  late WidgetTester tester;

  BaseScreen(this.tester);

  BaseElement element(Finder finder) {
    return BaseElement(tester, finder);
  }

  TextElement textElement(Finder finder) {
    return TextElement(tester, finder);
  }

  Future<void> pumpAndSettleDown({int timeOutInSec = 5}) async {
    await tester.pumpAndSettle(Duration(seconds: timeOutInSec));
  }

  Future<void> pump({int timeOutInSec = 5}) async {
    await tester.pump(Duration(seconds: timeOutInSec));
  }

  Future<void> pumpForMilliSec({int milliSec = 200}) async {
    await tester.pump(Duration(milliseconds: milliSec));
  }

  Future<String?> getText(Finder finder) async {
    var text = (finder.evaluate().single.widget as Text).data;
    return text;
  }
}
