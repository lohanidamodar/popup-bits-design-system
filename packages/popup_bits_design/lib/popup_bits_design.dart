// Popup Bits — base design system (no product themes).
//
// This library ships the universal tokens, the archetype presets, the
// theme builder, and the theme extension. It does NOT include specific
// product themes — apps declare their own via `PbProductTheme(...)`,
// or import the opt-in first-party set from
// `package:popup_bits_design/products.dart`.
library;

export 'src/tokens.dart';
export 'src/archetype.dart';
export 'src/product_theme.dart';
export 'src/theme_ext.dart';
export 'src/theme_builder.dart';
