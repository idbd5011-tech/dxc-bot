# 🔥 Oracle Cloud Always Free - Complete Setup Guide

## Why Oracle Cloud?

✅ **Truly Free Forever** - No credit card required, never expires
✅ **Powerful** - Up to 2 OCPU, 12 GB RAM free
✅ **Always Running** - 24/7 uptime for Discord bot
✅ **No Restrictions** - Perfect for bots, servers, etc.
✅ **Reliable** - Enterprise-grade infrastructure

---

## 📋 Oracle Cloud Always Free Tier Includes

- **2 x Compute Instances** with:
  - Ampere A1 processor (ARM-based, power efficient)
  - 4 OCPU (sharable between 2 instances)
  - Up to 24 GB RAM (sharable between 2 instances)
  - Recommended: 1 instance with 1-2 OCPU + 6 GB RAM
- **200 GB Storage** (Block Storage)
- **10 GB Data Transfer** per month
- **MySQL Database** (optional)
- **25 GB Object Storage**

---

## 🚀 Step 1: Create Oracle Cloud Account

### Sign Up (FREE):
1. Go to https://www.oracle.com/cloud/free/
2. Click **"Start for free"**
3. **Important:** Choose your home region wisely (US, EU, APAC)
   - Pick the one closest to you
   - You can't change it later
4. Fill in details:
   - Email address
   - Password (use strong password!)
   - Country
   - Phone number (for verification)
5. **Enter VALID credit card** (won't be charged for free tier)
6. Complete verification (email + SMS)

### After Signup:
✅ You'll have $300 free trial credits (30 days, don't need it for Always Free)
✅ Always Free tier never expires (separate from trial)
✅ Create your first compute instance

---

## 🖥️ Step 2: Create Compute Instance

### In Oracle Cloud Console:

1. **Navigate to Compute → Instances**
2. **Click "Create Instance"**

### Configuration:

#### Name:
```
dxc-bot
```

#### Image & Shape:
- **Image:** Ubuntu Server 22.04 or 24.04
- **Shape:** Ampere (Always Free eligible)
  - These are marked with a small coin icon $$
  - Select "Ampere A1 Compute"
  - 1-2 OCPU, 6 GB RAM recommended

#### Networking:
- **VCN:** Create new or select existing
- **Subnet:** Create new
- **Public IP address:** Assign (so we can SSH)

#### SSH Key:
```
⭐ IMPORTANT: Download and SAVE your SSH private key
- Click "Generate keypair"
- Download .key file
- NEVER share this file
- You'll need it to connect
```

#### Click "Create"

---

## 🔌 Step 3: Connect to Your Instance

### Get Your IP Address:
1. Instance created → click it
2. Find **"Public IP Address"** (e.g., 129.146.xxx.xxx)

### Connect via SSH (from your computer):

#### **Windows (PowerShell):**
```powershell
# First time, convert SSH key format
plink -keygen your-key.key -O private-openssh -o -c aes256 -o -C 100

# Connect
ssh -i your-key.key ubuntu@129.146.xxx.xxx
```

#### **Mac/Linux:**
```bash
chmod 400 your-key.key
ssh -i your-key.key ubuntu@129.146.xxx.xxx
```

---

## 📥 Step 4: Upload Bot Files

Once connected via SSH, upload your bot files:

```bash
# From your computer (in bot directory):
# Windows PowerShell
scp -i .\your-key.key main.py ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
scp -i .\your-key.key -r cogs ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
scp -i .\your-key.key -r database ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
scp -i .\your-key.key requirements.txt ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
scp -i .\your-key.key .env ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/

# Mac/Linux
scp -i your-key.key main.py ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
scp -i your-key.key -r cogs ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
scp -i your-key.key -r database ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
scp -i your-key.key requirements.txt ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
scp -i your-key.key .env ubuntu@129.146.xxx.xxx:/home/ubuntu/dxc-bot/
```

---

## 🔧 Step 5: Run Setup Script

While SSH'd into your instance:

```bash
# Download setup script
wget https://raw.githubusercontent.com/your-repo/oracle-cloud-setup.sh -O oracle-setup.sh

# Or create it manually
nano oracle-setup.sh
# Paste the contents of oracle-cloud-setup.sh, save (Ctrl+X, Y, Enter)

# Run it
chmod +x oracle-setup.sh
./oracle-setup.sh
```

---

## 📝 Step 6: Configure Bot Token

Edit `.env` with your new bot token (the regenerated one):

```bash
nano /home/ubuntu/dxc-bot/.env
```

