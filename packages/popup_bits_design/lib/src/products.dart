// First-party Popup Bits product themes.
//
// Every theme is designed from first principles for its product context,
// not eyedropped from shipping apps. Each product ships TWO variants:
//
//   - `*`         safe: system-aligned, ready to ship
//   - `*Bold`     bold: more expressive / opinionated alternative
//
// Dark mode is supported on every product (via PopupBitsTheme.build with
// brightness: Brightness.dark). SpellCraft and Jyotish force dark.

import 'package:flutter/material.dart';
import 'product_theme.dart';

class PbProducts {
  PbProducts._();

  // ─────────────────────────────────────────────────────────────────
  // MERO PATRO  —  cultural archetype
  // Nepali panchanga / calendar. Devanagari-first daily utility.
  // Mood: modern utility — crisp white, single strong accent, minimal.
  // ─────────────────────────────────────────────────────────────────

  /// Safe: single red accent on paper-white. Reads as a respectful,
  /// modern almanac — ink type, one flag of colour for "today".
  static const meropatro = PbProductTheme(
    id: 'meropatro',
    name: 'Mero Patro',
    accent:     Color(0xFFC8372D), // sindoor red — festival flag
    accentSoft: Color(0xFFFBE9E5),
    accentInk:  Color(0xFF1A1A1A),
  );

  /// Bold: deep graphite with a saffron flag. Same utility, more
  /// editorial confidence.
  static const meropatroBold = PbProductTheme(
    id: 'meropatro_bold',
    name: 'Mero Patro — Bold',
    accent:     Color(0xFFE8832A), // saffron
    accentSoft: Color(0xFFFCEBD4),
    accentInk:  Color(0xFF111418),
  );

  // ─────────────────────────────────────────────────────────────────
  // MERO NEPALI  —  kid archetype
  // Children's Nepali-learning. Rounded, bouncy, legible at small sizes.
  // ─────────────────────────────────────────────────────────────────

  /// Safe: playful pastel. Soft sky-blue primary so it feels friendly
  /// without shouting; accentSoft is a cloud tint for card backgrounds.
  static const meronepali = PbProductTheme(
    id: 'meronepali',
    name: 'Mero Nepali',
    accent:     Color(0xFF4FA8D8), // sky
    accentSoft: Color(0xFFE3F2FB),
    accentInk:  Color(0xFF1C4A6A),
  );

  /// Bold: sticker-cartoon. Saturated leaf-green primary with a
  /// sunshine-yellow ink, for playgrounds and reward screens.
  static const meronepaliBold = PbProductTheme(
    id: 'meronepali_bold',
    name: 'Mero Nepali — Bold',
    accent:     Color(0xFF2EB872), // leaf
    accentSoft: Color(0xFFDFF6E8),
    accentInk:  Color(0xFFF5A524), // sunshine
  );

  // ─────────────────────────────────────────────────────────────────
  // SPELLCRAFT  —  kid archetype, dark-first
  // Word / spelling game. Mood: mystical midnight purple + rune gold +
  // emerald.
  // ─────────────────────────────────────────────────────────────────

  /// Safe (dark-first): midnight violet with rune gold accent and
  /// emerald highlights for correct answers.
  static const spellcraft = PbProductTheme(
    id: 'spellcraft',
    name: 'SpellCraft',
    accent:     Color(0xFFE6B949), // rune gold
    accentSoft: Color(0xFF2A1E57), // deep violet card bg
    accentInk:  Color(0xFF34C58A), // emerald — correct / ink on gold
    forcedBrightness: Brightness.dark,
  );

  /// Bold (dark-first): electric arcane. Magenta primary with
  /// cyan ink — leans into the "cast a spell" feel.
  static const spellcraftBold = PbProductTheme(
    id: 'spellcraft_bold',
    name: 'SpellCraft — Bold',
    accent:     Color(0xFFD84DD4), // magenta rune
    accentSoft: Color(0xFF1A0F3D),
    accentInk:  Color(0xFF54E3E8), // cyan
    forcedBrightness: Brightness.dark,
  );

  // ─────────────────────────────────────────────────────────────────
  // POPUP BITS  —  utility archetype (studio/parent brand)
  // Mood: studio-indie — confident off-black, one bold hero accent,
  // editorial type.
  // ─────────────────────────────────────────────────────────────────

  /// Safe: off-black canvas with a single hot-coral hero accent.
  /// Feels like a design studio masthead.
  static const popupbits = PbProductTheme(
    id: 'popupbits',
    name: 'Popup Bits',
    accent:     Color(0xFFFF5A3C), // hot coral
    accentSoft: Color(0xFFFFE3DC),
    accentInk:  Color(0xFF0E1115),
  );

