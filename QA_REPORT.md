# EDUGURU V4.10.04 — QA

Baseline V4.10.03 SHA-256: `fbff07ca53f7dcaf75b5ac2919121b06d404f06243ae69b99666a3a2eb14b6e0`

Perubahan:
- Klik gambar/logo → muncul 4 handle sudut.
- Drag handle → resize seperti Word.
- Rasio gambar dipertahankan; tahan Shift untuk resize bebas.
- Batas kanan kolom tabel bisa ditarik kiri/kanan.
- Kolom aktif dan kolom sebelah disesuaikan bersama.
- Resize gambar/kolom masuk autosave revisi editor.
- Handle kolom dipasang ulang setelah pagination/redraw.
- Handle tidak ikut tercetak.

Static QA:
{
  "runtime_syntax": true,
  "main_syntax": true,
  "image_handles": true,
  "image_drag": true,
  "image_ratio": true,
  "column_handles": true,
  "column_drag": true,
  "autosave": true,
  "mutation_reinstall": true,
  "freeze_preserved": true,
  "book_engine_preserved": true
}

Runtime dan main patch: PASS `node --check`.
Browser drag nyata tetap perlu diuji di Chrome target.
