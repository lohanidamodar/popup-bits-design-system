# Popup Bits — Design System

> A shared design foundation for the Popup Bits product family.
> Every app is distinct — but they read, feel, and behave like siblings from the same studio.

## 1. Studio & products

**Popup Bits Pvt. Ltd.** is an independent software studio based in Kathmandu, Nepal. The studio builds educational, cultural, and utility apps for a primarily Nepali audience, with bilingual (English + नेपाली) interfaces throughout. The tech stack is Flutter-heavy.

Active products covered in this system:

| Product        | Surface                                | What it is                                                    | Accent         | Archetype    |
| -------------- | -------------------------------------- | ------------------------------------------------------------- | -------------- | ------------ |
| **Mero Patro** | web — `meropatro.purkha.org`           | Nepali calendar with BS/AD date conversion                    | Saffron-red    | Cultural     |
| **Mero Nepali**| Android — `dev.appwriters.mero_nepali` | Playful Nepali-language learning app for children (3+)        | Leaf green     | Kid          |
| **SpellCraft** | Android — `com.popupbits.spellcraft`   | Voice-powered spelling & dictation game for kids              | Navy + teal    | Kid          |
| **Popup Bits** | web — `popupbits.com` (+ `.com.np`)    | Studio marketing / landing site                               | Orange         | Utility      |
| **UI Challenges — Flutter** | Android — `com.popupbits.flutteruichallenges` | Flutter UI demo / portfolio app (dev-facing) | Flutter blue   | Utility      |

**In the pipeline** (tokens reserved so design work can start today):

| Product (working name) | What it is                                              | Accent         | Archetype    |
| ---------------------- | ------------------------------------------------------- | -------------- | ------------ |
| **Jyotish** *(tbd)*    | Astrology / panchang — horoscopes, birth charts, rituals| Indigo + gold  | Cultural     |
| **Sanskrit** *(tbd)*   | Classical Sanskrit learning — reading, shlokas, audio   | Saffron + maroon| Cultural    |
| **Rent** *(tbd)*       | Marketplace — property + goods rental & seeking         | Teal + slate   | Marketplace  |

### The system is built to scale

The studio ships a wide variety of apps, and more are coming. The design system is therefore deliberately **framework-style, not one-skin-fits-all**. Every product composes from three layers:

1. **Base tokens** — shared neutrals, type scale, spacing, radii, shadows, motion. Always inherited.
2. **Archetype preset** — one of `arch-kid` / `arch-cultural` / `arch-utility` / `arch-marketplace`. Sets opinionated defaults (roundness, easing, bg warmth, display-font choice) for the product category.
3. **Product theme** — one of `theme-meropatro` / `theme-meronepali` / `theme-spellcraft` / `theme-popupbits` / `theme-jyotish` / `theme-sanskrit` / `theme-rent`. Swaps the accent triplet.

Scope them on a wrapper:

```html
<div class="arch-cultural theme-jyotish">
  <!-- every component inside is now Jyotish-branded -->
</div>
```

### Adding a new product (the 4-step recipe)

1. **Pick an archetype.** If you can't decide, ask: "is this for kids?" → `arch-kid`. "Is it cultural / classical / ritual-adjacent?" → `arch-cultural`. "Is it a tool or utility?" → `arch-utility`. "Does it have listings / buyers / sellers?" → `arch-marketplace`.
2. **Pick an accent hex** (plus a soft variant and an ink variant). Eyedrop from the product's existing assets, or pick from the pipeline palette in `colors_and_type.css`.
3. **Add a `.theme-{yourproduct}` block** under the PRODUCT THEMES section of `colors_and_type.css`. Three CSS vars, five seconds.
4. **Wrap your UI** in `<div class="arch-{chosen} theme-{yours}">`. Done. Every component picks up the overrides automatically — no further changes required.

Contact (public): `popupbits@gmail.com` · Gaurighat, Kathmandu-8, Nepal.

### Source material consulted
- <https://meropatro.purkha.org/> — live web app
- <https://www.meronepali.org/> — marketing page (captures limited; DNS returned minimal content on fetch)
- <https://www.popupbits.com/> — studio site (**not reachable at build time — flagged**)
- <https://play.google.com/store/apps/details?id=dev.appwriters.mero_nepali> — store listing + screenshots
- <https://play.google.com/store/apps/details?id=com.popupbits.spellcraft> — store listing

