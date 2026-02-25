# ⚡ JUST DEPLOY (No Reading Required)

## 🎯 Pick ONE Option Below

---

## ✅ OPTION A: Railway.app (RECOMMENDED)

### Copy-Paste These Commands

**Open PowerShell in: `c:\DXC official bot`**

```powershell
git config --global user.name "Bot"
git config --global user.email "bot@example.com"
git init
git add .
git commit -m "bot"
```

**Then go to:** https://github.com/new
1. Name: `dxc-bot`
2. Click "Public"
3. Create
4. Copy the HTTPS URL

**Paste this in PowerShell (replace the URL):**

```powershell
git remote add origin https://github.com/your-github-username/dxc-bot.git
git branch -M main
git push -u origin main
```

Wait for it to finish → ✅ Code is on GitHub

**Now go to:** https://railway.app
1. Click `New Project`
2. Click `Deploy from GitHub repo`
3. Authorize GitHub
4. Select `dxc-bot`
5. Click `Deploy`

Wait 2-5 minutes for it to finish

**Then add these 5 variables:**
- `DISCORD_TOKEN` = your bot token (from Discord Developer Portal)
- `ALLOWED_GUILD_ID` = your server ID (right-click server in Discord)
- `DB_PATH` = `database/bot.db`
- `LAVALINK_URI` = `http://localhost:2333`
- `LAVALINK_PASSWORD` = `youshallnotpass`

**Save → Done! ✅** Your bot is online now!

---

## ⚡ OPTION B: Replit (NO GITHUB)

**Go to:** https://replit.com

1. Click "Create Repl"
2. Language: Python 3
3. Name: dxc-bot
4. Click "Create"

**Upload these files:**
- Click "Upload file" → select `main.py`
- Click "Upload file" → select `requirements.txt`
- Click "Add folder" → name: `cogs`
  - Upload all files from your `cogs/` folder
- Click "Add folder" → name: `database`
  - Upload `db.py`

**Create `.env` file:**
- Click "Add file"
- Name: `.env`
- Paste:
```
DISCORD_TOKEN=your_bot_token_here
ALLOWED_GUILD_ID=your_server_id_here
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
```

**In Terminal (bottom):**
```bash
pip install -r requirements.txt
python main.py
```

**Done! ✅** Your bot is running!

---

## 🆓 OPTION C: Oracle Cloud (FREE FOREVER)

**Go to:** https://www.oracle.com/cloud/free/

1. Click "Start for free"
2. Sign up (email, password, card - won't be charged)
3. Create Ubuntu instance (free tier)
4. Download SSH key
5. SSH into your instance
6. Run this command:

```bash
mkdir -p /home/ubuntu/dxc-bot && cd /home/ubuntu/dxc-bot
```

7. Upload your bot files using SCP:

```powershell
scp -i your-key.key main.py ubuntu@YOUR_IP:/home/ubuntu/dxc-bot/
scp -i your-key.key requirements.txt ubuntu@YOUR_IP:/home/ubuntu/dxc-bot/
scp -i your-key.key -r cogs ubuntu@YOUR_IP:/home/ubuntu/dxc-bot/
scp -i your-key.key -r database ubuntu@YOUR_IP:/home/ubuntu/dxc-bot/
```

8. SSH back in and run:

```bash
python3 -m venv /home/ubuntu/dxc-bot/venv
source /home/ubuntu/dxc-bot/venv/bin/activate
pip install -r /home/ubuntu/dxc-bot/requirements.txt
```

9. Create systemd service (copy-paste this entire block):

```bash
sudo tee /etc/systemd/system/dxc-bot.service > /dev/null << 'EOF'
[Unit]
Description=DXC Bot
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
EOF

sudo systemctl daemon-reload
sudo systemctl enable dxc-bot
sudo systemctl start dxc-bot
```

**Done! ✅** Your bot runs forever on free tier!

---

## ✨ What You Need

Before starting ANY option:

1. **Discord Bot Token** (regenerated)
   - https://discord.com/developers/applications
   - Click your app → Bot → Reset Token → Copy

2. **Discord Server ID**
   - Discord Settings → Advanced → Developer Mode ON
   - Right-click server → Copy Server ID

3. **GitHub Account** (for Railway only)
   - https://github.com/signup (free)

---

## ✅ After Deployment

Your bot should:
- Appear **Online** in your Discord server
- Be ready for commands
- Run 24/7 automatically

Test it:
```
/say hello
```

If it works → **You're done!** 🎉

---

## 🆘 Quick Fixes

**Bot won't start:**
1. Check token is correct
2. Check server ID is correct
3. Check logs for errors

**Can't find logs:**
- Railway: Dashboard → Deployments → View logs
- Replit: Bottom panel
- Oracle: `journalctl -u dxc-bot -f`

**Need to update code:**
- Railway: `git push origin main` → auto-redeploys
- Replit: Edit and re-run
- Oracle: Upload new files + restart service

---

## 💬 Pick ONE and Go

- **Railway** (recommended) - 10 min
- **Replit** (no GitHub) - 5 min
- **Oracle** (free forever) - 30 min

Then come back here if you need help!

---

**Your bot will be live 24/7 in minutes!** 🚀
