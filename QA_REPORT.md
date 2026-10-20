# EDUGURU V4.9.107 — QA REPORT

Baseline SHA-256:
`7f11e3202ed6b744ee540611269083edde02e932c2f1ec4ebdc89aceaa019683`

## Root cause
Ditemukan blok duplikat besar sesudah V4.9.102 dan sebelum V4.9.103. Awal blok berada di luar tag `<script>`, sehingga source JavaScript dirender sebagai teks biasa di bawah footer pada Android/GitHub Pages.

## Repair
- Hapus blok duplikat/korup secara total.
- Pertahankan patch unik V4.9.103, V4.9.105, dan runtime print stabil.
- Rebuild paket GitHub Pages.

## Audit
```json
{
  "bad_block_found": true,
  "resume_marker_found": true,
  "removed_chars": 6022365,
  "parser_outside_script_leaks": 0,
  "known_duplicate_script_counts": {
    "<script id=\"docsync-v43\">": 1,
    "<script id=\"docsync-v43-logic\">": 1,
    "<script id=\"data-safe-v44\">": 1,
    "<script id=\"eduguru-v4972-ui-grade-analysis-print\">": 1,
    "<script id=\"eduguru-v4999-live-editor-content-fix\">": 1,
    "<script id=\"eduguru-v49100-presensi-mobile-engine\">": 1,
    "<script id=\"eduguru-v49102-android-presensi-scroll-lock-engine\">": 1
  },
  "unique_v49103_present": true,
  "unique_v49105_present": true,
  "unique_v49106_present": true,
  "script_checks": {
    "eduguru-v49103-print-a4-engine": "PASS",
    "eduguru-v49105-a4-portrait-autofit": "PASS",
    "eduguru-v49106-stable-print-runtime": "PASS"
  }
}
```

Parser memastikan tidak ada lagi `function printSelectedDocsV39` sebagai text node di luar `<script>`.
