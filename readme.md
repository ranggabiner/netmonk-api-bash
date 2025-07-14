# ⚡ Netmonk API Test Runner (macOS Edition)

Script bash interaktif buat ngejalanin **automated API tests** dari Postman collection via [Newman](https://www.npmjs.com/package/newman) — lengkap sama UI selector pakai [`fzf`](https://github.com/junegunn/fzf), dan report HTML kece via [`htmlextra`](https://www.npmjs.com/package/newman-reporter-htmlextra).

---

## 📦 Features

- ✅ Pilih collection (HI / PRIME / PORTAL) lewat pop-up CLI
- 📊 Report HTML otomatis disimpan ke folder lokal
- 🎨 UI interaktif pake `fzf` biar gak ribet
- 🔐 Konfigurasi API & Environment ID dipisah ke file `.env`
- 🚀 Bisa langsung buka hasil report di browser

---

## 🛠️ Installation (macOS)

### 0. Install Homebrew (jika belum ada)

Buka Terminal dan jalankan:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Setelah selesai, ketik `brew` buat tes apakah udah berhasil.

---

### 1. Install `fzf` (buat UI interaktif)

```bash
brew install fzf
```

Optional (biar makin mantep):

```bash
$(brew --prefix)/opt/fzf/install
```

---

### 2. Install Node.js & npm (jika belum ada)

```bash
brew install node
```

---

### 3. Install `newman` dan reporter HTML

```bash
npm install -g newman
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

## 📁 Folder Structure

Pastikan folder project lo punya struktur seperti ini sebelum menjalankan script:

```
📦 netmonk-api-bash/
├── 🟢 netmonk_api.sh          # script utama buat jalanin testing
├── 🟡 config.env              # file environment config (jangan di-commit ke Git!)
├── 📄 README.md               # dokumentasi kece ini
```

📝 **Note:**

- `config.env` harus disunting via code editor (kayak VS Code) supaya gak typo
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

Script bakal munculin pilihan:

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

Kalau `fzf` nggak muncul, coba restart terminal dulu atau ketik:

```bash
source ~/.zshrc
```

---

## 👨‍💻 Author

Made with 💙 by [Rangga Hadi Putra](https://ranggabiner.com)
`Cc Netmonk 2025` | QA ⚙️ Automation Enthusiast
