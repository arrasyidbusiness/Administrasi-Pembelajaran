# EDUGURU V4.9.106 — GitHub Pages Deploy

Paket ini disiapkan agar file standalone EDUGURU V4.9.106 dapat langsung dipublikasikan melalui GitHub Pages.

## Isi paket
- `index.html` — aplikasi utama EDUGURU V4.9.106
- `.nojekyll` — mencegah pemrosesan Jekyll
- `README_GITHUB_DEPLOY.md` — panduan deploy

## Cara deploy
1. Buat repository GitHub baru.
2. Ekstrak ZIP ini.
3. Upload `index.html` dan `.nojekyll` ke root repository.
4. Buka **Settings → Pages**.
5. Pilih **Deploy from a branch**.
6. Pilih branch **main** dan folder **/(root)**.
7. Klik **Save** dan tunggu URL GitHub Pages aktif.

## Catatan Supabase
Jika autentikasi atau fitur Cloud/Supabase membatasi origin/domain, tambahkan URL GitHub Pages Anda ke konfigurasi redirect/origin yang relevan di Supabase.

## Catatan penting
Paket deploy ini tidak mengubah substansi aplikasi. File HTML sumber hanya disalin sebagai `index.html` agar menjadi entry point GitHub Pages.
