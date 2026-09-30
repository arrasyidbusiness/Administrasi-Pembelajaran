# EDUGURU V4.5.18 — GitHub Pages Ready

## Upload ke GitHub
Upload isi folder/ZIP ini langsung ke root repository:
- index.html
- .nojekyll
- README.md
- VERSION.json

Lalu aktifkan:
Settings → Pages → Deploy from a branch → main → /(root)

Catatan:
- Jangan upload folder pembungkus tambahan bila ingin index.html langsung terbaca.
- Jika mengganti versi lama, replace index.html di root repository.
- Hard refresh browser setelah deploy (Ctrl+Shift+R).
- Tidak ada service worker agar versi lama tidak tertahan cache aplikasi.