  /// Bold: electric chartreuse on graphite — a louder, more indie
  /// stance for the studio site.
  static const popupbitsBold = PbProductTheme(
    id: 'popupbits_bold',
    name: 'Popup Bits — Bold',
    accent:     Color(0xFFC8F23C), // electric chartreuse
    accentSoft: Color(0xFFEEFAC8),
    accentInk:  Color(0xFF0E1115),
  );

  // ─────────────────────────────────────────────────────────────────
  // JYOTISH  —  cultural archetype, dark-first
  // Astrology / kundali / rashifal. Mood: celestial — deep indigo night,
  // gold + saffron highlights, star-chart vibe.
  // ─────────────────────────────────────────────────────────────────

  /// Safe (dark-first): indigo night with warm gold accent.
  /// Reads as "star chart" — trustworthy, ceremonial.
  static const jyotish = PbProductTheme(
    id: 'jyotish',
    name: 'Jyotish',
    accent:     Color(0xFFE9C46A), // warm gold
    accentSoft: Color(0xFF1B2454), // card bg = deep indigo
    accentInk:  Color(0xFFF4A259), // saffron — secondary highlight
    forcedBrightness: Brightness.dark,
  );

  /// Bold (dark-first): cosmic violet with vermillion gold.
  /// Punches harder for hero screens and festival moments.
  static const jyotishBold = PbProductTheme(
    id: 'jyotish_bold',
    name: 'Jyotish — Bold',
    accent:     Color(0xFFF4A259), // saffron primary
    accentSoft: Color(0xFF2A1450), // cosmic violet
    accentInk:  Color(0xFFE9C46A),
    forcedBrightness: Brightness.dark,
  );

  // ─────────────────────────────────────────────────────────────────
  // SANSKRIT  —  cultural archetype
  // Mood: manuscript — palm-leaf beige, deep maroon, gold illumination.
  // ─────────────────────────────────────────────────────────────────

  /// Safe: maroon on palm-leaf beige. Calm, scholarly.
  static const sanskrit = PbProductTheme(
    id: 'sanskrit',
    name: 'Sanskrit',
    accent:     Color(0xFF8C1D1D), // deep maroon
    accentSoft: Color(0xFFF2E6C8), // palm-leaf beige
    accentInk:  Color(0xFFB8862B), // illumination gold
  );

  /// Bold: illuminated gold primary on maroon. For headers, covers,
  /// achievement screens.
  static const sanskritBold = PbProductTheme(
    id: 'sanskrit_bold',
    name: 'Sanskrit — Bold',
    accent:     Color(0xFFB8862B), // gold primary
    accentSoft: Color(0xFFF2E6C8),
    accentInk:  Color(0xFF5A0F0F), // rich maroon ink
  );

  // ─────────────────────────────────────────────────────────────────
  // RENT  —  marketplace archetype
  // Peer-to-peer rental. Mood: trust-teal — fresh teal, white, utility.
  // ─────────────────────────────────────────────────────────────────

  /// Safe: fresh teal on white. Efficient, trustworthy.
  static const rent = PbProductTheme(
    id: 'rent',
    name: 'Rent',
    accent:     Color(0xFF0E8A8A), // trust teal
    accentSoft: Color(0xFFD6EFEE),
    accentInk:  Color(0xFF0B2A38),
  );

  /// Bold: vivid seafoam with a charcoal ink. More consumer, more
  /// "modern commerce".
  static const rentBold = PbProductTheme(
    id: 'rent_bold',
    name: 'Rent — Bold',
    accent:     Color(0xFF14B8A6), // seafoam
    accentSoft: Color(0xFFE6FBF7),
    accentInk:  Color(0xFF1F2937), // charcoal
  );

  // ─────────────────────────────────────────────────────────────────

  /// All first-party product themes in menu order — safe first, bold next.
  static const List<PbProductTheme> all = <PbProductTheme>[
    popupbits, popupbitsBold,
    meropatro, meropatroBold,
    meronepali, meronepaliBold,
    spellcraft, spellcraftBold,
    jyotish,    jyotishBold,
    sanskrit,   sanskritBold,
    rent,       rentBold,
  ];

  /// Look up a first-party theme by [PbProductTheme.id], or null if unknown.
  static PbProductTheme? byId(String id) {
    for (final p in all) {
      if (p.id == id) return p;
    }
    return null;
  }
}
