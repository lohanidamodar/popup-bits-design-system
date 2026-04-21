# popup_bits_design

Base design system for **every Popup Bits app** (and extensible for new ones). A Flutter package you can pull straight from GitHub into any project.

```
Base tokens (PbTokens)   ─►   Archetype (PbArchetype)   ─►   Product theme (PbProductTheme)
        shared                 kid · cultural · utility ·          per-app — declared in YOUR app,
      all products             marketplace                         not in this package
```

- **Base** lives here in the package — colours, type, spacing, radii, shadows, motion.
- **Archetypes** also live here — opinionated defaults per product category.
- **Product themes** live **in your app** — you declare a `PbProductTheme` with three colours. The package does not need to know about it. First-party Popup Bits themes are included via an opt-in import.

## Install

### From GitHub (recommended for the studio)

```yaml
# pubspec.yaml
dependencies:
  popup_bits_design:
    git:
      url: https://github.com/popupbits/popup_bits_design
      ref: main                 # or a tag like v0.1.0
      path: packages/popup_bits_design
  google_fonts: ^6.2.1
```

### Local path (monorepo)

```yaml
dependencies:
  popup_bits_design:
    path: ../popup_bits_design
```

## Use

### Minimum — app defines its own product theme

This is the **recommended pattern for new apps**. No edits to the package.

```dart
import 'package:flutter/material.dart';
import 'package:popup_bits_design/popup_bits_design.dart';

const myProduct = PbProductTheme(
  id: 'myapp',
  name: 'My App',
  accent:     Color(0xFF0E8A8A),
  accentSoft: Color(0xFFD6EFEE),
  accentInk:  Color(0xFF1F2A3A),
);

void main() => runApp(MaterialApp(
  theme: PopupBitsTheme.build(
    archetype: PbArchetype.marketplace,
    product:   myProduct,
  ),
  home: const Home(),
));
```

### Opt-in — use a first-party Popup Bits product

```dart
import 'package:popup_bits_design/popup_bits_design.dart';
import 'package:popup_bits_design/products.dart';  // optional

PopupBitsTheme.build(
  archetype: PbArchetype.cultural,
  product:   PbProducts.jyotish,
);
```

### Inside widgets

```dart
final pb = Theme.of(context).extension<PbThemeExt>()!;
Container(
  decoration: BoxDecoration(
    color: pb.accentSoft,
    borderRadius: BorderRadius.circular(PbTokens.rLg),
    boxShadow: pb.shadowMd,
  ),
);
```

## Extending per product — in the app itself

Every Popup Bits product owns its theme file. The package is a dependency; the theme is **your code**.

```dart
// lib/theme/my_app_theme.dart  — in the PRODUCT repo
import 'package:flutter/material.dart';
import 'package:popup_bits_design/popup_bits_design.dart';

class MyAppTheme {
  static const product = PbProductTheme(
    id: 'myapp',
    name: 'My App',
    accent:     Color(0xFF...),
    accentSoft: Color(0xFF...),
    accentInk:  Color(0xFF...),
  );

  static ThemeData light() => PopupBitsTheme.build(
    archetype: PbArchetype.kid,
    product:   product,
  );

  static ThemeData dark() => PopupBitsTheme.build(
    archetype: PbArchetype.kid,
    product:   product,
    brightness: Brightness.dark,
  );
}
```

Then:

```dart
MaterialApp(
  theme: MyAppTheme.light(),
  darkTheme: MyAppTheme.dark(),
  themeMode: ThemeMode.system,
);
```

Override further by wrapping a subtree with `Theme( data: Theme.of(context).copyWith(...) )` — standard Flutter. The `PbThemeExt` extension composes correctly with `copyWith`.

## Package layout

```
packages/popup_bits_design/
├── pubspec.yaml
├── analysis_options.yaml
├── LICENSE · CHANGELOG.md · README.md · .gitignore
├── lib/
│   ├── popup_bits_design.dart       # public base API
│   ├── products.dart                # opt-in: first-party product themes
│   └── src/
│       ├── tokens.dart
│       ├── archetype.dart
│       ├── product_theme.dart
│       ├── products.dart            # PbProducts.meropatro, .jyotish, …
│       ├── theme_ext.dart
│       └── theme_builder.dart
├── test/
│   └── theme_builder_test.dart      # smoke tests per archetype
└── example/
    ├── pubspec.yaml
    └── lib/main.dart
```

## Running the tests

```
cd packages/popup_bits_design
flutter pub get
flutter test
```

## Flutter version support

Requires **Flutter 3.24+** (Material 3, `CardThemeData`). On older Flutter,
change `CardThemeData` → `CardTheme` in `lib/src/theme_builder.dart`.

## Publishing to GitHub

1. `git init` inside `packages/popup_bits_design/` **or** keep it as a subdirectory of the studio monorepo and use the `path:` qualifier in consumer `pubspec.yaml` (shown above).
2. Tag releases — `v0.1.0`, `v0.2.0`. Consumers pin with `ref: v0.1.0`.
3. Bump the `version:` in `pubspec.yaml` and update `CHANGELOG.md` on every release.

> Not published to pub.dev yet — Git-based consumption is the current recommendation.