No codebase, Figma, or design file was attached for this design system; visuals were reconstructed from Play Store screenshots and the reachable live site. **See “Caveats” at the bottom.**

---

## 2. Content fundamentals

### Voice

Popup Bits writes like a kind, encouraging teacher. Copy is **warm, simple, and declarative** — no jargon, no marketing bombast. The tone favors action over description ("Learn", "Try", "Explore").

- **Point of view:** Uses the second person ("you", "your child"). The product often speaks **about** the learner ("designed for children", "builds a strong foundation") rather than at them directly — this is deliberate because the apps target young kids with parents reading the chrome.
- **Bilingual by default:** Nepali (Devanagari) is a first-class language, not an afterthought. Headlines and key labels often ship in both scripts side by side (e.g. `meropatro • मेरो पात्रो`). When choosing one, prefer the script of the primary audience for that surface.
- **Casing:** Sentence case everywhere — including buttons (`Learn more`, not `LEARN MORE`). Titles that are proper nouns stay title-cased. All-caps is reserved for tiny eyebrow labels (≤14 px).
- **Punctuation:** Calm. Use a period at the end of full sentences in descriptions, skip it on buttons and single-line labels. Exclamation marks are fine in kid-facing copy (Mero Nepali / SpellCraft), sparing in Mero Patro / studio copy.
- **Emoji:** Used **sparingly** — occasional sparkle (`✨`) or arrow in feature lists on store pages, but never inside the app UI itself. The apps use **illustrations** where other apps would use emoji.
- **Numbers & dates:** Western digits (`2026`) in Latin copy, Devanagari digits (`२०८२`) in Nepali copy. In Mero Patro both systems are present — Devanagari leads.

### Examples observed

> "मेरो नेपाली" is an engaging educational app designed especially for children to learn the basics of the Nepali language.

> Through vibrant visuals, interactive games, kids can explore Nepali barnamala, and common words in a playful environment.

> This app is 100% free and contains no advertisements.

> `meropatro • मेरो पात्रो` — Nepali Calendar with BS/AD conversion • 2026

Notice the pattern: **what it is → who it's for → how it feels → a small moral promise** ("free and contains no advertisements"). That moral beat — *we respect you* — is a recurring Popup Bits signature; keep it in copy where relevant.

### Do / don't

| Do                                                           | Don't                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------- |
| "Learn Nepali with fun"                                       | "Revolutionary AI-powered language acquisition platform" |
| "अ-ई भकालन" as a module title next to "Alphabet"              | Transliterate Nepali into Latin ("a-ee")                 |
| "No ads, no tracking"                                         | "Premium tier unlocks..."                                |
| "Drag the balloon to match the letter"                        | "Execute matching operation by dragging"                 |

---

## 3. Visual foundations

### Palette

The system uses a **shared neutral scale** plus one **product accent** per surface. Products never borrow each other's accents; the accent *is* the product identity.

- **Mero Nepali** → leaf green `#2E9E6D`, sky blue backgrounds, warm balloon primaries (red, yellow, blue).
- **SpellCraft** → deep navy gradient `#0F2A4A → #1B3E6E`, teal `#49B6B6`, gold stars.
- **Mero Patro** → saffron-red `#E85D2F` (anchored in the Nepal flag), cream paper `#FFF7E8`.
- **Popup Bits studio** → ink navy `#0E1726` + warm orange `#FF5A3C`.

Full tokens live in `colors_and_type.css`.

### Typography

- **Latin display & body:** **Nunito** — rounded, friendly, wide weight range. Used for chrome, buttons, paragraphs.
- **Latin display (optional):** **Baloo 2** — softer, chunkier. Use for big marketing headlines in kid-facing products.
- **Devanagari:** **Mukta** — clean, pairs well with Nunito's x-height. All Devanagari copy gets `.t-deva` (slightly looser line-height and +1 size step to match Latin visual weight).
- **Mono:** **JetBrains Mono** — only for dev-facing surfaces (UI Challenges app, code snippets in docs).

Hierarchy is **generous**: display headlines are 56–72 px, body is 16 px, captions 12 px. We never crowd type; there is always air.

### Space & rhythm

