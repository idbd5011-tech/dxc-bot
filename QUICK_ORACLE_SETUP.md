# Oracle Cloud Always Free - Quick Reference

## 🚀 5-Minute Setup Checklist

### Prerequisites:
- [ ] Gmail/Email address
- [ ] Valid credit card (for verification only, won't be charged)
- [ ] Your bot files (main.py, requirements.txt, cogs/, database/)
- [ ] **NEW** Bot token (regenerated, not the exposed one)
- [ ] Server ID (your Discord guild ID)

---

## Step 1️⃣: Sign Up (2 minutes)
```
https://www.oracle.com/cloud/free/
→ Click "Start for free"
→ Fill email, password, phone
→ Verify via email + SMS
✅ Done - you have Always Free tier
```

---

## Step 2️⃣: Create Instance (2 minutes)
```
Console → Compute → Instances → Create Instance
→ Name: dxc-bot
→ Image: Ubuntu 24.04
→ Shape: Ampere A1 (marked with $$)
→ OCPU: 1, RAM: 6 GB
→ Generate SSH keypair → DOWNLOAD .key file
→ Click Create
✅ Wait 30-60 seconds for instance to start
```

**Get the Public IP** from instance details

---

## Step 3️⃣: Connect & Setup (1 minute)
```bash
# Open PowerShell/Terminal on YOUR computer
ssh -i your-key.key ubuntu@YOUR.IP.ADDRESS

# You're now on the server!
```

---

## Step 4️⃣: Run Setup Script
```bash
# Copy and paste this entire command:

curl -fsSL https://raw.githubusercontent.com/your-repo/oracle-cloud-setup.sh -o setup.sh && chmod +x setup.sh && ./setup.sh
```

Or manually:
```bash
mkdir -p /home/ubuntu/dxc-bot
cd /home/ubuntu/dxc-bot
```

---

## Step 5️⃣: Upload Files
```bash
# From YOUR computer (open new PowerShell):

# Copy each file:
scp -i your-key.key main.py ubuntu@YOUR.IP.ADDRESS:/home/ubuntu/dxc-bot/
scp -i your-key.key requirements.txt ubuntu@YOUR.IP.ADDRESS:/home/ubuntu/dxc-bot/
scp -i your-key.key -r cogs ubuntu@YOUR.IP.ADDRESS:/home/ubuntu/dxc-bot/
scp -i your-key.key -r database ubuntu@YOUR.IP.ADDRESS:/home/ubuntu/dxc-bot/
```

---

## Step 6️⃣: Configure & Start
```bash
# Back in SSH session (on the server):

# Create virtual environment
python3 -m venv /home/ubuntu/dxc-bot/venv
source /home/ubuntu/dxc-bot/venv/bin/activate

# Install dependencies
pip install -r /home/ubuntu/dxc-bot/requirements.txt

# Create .env
cat > /home/ubuntu/dxc-bot/.env << EOF
DISCORD_TOKEN=your_NEW_bot_token_here
ALLOWED_GUILD_ID=your_server_id_here
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
EOF

# Create systemd service
sudo tee /etc/systemd/system/dxc-bot.service > /dev/null << 'SVCEOF'
[Unit]
Description=DXC Official Discord Bot
After=network.target

[Service]
Type=simple
User=ubuntu
WorkingDirectory=/home/ubuntu/dxc-bot
Environment="PATH=/home/ubuntu/dxc-bot/venv/bin"
ExecStart=/home/ubuntu/dxc-bot/venv/bin/python main.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
SVCEOF

# Enable & start
sudo systemctl daemon-reload
sudo systemctl enable dxc-bot
sudo systemctl start dxc-bot

# Check status
sudo systemctl status dxc-bot
```

---

## ✅ Verify Bot is Running

```bash
# Check service status
sudo systemctl status dxc-bot

# View logs
sudo journalctl -u dxc-bot -f

# Check if online in Discord
# Your bot should appear "Online" in your server!
```

---

## 🎉 Done!

Your bot is now:
- ✅ **Running permanently 24/7**
- ✅ **Completely free forever**
- ✅ **Auto-restarts if it crashes**
- ✅ **Auto-starts after reboots**

---

## 📞 Common Commands

```bash
# Check status
sudo systemctl status dxc-bot

# View logs (last 50 lines)
sudo journalctl -u dxc-bot -n 50

# Real-time logs
sudo journalctl -u dxc-bot -f

# Restart
sudo systemctl restart dxc-bot

# Stop
sudo systemctl stop dxc-bot

# Start
sudo systemctl start dxc-bot
```

---

## 🐛 If Bot Won't Start

1. Check logs:
   ```bash
   sudo journalctl -u dxc-bot -n 100
   ```

2. Verify token is correct:
   ```bash
   nano /home/ubuntu/dxc-bot/.env
   ```

3. Check dependencies:
   ```bash
   source /home/ubuntu/dxc-bot/venv/bin/activate
   pip list
   ```

4. Test manually:
   ```bash
   cd /home/ubuntu/dxc-bot
   source venv/bin/activate
   python main.py
   # Press Ctrl+C to stop
   ```

---

## 💡 Tips

- **SSH back anytime:** `ssh -i your-key.key ubuntu@YOUR.IP.ADDRESS`
- **Edit .env:** `nano /home/ubuntu/dxc-bot/.env`
- **Upload more files:** `scp -i your-key.key file.py ubuntu@YOUR.IP.ADDRESS:/home/ubuntu/dxc-bot/`
- **Download from server:** `scp -i your-key.key ubuntu@YOUR.IP.ADDRESS:/home/ubuntu/dxc-bot/database/bot.db ./`

---

**🚀 Your bot will run forever, completely free!**
