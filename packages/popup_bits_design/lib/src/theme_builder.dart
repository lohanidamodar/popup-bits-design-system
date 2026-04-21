// PopupBitsTheme.build composes a ThemeData from (archetype, product,
// brightness). Works with Flutter 3.24+ (Material 3).
//
//   MaterialApp(
//     theme: PopupBitsTheme.build(
//       archetype: PbArchetype.cultural,
//       product:   PbProducts.jyotish,
//     ),
//     darkTheme: PopupBitsTheme.build(
//       archetype: PbArchetype.cultural,
//       product:   PbProducts.jyotish,
//       brightness: Brightness.dark,
//     ),
//     ...
//   )

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'archetype.dart';
import 'product_theme.dart';
import 'theme_ext.dart';
import 'tokens.dart';

class PopupBitsTheme {
  PopupBitsTheme._();

  static ThemeData build({
    required PbArchetype archetype,
    required PbProductTheme product,
    Brightness brightness = Brightness.light,
  }) {
    final arch = PbArchetypeDefaults.forArchetype(archetype);
    final effBrightness = product.forcedBrightness ?? brightness;
    final isDark = effBrightness == Brightness.dark;

    // ColorScheme: derive from the product accent so Material widgets
    // (FilledButton, Switch, ProgressIndicator, …) pick it up for free.
    // We seed from accent, then force brand-exact primary/secondary/surface
    // via copyWith — fromSeed in recent Flutter versions treats the seed as
    // authoritative and ignores some direct overrides.
    final scheme = ColorScheme.fromSeed(
      seedColor: product.accent,
      brightness: effBrightness,
    ).copyWith(
      primary:    product.accent,
      onPrimary:  _onColor(product.accent),
      secondary:  product.accentInk,
      onSecondary: Colors.white,
      surface:    isDark ? PbTokens.darkBgRaised : arch.bgRaised,
      onSurface:  isDark ? PbTokens.darkFg       : PbTokens.n900,
      error:      PbTokens.danger,
      onError:    Colors.white,
    );

    // Text: Nunito for body, archetype-driven display face.
    final displayFont = product.displayFontOverride ?? arch.displayFont;
    final base = TextTheme(
      displayLarge:  _t(displayFont, PbTokens.fs5xl, FontWeight.w800, -0.02),
      displayMedium: _t(displayFont, PbTokens.fs4xl, FontWeight.w700, -0.015),
      displaySmall:  _t(displayFont, PbTokens.fs3xl, FontWeight.w700, -0.01),
      headlineLarge: _t(displayFont, PbTokens.fs3xl, FontWeight.w700, -0.01),
      headlineMedium:_t(displayFont, PbTokens.fs2xl, FontWeight.w700, 0),
      headlineSmall: _t(PbTokens.fontSans, PbTokens.fsXl, FontWeight.w700, 0),
      titleLarge:    _t(PbTokens.fontSans, PbTokens.fsLg, FontWeight.w700, 0),
      titleMedium:   _t(PbTokens.fontSans, PbTokens.fsMd, FontWeight.w600, 0),
      titleSmall:    _t(PbTokens.fontSans, PbTokens.fsSm, FontWeight.w600, 0),
      bodyLarge:     _t(PbTokens.fontSans, PbTokens.fsMd, FontWeight.w400, 0),
      bodyMedium:    _t(PbTokens.fontSans, PbTokens.fsBase, FontWeight.w400, 0),
      bodySmall:     _t(PbTokens.fontSans, PbTokens.fsSm, FontWeight.w400, 0),
      labelLarge:    _t(PbTokens.fontSans, PbTokens.fsSm, FontWeight.w700, 0.02),
      labelMedium:   _t(PbTokens.fontSans, PbTokens.fsXs, FontWeight.w600, 0.04),
      labelSmall:    _t(PbTokens.fontSans, PbTokens.fsXs, FontWeight.w700, 0.08),
    );

    final ext = PbThemeExt(
      archetype: archetype,
      product:   product,
      accent:    product.accent,
      accentSoft:product.accentSoft,
      accentInk: product.accentInk,
      bgSunken:  isDark ? PbTokens.darkBgSunken : arch.bgSunken,
      easeOut:   arch.easeOut,
      tMed:      arch.tMed,
    );

    final bg = isDark ? PbTokens.darkBg : arch.bg;
    final fg = isDark ? PbTokens.darkFg : PbTokens.n900;

    return ThemeData(
      useMaterial3: true,
      brightness: effBrightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: bg,
      canvasColor: bg,
      textTheme: base.apply(
        bodyColor: fg,
        displayColor: fg,
      ),
      extensions: [ext],

      // Shape defaults — archetype drives roundness.
      // Note: Flutter 3.22+ renamed CardTheme → CardThemeData. If your
      // Flutter is older, change this back to `CardTheme(...)`.
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surface,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(arch.radiusLg),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.nunito(
            fontWeight: FontWeight.w700, fontSize: PbTokens.fsBase,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(arch.radiusMd),
          ),
          side: BorderSide(color: arch.border),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: product.accent,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? PbTokens.darkBgSunken : arch.bgSunken,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(arch.radiusMd),
          borderSide: BorderSide(color: arch.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(arch.radiusMd),
          borderSide: BorderSide(color: arch.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(arch.radiusMd),
          borderSide: BorderSide(color: product.accent, width: 2),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: fg,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.nunito(
          fontWeight: FontWeight.w800,
          fontSize: PbTokens.fsLg,
          color: fg,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: isDark ? PbTokens.darkBorder : arch.border,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: product.accentInk,
        contentTextStyle: GoogleFonts.nunito(
          color: Colors.white, fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(arch.radiusMd),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS:     CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  /// Pick a legible on-color for a filled background.
  static Color _onColor(Color bg) {
    // Relative luminance check — threshold tuned for brand greens/teals.
    final l = (0.2126 * bg.red + 0.7152 * bg.green + 0.0722 * bg.blue) / 255;
    return l > 0.62 ? PbTokens.n900 : Colors.white;
  }

  static TextStyle _t(String family, double size, FontWeight w, double letter) {
    return GoogleFonts.getFont(
      family,
      fontSize: size,
      fontWeight: w,
      letterSpacing: letter,
      height: 1.3,
    );
  }
}
