# EcoLinux IPTV Bootstrap Script

A lightweight Linux-based IPTV provisioning utility that installs media playback dependencies and starts a FastAPI service for basic control and status reporting.

This micro-project is designed for embedded systems and firmware environments like EcoLinux where IPTV clients may need to be auto-configured with systemd and minimal CLI interaction.

## Project Goals

- Automate installation of IPTV playback tools (e.g., `ffmpeg`, `vlc`)
- Start FastAPI service to expose `/` and `/status` endpoints
- Provide systemd service file for boot-time IPTV start
- Demonstrate real-world shell + Python automation in Linux-based systems

## 🗂 Project Structure

ecolinux-iptv-bootstrap/
├── app/                                # Python FastAPI app logic
│   ├── __init__.py
│   └── main.py                         # Your FastAPI app
│
├── scripts/                            # Shell automation scripts
│   └── install.sh
│
├── services/                           # OS-level or background services
│   └── iptv.service                    # systemd unit file
│
├── test_data/                          # Optional test IPTV playlist
│   └── playlist.m3u8
│
├── docs/                               # Documentation and visual artifacts
│   └── screenshot_terminal_output.png
│
├── .gitignore
├── LICENSE
├── README.md
├── requirements.txt                    # Add this for pip-based installs (optional)
└── run_dev.sh                          # Optional helper to run uvicorn locally


---

##  Usage Instructions

### 1. Clone and Run Installer

```bash
git clone https://github.com/izharhaq1987/ecolinux-iptv-bootstrap.git
cd ecolinux-iptv-bootstrap
chmod +x install.sh
sudo ./install.sh
**Start FastAPI Server (Dev Mode)**
source ~/env/bin/activate
uvicorn main:app --reload

**Visit:**

http://127.0.0.1:8000/

http://127.0.0.1:8000/status

http://127.0.0.1:8000/docs – Swagger UI

**Tech Stack**
Bash (Allman style scripting)

FastAPI (Python 3.12)

ffmpeg / VLC

systemd

EcoLinux-compatible setup


Maintained by
**Izhar Haq**
Senior Embedded & Software Engineer
https://github.com/izharhaq1987




