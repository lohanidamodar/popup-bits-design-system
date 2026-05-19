// A product theme is just an accent triplet (+ optional font overrides
// and an optional forced brightness). Every product theme for Popup
// Bits ends up as one of these.

import 'package:material_ui/material_ui.dart';

class PbProductTheme {
  /// Unique slug, e.g. 'meropatro', 'jyotish'.
  final String id;
  /// Human-readable name.
  final String name;
  /// Primary accent — CTAs, active states, brand mark.
  final Color accent;
  /// Soft tint of the accent — backgrounds, hover halos, selected rows.
  final Color accentSoft;
  /// Dark companion — headings on accent surfaces, focused-ink.
  final Color accentInk;
  /// Optional Brightness override — e.g. SpellCraft is dark-first.
  final Brightness? forcedBrightness;
  /// Optional display-font override (takes precedence over archetype's).
  final String? displayFontOverride;

  const PbProductTheme({
    required this.id,
    required this.name,
    required this.accent,
    required this.accentSoft,
    required this.accentInk,
    this.forcedBrightness,
    this.displayFontOverride,
  });
}