Change:
```env
DISCORD_TOKEN=your_new_bot_token_here  # ← Use REGENERATED token!
ALLOWED_GUILD_ID=your_guild_id_here
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
```

Save: `Ctrl+X`, then `Y`, then `Enter`

---

## 🚀 Step 7: Start the Bot

```bash
# Start service
sudo systemctl start dxc-bot

# Verify it's running
sudo systemctl status dxc-bot

# View logs
sudo journalctl -u dxc-bot -f
```

✅ **Bot is now running 24/7 permanently!**

---

## ⚙️ Useful Commands

```bash
# Status
sudo systemctl status dxc-bot

# Check logs (last 100 lines)
sudo journalctl -u dxc-bot -n 100

# Real-time logs
sudo journalctl -u dxc-bot -f

# Restart bot
sudo systemctl restart dxc-bot

# Stop bot
sudo systemctl stop dxc-bot

# Start bot
sudo systemctl start dxc-bot

# Check if bot is enabled on boot
sudo systemctl is-enabled dxc-bot
```

---

## 🔒 Security Setup (Optional but Recommended)

### Enable Firewall:
```bash
sudo apt-get install -y ufw
sudo ufw enable
sudo ufw allow 22/tcp    # SSH
sudo ufw status
```

### Create Non-Root User (Optional):
```bash
sudo useradd -m -s /bin/bash botuser
sudo usermod -aG sudo botuser
# Then switch: su - botuser
```

---

## 📊 Monitor Your Bot

### Check CPU/Memory Usage:
```bash
htop
# Press Q to exit
```

### Check Disk Usage:
```bash
df -h
```

### Check System Logs:
```bash
sudo journalctl -xe | tail -50
```

---

## 🆘 Troubleshooting

### Bot won't start:
```bash
sudo journalctl -u dxc-bot -n 50 --no-pager  # View error logs
```

### Connection refused:
- Make sure security list allows SSH (port 22)
- Check instance is running (green status in console)

### Bot keeps restarting:
```bash
# Check for errors
sudo journalctl -u dxc-bot -f
# Check token in .env is correct
nano /home/ubuntu/dxc-bot/.env
```

### Need to upload files again:
```bash
# From your computer
scp -i your-key.key main.py ubuntu@YOUR_IP:/home/ubuntu/dxc-bot/
```

### Want to add more files:
```bash
# Create folder first
ssh -i your-key.key ubuntu@YOUR_IP "mkdir -p /home/ubuntu/dxc-bot/myfolder"

# Then upload
scp -i your-key.key -r ./myfolder ubuntu@YOUR_IP:/home/ubuntu/dxc-bot/
```

---

## 🔄 Restarting After Instance Reboot

The bot will **automatically restart** because we enabled the systemd service with `enable`. It will:

1. Start automatically when instance boots
2. Auto-restart if it crashes
3. Keep running indefinitely

---

## 💰 Cost Summary

```
Oracle Cloud Always Free Tier:
- Compute Instance: $0/month
- Storage (200GB): $0/month  
- Data Transfer (10GB/mo): $0/month
- Total: $0/month FOREVER
```

No credit card charges, ever!

---

## 📱 Advanced: Using Oracle CLI for Automation

```bash
# Install Oracle CLI
curl -Lo /tmp/oci-linux-x86_64-installer.zip https://github.com/oracle/oci-cli/releases/latest/download/oci-linux-x86_64-installer.zip
unzip /tmp/oci-linux-x86_64-installer.zip -d /tmp
/tmp/oci-cli-v3.*/oci-cli-installer.py

# Configure
oci setup config
```

---

## ✅ Final Checklist

- [ ] Oracle Cloud account created (free)
- [ ] Compute instance created and running
- [ ] SSH key downloaded and saved
- [ ] Connected to instance via SSH
- [ ] Bot files uploaded
- [ ] Setup script executed
- [ ] .env configured with new bot token
- [ ] Bot service started
- [ ] Bot appears online in Discord
- [ ] systemd enabled (auto-start on reboot)

---

## 🎉 You're Done!

Your Discord bot is now:
✅ Running permanently on Oracle Cloud
✅ Completely free (truly, forever)
✅ Auto-starting after reboots
✅ Auto-restarting if crashed
✅ Available 24/7

**Congratulations! 🚀**

---

## 📚 Additional Resources

- **Oracle Cloud Console:** https://cloud.oracle.com
- **Ubuntu Docs:** https://ubuntu.com/server/docs
- **SSH Troubleshooting:** https://docs.oracle.com/en/cloud/compute/compute-classic/gs/index.html

---

**Your bot will run forever, completely free!** 🎊
