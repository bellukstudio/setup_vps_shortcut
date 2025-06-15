# 📦 VPS Setup with Makefile

This repository provides a `Makefile` to simplify the setup of common server tools like:

- Docker & Docker Compose
- Nginx
- PHP (8.0–8.3)
- PostgreSQL
- MySQL
- phpMyAdmin
- pgAdmin
- Node.js & PM2

---

## ⚙️ Prerequisites

Before running the Makefile, ensure that the `make` utility is installed on your VPS.

### ✅ Install `make` on Ubuntu/Debian

```bash
sudo apt update
sudo apt install -y make
````

---

## 🚀 How to Use

1. **Clone this repository or copy the Makefile into your VPS project folder**:

   ```bash
   git clone https://your-repo-url.git
   cd your-repo-folder
   ```

2. **Run the full setup (all services)**:

   ```bash
   make all
   ```

   This will install and configure the following:

   * Docker (latest) & Docker Compose plugin
   * Nginx
   * PHP 8.0, 8.1, 8.2, and 8.3
   * PostgreSQL
   * pgAdmin 4
   * MySQL Server
   * phpMyAdmin
   * Node.js (LTS 18.x) & PM2

3. **Or run specific setup targets only**:

   ```bash
   make docker         # Install Docker and Docker Compose
   make php            # Install PHP 8.0 to 8.3
   make mysql          # Install MySQL Server
   make node           # Install Node.js and PM2
   make nginx          # Install Nginx
   ```

---

## 📚 Available Targets

| Target            | Description                           |
| ----------------- | ------------------------------------- |
| `make all`        | Install all components                |
| `make docker`     | Install Docker & Docker Compose       |
| `make nginx`      | Install Nginx                         |
| `make php`        | Install PHP 8.0 - 8.3 with extensions |
| `make pgsql`      | Install PostgreSQL                    |
| `make pgadmin`    | Install pgAdmin 4                     |
| `make mysql`      | Install MySQL Server                  |
| `make phpmyadmin` | Install phpMyAdmin                    |
| `make node`       | Install Node.js (LTS 18.x) and PM2    |

---

## 🔐 Notes

* After installing Docker, you may need to **log out and back in** to use Docker as non-root.
* The Node.js installation uses the **official NodeSource 18.x LTS** script.
* PM2 is installed globally via `npm`.
* You can customize versions or extensions in the Makefile.

---


## 🧾 License

MIT License

```

---

Jika kamu punya nama repo GitHub untuk mengganti `https://github.com/bellukstudio/setup_vps_shortcut.git`.
```
