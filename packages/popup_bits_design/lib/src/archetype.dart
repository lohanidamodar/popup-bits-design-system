// Archetypes bundle opinionated defaults for a product category.
// Think of them as "visual stances" that sit above tokens and below
// a specific product theme.

import 'package:material_ui/material_ui.dart';
import 'tokens.dart';

enum PbArchetype { kid, cultural, utility, marketplace }

class PbArchetypeDefaults {
  final String displayFont;
  final double radiusMd;
  final double radiusLg;
  final double radiusXl;
  final Duration tMed;
  final Cubic easeOut;
  final Color bg;
  final Color bgRaised;
  final Color bgSunken;
  final Color border;

  const PbArchetypeDefaults({
    required this.displayFont,
    required this.radiusMd,
    required this.radiusLg,
    required this.radiusXl,
    required this.tMed,
    required this.easeOut,
    required this.bg,
    required this.bgRaised,
    required this.bgSunken,
    required this.border,
  });

  static PbArchetypeDefaults forArchetype(PbArchetype a) {
    switch (a) {
      case PbArchetype.kid:
        return const PbArchetypeDefaults(
          displayFont: PbTokens.fontDisplay,       // Baloo 2
          radiusMd: 18,
          radiusLg: 24,
          radiusXl: 32,
          tMed: Duration(milliseconds: 280),
          easeOut: PbTokens.easeSpring,            // bouncier
          bg: PbTokens.n50,
          bgRaised: PbTokens.n0,
          bgSunken: PbTokens.n100,
          border: PbTokens.n200,
        );
      case PbArchetype.cultural:
        return const PbArchetypeDefaults(
          displayFont: PbTokens.fontDeva,          // Mukta
          radiusMd: 14,
          radiusLg: 18,
          radiusXl: 24,
          tMed: Duration(milliseconds: 220),
          easeOut: PbTokens.easeOut,
          bg: Color(0xFFFFF7E8),                   // warm cream / paper
          bgRaised: Color(0xFFFFFFFF),
          bgSunken: Color(0xFFF6ECD6),
          border: Color(0xFFE8DCBF),
        );
      case PbArchetype.utility:
        return const PbArchetypeDefaults(
          displayFont: PbTokens.fontSans,          // Nunito
          radiusMd: 12,
          radiusLg: 16,
          radiusXl: 20,
          tMed: Duration(milliseconds: 180),
          easeOut: PbTokens.easeOut,
          bg: PbTokens.n50,
          bgRaised: PbTokens.n0,
          bgSunken: PbTokens.n100,
          border: PbTokens.n200,
        );
      case PbArchetype.marketplace:
        return const PbArchetypeDefaults(
          displayFont: PbTokens.fontSans,
          radiusMd: 10,
          radiusLg: 14,
          radiusXl: 20,
          tMed: Duration(milliseconds: 160),
          easeOut: PbTokens.easeOut,
          bg: Color(0xFFFBFBF9),
          bgRaised: PbTokens.n0,
          bgSunken: PbTokens.n100,
          border: Color(0xFFE1E3DD),
        );
    }
  }
}
