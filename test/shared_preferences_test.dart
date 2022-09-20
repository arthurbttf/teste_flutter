import 'dart:math';

import 'package:exemplo/app/shared/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final prefs = SharedPrefs();
  final prefsUser = 'art';
  final prefsPass = '123@';
  group('sharedPreferences', () {
    // test('singleton', () {
    //   expect(prefs, isNotNull);
    //   final newprefs = SharedPrefs();
    //   expect(newprefs, equals(prefs));
    // });

    test('save', () async {
      expect(await prefs.save(prefsUser, prefsPass), isTrue);
    });

    test('remove', () async {
      expect(await prefs.remove(), isTrue);
    });

    test('find', () async {
      expect(await prefs.find(), isA<bool>());
    });
  });
}