- 4-pt base grid. Most paddings land on 8, 12, 16, 24.
- Section stacks breathe — vertical rhythm between blocks is 48–80 px on the web; 24–32 px in-app.
- Safe-area respect on mobile (Mero Nepali has explicit top/bottom status-bar treatments).

### Backgrounds

- **Default:** warm off-white `#FAFAF7` — not pure white; keeps things calm on long reads.
- **Kid-facing scenes** (Mero Nepali, SpellCraft mini-games): full-bleed **flat-cartoon illustrations** — sky with clouds, underwater with fish, grass field with sun. These are **hand-painted vector scenes**, not patterns and not gradients-over-photo.
- **Card surfaces:** white on the warm bg — the lift comes from soft shadows, not strokes.
- **Gradients:** rare, and always top-to-bottom (never diagonal rainbow). SpellCraft's navy → slightly-lighter-navy is the canonical example.
- **No stock photography.** No noisy textures. No glassmorphism.

### Illustration

A single illustration voice runs across the kid-facing surfaces:

- Flat vector, thick black outlines, **no gradients inside shapes**.
- Bright, saturated fills with a warm bias.
- Characters wear traditional Nepali elements (the Dhaka topi on boys, plaits with red ribbons on girls) — cultural specificity is on-purpose.
- Props repeat: **balloons with Devanagari letters**, chalkboards, fish, suns with faces, grass tufts.

When an illustration isn't available, use a **solid-fill placeholder card** in the product's accent — never a generic gray box.

### Corners & shape

- Buttons: `--r-pill` (fully rounded) for primary CTAs; `--r-md` (14 px) for secondary.
- Cards: `--r-lg` (20 px). Large hero cards: `--r-xl` (28 px).
- App icons: squircle at ~28 % of side (Play/iOS shape). The Mero Nepali & SpellCraft store icons both use this shape.
- Input fields: `--r-md`. Chips & tags: `--r-pill`.

### Elevation & shadows

Soft, low-contrast, layered. The system defines five shadow steps (`--sh-xs` → `--sh-xl`) plus an inset for pressed states and an accent-colored focus ring. **Never use hard black drop shadows or tight offsets** — the brand reads as paper, not plastic.

### Borders

Sparingly. A 1 px `--border` line on inputs and dividers; otherwise prefer shadow or color contrast. No double borders; no dashed borders outside of empty-state placeholders.

### Motion

- **Durations:** 120 / 220 / 360 ms. Nothing longer than 360 ms except deliberate celebration moments.
- **Easing:** `--ease-out` for enter, `--ease-in-out` for state swaps, `--ease-spring` (bouncy) for playful rewards (correct-answer pop, balloon rise).
- **No parallax, no scroll-jacking.** Scroll stays honest.
- **Page transitions:** cross-fade + 8-px slide up. Modals scale from 0.96 → 1 with a 12-px lift.

### Interaction states

| State     | Effect                                                           |
| --------- | ---------------------------------------------------------------- |
| Hover     | Lighten bg by ~4 % OR lift shadow one step                        |
| Focus     | Accent-colored ring (`--sh-ring`) — **always** keyboard-visible   |
| Active    | Scale 0.97 + inset shadow; **no color flash** on kid surfaces      |
| Disabled  | 40 % opacity, `cursor: not-allowed`                                |
| Loading   | Pulsing skeleton in `--n-100` → `--n-200`                          |

### Transparency & blur

Used only on the mobile status-bar / app-bar *scrim* (4 % black overlay on scroll) and on modal backdrops (20 % black). No frosted navbars, no heavy blurs — Flutter's default `BackdropFilter` looks dated and the brand avoids it.

### Layout rules

- **Fixed elements:** bottom nav on mobile (56 px + safe area). Sticky web header (64 px) with a 40 % accent underline on the active nav item.
- Max content width on marketing web: **1120 px**. Long-form reads cap at **640 px**.
- One-handed thumb zone: primary actions on mobile sit in the bottom third.

### Color vibe of imagery

Warm and saturated. If stock or photography is ever added, it should be sunny, daylit, warm-tinted — **never** cool-blue corporate shots, **never** b&w, **never** filtered grain.

---

## 4. Iconography

Popup Bits apps do not ship a dense icon library today. Observations:

