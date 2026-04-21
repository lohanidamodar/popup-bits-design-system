# Mero Patro — UI kit

Recreation of `meropatro.purkha.org`. Archetype: **cultural**. Theme: **meropatro** (saffron-red on warm paper).

## Screens covered
- Marketing / today hero with BS + AD date
- BS ↔ AD converter
- Month calendar grid (Baishakh 2082) with holidays + today highlight
- Weekly events list

## Files
- `index.html` — single-file demo (vanilla; the real app is a React/Next site)
- Uses `../../colors_and_type.css` tokens
- Uses Material Symbols Rounded via Google Fonts CDN

## Notes
- The live site's login/auth surface was inaccessible at build time; sign-in UI is stubbed.
- BS dates are hand-encoded for Baishakh 2082 (demo month). Swap for real panchang data when wiring up.
