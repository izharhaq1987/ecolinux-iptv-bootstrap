from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return { "message": "Hello IPTV on EcoLinux!" }

@app.get("/status")
def check_status():
    return { "status": "running", "uptime": "OK" }

