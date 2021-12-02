import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:test/test.dart';

void main() {
  group('HtmlStyle', () {
    group('getDependency', () {
      final dep1 = _Dep1();
      final tsh = HtmlStyle.root(
        [
          const MediaQueryData(),
          TextDirection.ltr,
          const TextStyle(),
          dep1,
        ],
        null,
      );

      test('returns dependency', () {
        final dep = tsh.getDependency<_Dep1>();
        expect(dep, equals(dep1));
      });

      test('throws exception', () {
        expect(() => tsh.getDependency<_Dep2>(), throwsA(isA<StateError>()));
      });
    });
  });
}

class _Dep1 {}

class _Dep2 {}
