#  EcoLinux IPTV Bootstrap Script

A lightweight Linux-based IPTV provisioning utility that installs media playback dependencies and starts a FastAPI API server for basic control and health-check functionality.

This project is tailored for embedded Linux firmware (like EcoLinux) where IPTV clients must be deployed via systemd, shell scripts, and web APIs.

HEAD
## Project Goals
I. A new "Running the App (Dev Mode)" section featuring run_dev.sh
II. The Project Structure diagram updated to include app/ and run_dev.sh
III. Clean formatting and Allman-style clarity
IV. Automate installation of IPTV playback tools (e.g., `ffmpeg`, `vlc`)
V. Start FastAPI service to expose `/` and `/status` endpoints
VI. Provide systemd service file for boot-time IPTV start
VII. Demonstrate real-world shell + Python automation in Linux-based systems

##  **Project Structure**

```text
ecolinux-iptv-bootstrap/
├── app/                     # Python FastAPI app logic
│   ├── __init__.py
│   └── main.py              # Your FastAPI app entrypoint
│
├── docs/                    # Documentation and screenshots
│   └── screenshot_terminal_output.png
│
├── scripts/                 # Shell automation scripts
│   └── install.sh
│
├── services/                # OS-level services
│   └── iptv.service
│
├── test_data/               # Sample IPTV playlist
│   └── playlist.m3u8
│
├── .gitignore
├── LICENSE
├── README.md
├── requirements.txt         # Project dependencies
└── run_dev.sh               # Dev launcher script for FastAPI

##  Running the App (Dev Mode)
To launch the FastAPI app in development mode using the helper script:
This script will:
Activate the testenv virtual environment
Validate that uvicorn is installed
Start the app with --reload for live code reloading

If the environment is missing, it will instruct you to run:
python3 -m venv testenv
source testenv/bin/activate
pip install -r requirements.txt

API Endpoints
| Method | Endpoint  | Description                       |
| ------ | --------- | --------------------------------- |
| GET    | `/`       | Returns greeting message          |
| GET    | `/status` | Returns service health and uptime |

Interactive Swagger Docs:
http://127.0.0.1:8000/docs

Systemd Integration
To enable the IPTV service at boot:
sudo cp services/iptv.service /etc/systemd/system/iptv.service
sudo systemctl daemon-reexec
sudo systemctl enable iptv.service
sudo systemctl start iptv.service

Installation Script
Run this to install all dependencies and configure the service:

Test Playlist
Included in test_data/playlist.m3u8:
#EXTM3U
#EXTINF:-1, Sample Channel 1
http://example.com/stream1.ts

#EXTINF:-1, Sample Channel 2
http://example.com/stream2.ts

Screenshot


Tech Stack
Bash (Allman style scripting)
FastAPI (Python 3.12)
ffmpeg / VLC

systemd
EcoLinux-compatible setup

 License
MIT License — free to use, modify, and share.

Maintained by
Izhar Haq
Senior Embedded & Software Engineer
github.com/izharhaq1987
