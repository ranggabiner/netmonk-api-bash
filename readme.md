# ⚡ Netmonk API Test Runner

Script bash interaktif buat ngejalanin **automated API tests** dari Postman collection via [Newman](https://www.npmjs.com/package/newman) — lengkap sama UI selector pakai [`fzf`](https://github.com/junegunn/fzf), dan report HTML kece via [`htmlextra`](https://www.npmjs.com/package/newman-reporter-htmlextra).

---

## 📦 Features

- ✅ Pilih collection (HI / PRIME / PORTAL) lewat pop-up CLI
- 📊 Report HTML otomatis disimpan ke folder lokal
- 🎨 UI interaktif pake `fzf` biar gak ribet
- 🔐 Konfigurasi API & Environment ID dipisah ke file `.env`
- 🚀 Bisa langsung buka hasil report di browser

---

## 🛠️ Installation

> ✅ Tested on macOS. Lo butuh `brew` dan `node/npm` udah ke-install ya say.

```bash
# 1. Install fzf (buat UI pilihannya)
brew install fzf

# 2. Install newman (buat run postman collection)
npm install -g newman

# 3. Install htmlextra (buat hasilin report HTML kece)
npm install -g newman-reporter-htmlextra
```

---

## ⚙️ Setup Environment Variables

Bikin file `config.env` di root project lo:

```env
# config.env

POSTMAN_API_KEY="ISI_PAKAI_API_KEY_LO"

HI_COLLECTION_ID="COLLECTION_ID_HI"
PRIME_COLLECTION_ID="COLLECTION_ID_PRIME"
PORTAL_COLLECTION_ID="COLLECTION_ID_PORTAL"

HI_ENVIRONMENT_ID="ENV_ID_HI"
PRIME_ENVIRONMENT_ID="ENV_ID_PRIME"
PORTAL_ENVIRONMENT_ID="ENV_ID_PORTAL"
```

---

### 📁 Folder Structure

Pastikan folder project lo punya struktur seperti ini sebelum menjalankan script:

```
📦 netmonk-api-bash/
├── 🟢 netmonk_api.sh          # script utama buat jalanin testing
├── 🟡 config.env              # file environment config (jangan di-commit ke Git!)
├── 📄 README.md               # dokumentasi kece ini
```

📝 **Note:**

- `config.env` harus disunting via code editor (kayak VS Code) supaya gak ada typo atau format salah.
- File ini _tidak perlu di-push ke GitHub_, karena berisi API key (sensitive data) 🛡️

---

## 🚀 How to Use

### 1. Masuk ke Folder Script

```bash
cd /folder/tempat/netmonk_api.sh
```

### 2. Bikin Script Bisa Dieksekusi

```bash
chmod +x netmonk_api.sh
```

### 3. Jalankan Script

```bash
./netmonk_api.sh
```

Script bakal nampilin pilihan:

```
PRIME
HI
PORTAL
```

Pilih sesuai kebutuhan, dan report HTML langsung di-generate otomatis.

---

## 📂 Report Output

📁 Report akan disimpan ke:

```
~/Documents/postman_newman
```

📝 Format nama file:

```
[REPORT_NAME]_Report_YYYY-MM-DD_HH-MM-SS.html
```

🧭 Setelah selesai test, script akan tanya:

- ✅ YA → buka langsung report di browser
- ❌ TIDAK → simpan dan buka manual nanti

---

## 💡 Tips

Kalau udah pernah `chmod +x`, buat selanjutnya tinggal:

```bash
./netmonk_api.sh
```

Langsung gas tanpa setup ulang ⚡

---

## 👨‍💻 Author

Made with 💙 by [Rangga Hadi Putra](https://ranggabiner.com)  
`Cc Netmonk 2025` | QA ⚙️

---
