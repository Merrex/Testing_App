import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'element.dart';

class TextElement extends BaseElement {
  TextElement(WidgetTester tester, Finder finder) : super(tester, finder);

  Future<String> getText() async {
    return (await getWidget() as Text).data!;
  }
}
