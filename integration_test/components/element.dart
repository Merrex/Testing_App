import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class BaseElement {
  late WidgetTester _tester;
  late Finder _finder;

  BaseElement(WidgetTester tester, Finder finder) {
    _tester = tester;
    _finder = finder;
  }

  Future<void> tap(
      {bool pumpAndSettle = true,
      bool checkVisibility = false,
      warnIfMissed = true}) async {
    if (checkVisibility) await _tester.ensureVisible(_finder);
    await waitTillVisible();
    await _tester.tap(_finder, warnIfMissed: warnIfMissed);
    if (pumpAndSettle) await _tester.pumpAndSettle();
  }

  Future<void> longPress(
      {bool pumpAndSettle = true,
      bool checkVisibility = false,
      warnIfMissed = true}) async {
    if (checkVisibility) await _tester.ensureVisible(_finder);
    await _tester.longPress(_finder, warnIfMissed: warnIfMissed);
    if (pumpAndSettle) await _tester.pumpAndSettle();
  }

  Future<void> press(
      {bool pumpAndSettle = true,
      bool checkVisibility = false,
      warnIfMissed = true}) async {
    if (checkVisibility) await _tester.ensureVisible(_finder);
    await _tester.press(_finder);

    if (pumpAndSettle) await _tester.pumpAndSettle();
  }

  Future<void> tripleTap(
      {bool pumpAndSettle = true,
      bool checkVisibility = false,
      warnIfMissed = true}) async {
    if (checkVisibility) await _tester.ensureVisible(_finder);
    await waitTillVisible();
    await _tester.tap(_finder, warnIfMissed: warnIfMissed);

    await _tester.tap(_finder, warnIfMissed: warnIfMissed);

    await _tester.tap(_finder, warnIfMissed: warnIfMissed);

    if (pumpAndSettle) await _tester.pumpAndSettle();
  }

  Future<void> doubleTap(
      {bool pumpAndSettle = true,
      bool checkVisibility = false,
      warnIfMissed = true}) async {
    if (checkVisibility) await _tester.ensureVisible(_finder);
    await waitTillVisible();
    await _tester.tap(_finder, warnIfMissed: warnIfMissed);
    await _tester.pump(kDoubleTapMinTime);
    await _tester.tap(_finder, warnIfMissed: warnIfMissed);
    if (pumpAndSettle) await _tester.pumpAndSettle();
  }

  Future<void> setText(
    String textToSet, {
    bool pumpAndSettle = true,
    bool checkVisibility = false,
  }) async {
    if (checkVisibility) await _tester.ensureVisible(_finder);
    await waitTillVisible();
    await _tester.enterText(_finder, textToSet);
    if (pumpAndSettle) await _tester.pumpAndSettle();
  }

  Future<bool> isPresent() async {
    await waitTillVisible();
    return _tester.any(_finder);
  }

  Future<Widget> getWidget() async {
    return _tester.widget(_finder);
  }

  Future<void> swipeLeft(
      {Offset offset = const Offset(-300.0, 0.0),
      bool warnIfMissed = true}) async {
    await _tester.drag(_finder, offset, warnIfMissed: warnIfMissed);
  }

  Future<void> swipeRight(
      {Offset offset = const Offset(300.0, 0.0),
      bool warnIfMissed = true}) async {
    await _tester.drag(_finder, offset, warnIfMissed: warnIfMissed);
  }

  Future<void> swipeUp(
      {Offset offset = const Offset(0.0, -300.0),
      bool warnIfMissed = true}) async {
    await _tester.drag(_finder, offset, warnIfMissed: warnIfMissed);
  }

  Future<void> swipeDown(
      {Offset offset = const Offset(0.0, 300.0),
      bool warnIfMissed = true}) async {
    await _tester.drag(_finder, offset, warnIfMissed: warnIfMissed);
  }

  Future<void> waitTillVisible({int maxWaitTime = 10000}) async {
    try {
      final timeOut = DateTime.now().add(Duration(milliseconds: maxWaitTime));
      while (!DateTime.now().isAfter(timeOut)) {
        if (_tester.any(_finder)) {
          await _tester.pump(const Duration(milliseconds: 200));
          break;
        }
      }
    } catch (e) {
      throw Exception('No Element Visible within 10 Sec. Finder - $_finder');
    }
  }

  Future<void> waitTillDisappear({int maxWaitTime = 10000}) async {
    try {
      final timeOut = DateTime.now().add(Duration(milliseconds: maxWaitTime));
      while (!DateTime.now().isAfter(timeOut)) {
        if (!(_tester.any(_finder))) {
          await _tester.pump(const Duration(milliseconds: 200));
          break;
        }
      }
    } catch (e) {
      throw Exception('No Element Visible within 10 Sec. Finder - $_finder');
    }
  }
}
