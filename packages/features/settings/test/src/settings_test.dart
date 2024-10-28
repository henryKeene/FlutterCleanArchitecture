// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:settings/settings.dart';

void main() {
  group('Settings', () {
    test('can be instantiated', () {
      expect(Settings(), isNotNull);
    });
  });
}
