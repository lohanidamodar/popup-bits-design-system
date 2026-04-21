// Base tokens shared by every product. Colours, type scale, spacing,
// radii, shadows and motion curves. No product identity lives here.

import 'package:flutter/material.dart';

class PbTokens {
  PbTokens._();

  // ---------- Neutrals ----------
  static const n0   = Color(0xFFFFFFFF);
  static const n50  = Color(0xFFFAFAF7); // warm paper — default bg
  static const n100 = Color(0xFFF2F3EF);
  static const n200 = Color(0xFFE6E7E1);
  static const n300 = Color(0xFFD4D6CE);
  static const n400 = Color(0xFFA8ABA1);
  static const n500 = Color(0xFF7A7D73);
  static const n600 = Color(0xFF55584F);
  static const n700 = Color(0xFF373A33);
  static const n800 = Color(0xFF22241F);
  static const n900 = Color(0xFF121310);

  // ---------- Dark-mode neutrals ----------
  static const darkBg        = Color(0xFF0B1220);
  static const darkBgRaised  = Color(0xFF121B2E);
  static const darkBgSunken  = Color(0xFF0A101C);
  static const darkFg        = Color(0xFFF1F3F5);
  static const darkFgMuted   = Color(0xFFAEB6C2);
  static const darkFgSubtle  = Color(0xFF7C8796);
  static const darkBorder    = Color(0xFF1E2A42);

  // ---------- Semantic status colours ----------
  static const success = Color(0xFF2E9E6D);
  static const warning = Color(0xFFF6B13C);
  static const danger  = Color(0xFFE85A4F);
  static const info    = Color(0xFF4A90E2);

  // ---------- Font families (loaded via google_fonts at runtime) ----------
  static const fontSans    = 'Nunito';
  static const fontDisplay = 'Baloo 2';
  static const fontDeva    = 'Mukta';
  static const fontMono    = 'JetBrains Mono';

  // ---------- Type scale (dp — Flutter uses logical pixels) ----------
  static const fsXs   = 12.0;
  static const fsSm   = 14.0;
  static const fsBase = 16.0;
  static const fsMd   = 18.0;
  static const fsLg   = 20.0;
  static const fsXl   = 24.0;
  static const fs2xl  = 32.0;
  static const fs3xl  = 40.0;
  static const fs4xl  = 56.0;
  static const fs5xl  = 72.0;

  // ---------- Spacing (4-pt grid) ----------
  static const sp1  = 4.0;
  static const sp2  = 8.0;
  static const sp3  = 12.0;
  static const sp4  = 16.0;
  static const sp5  = 20.0;
  static const sp6  = 24.0;
  static const sp8  = 32.0;
  static const sp10 = 40.0;
  static const sp12 = 48.0;
  static const sp16 = 64.0;

  // ---------- Radii ----------
  static const rXs  = 6.0;
  static const rSm  = 10.0;
  static const rMd  = 14.0;
  static const rLg  = 20.0;
  static const rXl  = 28.0;
  static const r2xl = 36.0;
  static const rPill = 999.0;

  // ---------- Shadows ----------
  static const List<BoxShadow> shXs = [
    BoxShadow(color: Color(0x0D121310), blurRadius: 2, offset: Offset(0, 1)),
  ];
  static const List<BoxShadow> shSm = [
    BoxShadow(color: Color(0x12121310), blurRadius: 6, offset: Offset(0, 2)),
  ];
  static const List<BoxShadow> shMd = [
    BoxShadow(color: Color(0x17121310), blurRadius: 16, offset: Offset(0, 6)),
  ];
  static const List<BoxShadow> shLg = [
    BoxShadow(color: Color(0x1F121310), blurRadius: 32, offset: Offset(0, 14)),
  ];
  static const List<BoxShadow> shXl = [
    BoxShadow(color: Color(0x29121310), blurRadius: 48, offset: Offset(0, 24)),
  ];

  // ---------- Motion ----------
  static const tFast = Duration(milliseconds: 120);
  static const tMed  = Duration(milliseconds: 220);
  static const tSlow = Duration(milliseconds: 360);

  static const easeOut    = Cubic(0.2, 0.8, 0.2, 1.0);
  static const easeInOut  = Cubic(0.6, 0.0, 0.2, 1.0);
  static const easeSpring = Cubic(0.34, 1.56, 0.64, 1.0); // playful bounce
}
