---
name: popup-bits-design
description: Use this skill to generate well-branded interfaces and assets for Popup Bits (Kathmandu-based studio — Mero Patro, Mero Nepali, SpellCraft, Jyotish, Sanskrit, Rent, etc.), either for production or throwaway prototypes/mocks. Contains essential design guidelines, colors, type, fonts, assets, Flutter theme package, and UI kit components for prototyping.
user-invocable: true
---

Read the README.md file within this skill, and explore the other available files.

Key architecture: **base tokens → archetype (kid/cultural/utility/marketplace) → product theme**. Scope a surface with `<div class="arch-cultural theme-jyotish">` in web, or `PopupBitsTheme.build(archetype: ..., product: ...)` in Flutter.

If creating visual artifacts (slides, mocks, throwaway prototypes, etc), copy assets out of `assets/` and create static HTML files for the user to view, pulling tokens from `colors_and_type.css`. If working on production code, copy the Flutter package in `flutter/popup_bits_design/` into the app's workspace and build a theme from the composable API.

If the user invokes this skill without any other guidance, ask them what they want to build or design, ask some questions (which product? which archetype? web or Flutter?), and act as an expert designer who outputs HTML artifacts *or* production code, depending on the need.
