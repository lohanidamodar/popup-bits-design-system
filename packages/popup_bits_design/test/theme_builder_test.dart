// Smoke tests for PopupBitsTheme.build — make sure each archetype builds
// a valid ThemeData and exposes PbThemeExt with the right accent colour.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_bits_design/popup_bits_design.dart';

const _fixture = PbProductTheme(
  id: 'test',
  name: 'Test',
  accent:     Color(0xFF0E8A8A),
  accentSoft: Color(0xFFD6EFEE),
  accentInk:  Color(0xFF1F2A3A),
);

void main() {
  group('PopupBitsTheme.build', () {
    for (final a in PbArchetype.values) {
      test('builds for archetype ${a.name}', () {
        final t = PopupBitsTheme.build(archetype: a, product: _fixture);
        expect(t.useMaterial3, isTrue);
        expect(t.colorScheme.primary, _fixture.accent);
        final ext = t.extension<PbThemeExt>();
        expect(ext, isNotNull);
        expect(ext!.product.id, 'test');
        expect(ext.archetype, a);
      });
    }

    test('respects forced brightness from product', () {
      const dark = PbProductTheme(
        id: 'd', name: 'D',
        accent: Color(0xFF49B6B6),
        accentSoft: Color(0xFFC8EAE9),
        accentInk: Color(0xFF0F2A4A),
        forcedBrightness: Brightness.dark,
      );
      final t = PopupBitsTheme.build(
        archetype: PbArchetype.utility,
        product: dark,
        brightness: Brightness.light, // should be overridden
      );
      expect(t.brightness, Brightness.dark);
    });

    test('light and dark produce different scaffold backgrounds', () {
      final light = PopupBitsTheme.build(
        archetype: PbArchetype.utility, product: _fixture);
      final dark = PopupBitsTheme.build(
        archetype: PbArchetype.utility, product: _fixture,
        brightness: Brightness.dark);
      expect(light.scaffoldBackgroundColor,
          isNot(equals(dark.scaffoldBackgroundColor)));
    });
  });
}
