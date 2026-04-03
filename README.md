![setup.sh](/docs/images/app.png "setup.sh")

# First Setup Toolkit

Geliştirici ortamını tek komutla kuran Bash script koleksiyonu. Hangi uygulamaları kuracağını kendin seçersin.

---

## Desteklenen İşletim Sistemleri

| Dağıtım | Destek | Not |
|---------|--------|-----|
| **Ubuntu 22.04 LTS** | Tam | Birincil hedef |
| **Ubuntu 24.04 LTS** | Tam | Birincil hedef |
| **Linux Mint 21 / 22** | Büyük ölçüde | `settings.sh` Yaru temasını bulamaz; GNOME edition önerilir |
| **Pop!_OS 22.04 / 24.04** | Büyük ölçüde | GNOME tabanlı; Yaru teması yok, diğer adımlar çalışır |
| **Debian 12 (Bookworm)** | Kısmi | `snap` varsayılanda kurulu değil; Docker repo Ubuntu'ya özgü |
| Fedora / Arch / openSUSE | Desteklenmez | `apt` kullanılmıyor |
| Elementary OS | Desteklenmez | Pantheon masaüstü, GNOME değil |

> `settings.sh` yalnızca GNOME + `dash-to-dock` uzantısı aktif sistemlerde tam çalışır.

---

## Kurulacak Paketler

| Paket | Yöntem |
|-------|--------|
| Google Chrome | `.deb` (Google CDN) |
| Docker + Compose v2 | Resmi Docker deposu |
| Git | `apt` |
| Node.js (LTS) | `nvm` |
| VS Code | `.deb` (Microsoft CDN) |
| Postman | `snap` |
| Remmina | `snap` |
| zsh + oh-my-zsh | `apt` + installer script |

---

## Kullanım

### 1. Repoyu klonla

```bash
git clone https://github.com/gokhangunduz/first-setup
cd first-setup
chmod +x ./setup.sh
```

### 2. (İsteğe bağlı) Yapılandırmayı özelleştir

`config.sh` dosyasını düzenle:

```bash
# Örnek: kendi git bilgilerini gir
GIT_USER_NAME="senin-adin"
GIT_USER_EMAIL="sen@mail.com"
```

Ya da kurulum sırasında env variable olarak geç:

```bash
GIT_USER_NAME="senin-adin" GIT_USER_EMAIL="sen@mail.com" ./setup.sh
```

### 3. Kurulumu başlat

```bash
./setup.sh
```

Terminalde paket listesi çıkar, kurmak istediğin numaraları boşlukla gir (veya `all`):

```
Mevcut paketler:
----------------
  [1] chrome
  [2] docker
  [3] git
  ...

Kurulacak paket numaralarını girin (örn: 1 3 4) veya "all":
>
```

Kurulum tamamlandığında log dosyasını inceleyebilirsin:

```bash
cat /tmp/first-setup.log
```

### Dry-run modu

Herhangi bir şey kurmadan ne kurulacağını görmek için:

```bash
./setup.sh --dry-run
```

---

## Proje Yapısı

```
first-setup/
├── setup.sh        # Ana orkestratör
├── settings.sh     # GNOME masaüstü ayarları
├── config.sh       # Kullanıcı yapılandırması
├── lib/
│   └── utils.sh    # Ortak yardımcı fonksiyonlar
└── packages/
    ├── chrome.sh
    ├── docker.sh
    ├── git.sh
    ├── nodejs.sh
    ├── postman.sh
    ├── remmina.sh
    ├── vs-code.sh
    └── zsh.sh
```

Yeni bir paket eklemek için `packages/` altına `paketadi.sh` dosyası oluştur — setup.sh otomatik olarak algılar.
