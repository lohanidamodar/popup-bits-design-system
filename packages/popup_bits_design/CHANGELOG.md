## 0.1.0

- Initial release.
- `PbTokens` — neutrals, type, spacing, radii, shadows, motion.
- `PbArchetype` — kid / cultural / utility / marketplace, with per-archetype defaults.
- `PbProductTheme` — data class for an accent triplet (+ optional forced brightness & display-font override).
- `PopupBitsTheme.build(archetype, product, brightness)` — returns a Material-3 `ThemeData`.
- `PbThemeExt` — `ThemeExtension` carrying accent/shadow/motion tokens.
- Opt-in `products.dart` library export with first-party Popup Bits product themes.
- `PbProducts.byId('...')` lookup helper.
- Basic smoke-test suite in `test/`.
- Example app in `example/` demonstrating both first-party and app-defined product themes.

### Flutter compatibility

- Requires Flutter **3.24+** (Material 3, `CardThemeData`). For older Flutter,
  swap `CardThemeData` back to `CardTheme` in `theme_builder.dart`.

