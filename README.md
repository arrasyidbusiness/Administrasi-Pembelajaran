# Sistem Administrasi & Pembelajaran — V4.4.2 GitHub Ready

Paket ini siap digunakan sebagai static web app di GitHub Pages.

## Deploy
1. Buat repository baru di GitHub.
2. Upload seluruh ISI folder ini ke root repository, terutama `index.html`.
3. Commit perubahan.
4. Buka Settings → Pages.
5. Pada Build and deployment pilih **Deploy from a branch**.
6. Branch: `main`, folder: `/ (root)`, lalu Save.
7. Tunggu GitHub Pages menerbitkan URL HTTPS aplikasi.

## Supabase
Aplikasi menggunakan Supabase untuk login dan Cloud Sync. Jalankan SQL setup yang tersedia
di folder `supabase/` pada SQL Editor project Supabase sebelum menguji sinkronisasi.

Jangan menaruh Service Role / Secret Key Supabase di `index.html` atau repository publik.
Browser hanya boleh memakai publishable/anon key yang memang ditujukan untuk client.

## Uji setelah deploy
- Buka URL GitHub Pages.
- Masuk melalui Cloud Sync.
- Simpan ke Cloud.
- Buka URL yang sama dari perangkat lain.
- Login dengan akun yang sama.
- Ambil data dari Cloud.
- Uji Data Utama, kelas/siswa, presensi, nilai, analisis dan Pusat Cetak.

V4.4.1 tetap menjadi rollback baseline.
