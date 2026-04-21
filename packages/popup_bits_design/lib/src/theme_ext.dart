// A ThemeExtension that carries Popup Bits tokens that don't map cleanly
// onto Material 3's ColorScheme / TextTheme. Read from widgets with:
//   final pb = Theme.of(context).extension<PbThemeExt>()!;

import 'package:flutter/material.dart';
import 'archetype.dart';
import 'product_theme.dart';
import 'tokens.dart';

@immutable
class PbThemeExt extends ThemeExtension<PbThemeExt> {
  final PbArchetype archetype;
  final PbProductTheme product;
  final Color accent;
  final Color accentSoft;
  final Color accentInk;
  final Color bgSunken;
  final Cubic easeOut;
  final Duration tMed;
  final List<BoxShadow> shadowSm;
  final List<BoxShadow> shadowMd;
  final List<BoxShadow> shadowLg;

  const PbThemeExt({
    required this.archetype,
    required this.product,
    required this.accent,
    required this.accentSoft,
    required this.accentInk,
    required this.bgSunken,
    required this.easeOut,
    required this.tMed,
    this.shadowSm = PbTokens.shSm,
    this.shadowMd = PbTokens.shMd,
    this.shadowLg = PbTokens.shLg,
  });

  @override
  PbThemeExt copyWith({
    PbArchetype? archetype,
    PbProductTheme? product,
    Color? accent,
    Color? accentSoft,
    Color? accentInk,
    Color? bgSunken,
    Cubic? easeOut,
    Duration? tMed,
    List<BoxShadow>? shadowSm,
    List<BoxShadow>? shadowMd,
    List<BoxShadow>? shadowLg,
  }) {
    return PbThemeExt(
      archetype:  archetype  ?? this.archetype,
      product:    product    ?? this.product,
      accent:     accent     ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      accentInk:  accentInk  ?? this.accentInk,
      bgSunken:   bgSunken   ?? this.bgSunken,
      easeOut:    easeOut    ?? this.easeOut,
      tMed:       tMed       ?? this.tMed,
      shadowSm:   shadowSm   ?? this.shadowSm,
      shadowMd:   shadowMd   ?? this.shadowMd,
      shadowLg:   shadowLg   ?? this.shadowLg,
    );
  }

  @override
  PbThemeExt lerp(ThemeExtension<PbThemeExt>? other, double t) {
    if (other is! PbThemeExt) return this;
    return PbThemeExt(
      archetype:  t < 0.5 ? archetype : other.archetype,
      product:    t < 0.5 ? product   : other.product,
      accent:     Color.lerp(accent,     other.accent,     t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      accentInk:  Color.lerp(accentInk,  other.accentInk,  t)!,
      bgSunken:   Color.lerp(bgSunken,   other.bgSunken,   t)!,
      easeOut:    t < 0.5 ? easeOut : other.easeOut,
      tMed:       t < 0.5 ? tMed    : other.tMed,
      shadowSm:   t < 0.5 ? shadowSm : other.shadowSm,
      shadowMd:   t < 0.5 ? shadowMd : other.shadowMd,
      shadowLg:   t < 0.5 ? shadowLg : other.shadowLg,
    );
  }
}