- **Mero Patro** (web) uses minimal iconography — a single Devanagari glyph (`म`) as the product mark and a few Material-esque monoline icons for chrome (sign in, menu). **Material Symbols (Rounded)** is the closest CDN match and is our documented fallback.
- **Mero Nepali** relies almost entirely on **illustrations**, not icons, inside the product. The handful of UI icons (back arrow, sound) are solid-fill, rounded, same weight as the illustrations.
- **SpellCraft** uses the same solid-fill rounded style: a mic icon, a speaker, a play triangle.

### Convention to follow

1. **First preference — use an illustration.** If the concept is "learn", "play", "read" — draw it, don't icon it.
2. **Second preference — Material Symbols Rounded**, 24 px, weight 500, grade 0, optical size 24. Fill off for chrome, fill on for active-state.
3. **Never use thin-line or multicolor icon sets** (Feather, Flat Color Icons) — they fight the rounded-flat illustration voice.
4. **Emoji:** only on store listings and marketing copy, never in-product.
5. **Unicode-as-icon:** acceptable for Devanagari glyphs as decoration (the `म` mark in Mero Patro is literally the letter).

### Icon substitution flag

Because no first-party icon font was found, the system documents **Material Symbols Rounded** as the working substitute. If/when Popup Bits standardizes on a bespoke set, swap it in `assets/icons/` and update this section.

---

## 5. File index

| File / folder                     | What it is                                                                |
| --------------------------------- | ------------------------------------------------------------------------- |
| `README.md`                       | You are here. The system's written guide.                                 |
| `SKILL.md`                        | Agent-invocable skill manifest.                                           |
| `colors_and_type.css`             | All design tokens (CSS custom properties) + semantic text presets.        |
| `assets/logos/`                   | Product marks and the studio logotype.                                    |
| `assets/icons/`                   | Shared UI icons (Material Symbols subset).                                |
| `assets/illustrations/`           | Reusable cartoon illustrations (kids, balloons, scenes).                  |
| `assets/references/`              | Source screenshots captured while researching. **Reference only.**        |
| `preview/`                        | Small HTML cards rendered in the Design System tab.                       |
| `ui_kits/mero_patro/`             | Mero Patro calendar UI recreation.                                        |
| `ui_kits/mero_nepali/`            | Mero Nepali kids' app UI recreation.                                      |
| `ui_kits/spellcraft/`             | SpellCraft dictation game UI recreation.                                  |
| `ui_kits/popupbits/`              | Popup Bits studio site UI recreation.                                     |
| `packages/popup_bits_design/`     | Flutter package (GitHub-installable) — base tokens, archetypes, theme builder. Per-product themes live in the product apps. |

Each UI kit has its own `README.md`, an `index.html` demo, and one `.jsx` file per component.

---

## 6. Caveats — please read

- **`popupbits.com` did not respond** when I tried to fetch it during system build. The studio surface is therefore reconstructed from general brand DNA (Nepali-English, Kathmandu contact block, "by PopupBits" attributions on Play Store). **Please share a screenshot or grant access and I'll iterate.**
- **No codebase, Figma, or design file was attached.** Every UI in `ui_kits/` is built against Play Store screenshots and the live Mero Patro web app — it's high-fidelity visually, but component-level details (exact padding, exact weights, actual font choices) are best-guesses.
- **Fonts are Google Fonts substitutes.** I picked **Nunito** (Latin body), **Baloo 2** (Latin display), **Mukta** (Devanagari), **JetBrains Mono** (code) — these match the observed feel. If Popup Bits has licensed fonts, drop the `.ttf`/`.woff2` files into `fonts/` and replace the `@import` line at the top of `colors_and_type.css`.
- **No real icon font was shipped.** Material Symbols Rounded is the documented fallback.
- **`meronepali.org`** served limited content on fetch — the marketing site likely exists but could not be visually inspected.

### How you can help me iterate to perfect

1. **Re-attach `popupbits.com`** (screenshots or full HTML) so I can ground the studio UI kit.
2. **Send one or more of your codebases** (Flutter or web) — the difference between "plausible" and "pixel-accurate" is code access. I can read your widget tree, pull real colors, real paddings, real animation curves.
3. **Confirm or correct the accent colors** I reverse-engineered — I eyedropped from screenshots and they may be off by a few points.
4. **Tell me which product should lead the system.** Right now I treated Mero Nepali as the most visually fleshed-out anchor; if Popup Bits as a studio should lead, I'll recolor accordingly.
