# 🎯 Deploy in 5 Minutes - TL;DR

## YOUR BOT IS READY TO DEPLOY

You have 3 free options:

### 🥇 PICK ONE:

1. **Railway.app** (10 min) - Best balance
2. **Replit** (5 min) - Fastest, no GitHub needed  
3. **Oracle Cloud** (30 min) - Free forever, most powerful

---

## ⚡ FASTEST PATH: Replit (5 minutes)

### Step 1: Get Your Credentials
- **Bot Token**: https://discord.com/developers/applications → Bot → Reset Token → Copy
- **Server ID**: Discord Settings → Developer Mode ON → Right-click server → Copy Server ID

### Step 2: Go to Replit
- Visit: https://replit.com
- Create new Repl
- Choose Python 3
- Name it: `dxc-bot`

### Step 3: Upload Files
- Upload: `main.py`
- Upload: `requirements.txt`
- Create folder: `cogs` → upload all cog files
- Create folder: `database` → upload `db.py`
- Create file: `.env` → paste below:

```
DISCORD_TOKEN=your_bot_token
ALLOWED_GUILD_ID=your_server_id
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
```

### Step 4: Run
In Replit terminal:
```bash
pip install -r requirements.txt
python main.py
```

✅ **DONE!** Bot is running!

---

## 🚂 EASIEST AUTO-DEPLOY: Railway (10 minutes)

### Step 1: GitHub Setup
- Go to: https://github.com/new
- Name: `dxc-bot` → Public → Create
- Copy the HTTPS URL

### Step 2: Push Your Code
Open PowerShell in your bot folder:
```powershell
git config --global user.name "Bot"
git config --global user.email "bot@example.com"
git init
git add .
git commit -m "bot"
git remote add origin PASTE_YOUR_GITHUB_URL_HERE
git branch -M main
git push -u origin main
```

Replace `PASTE_YOUR_GITHUB_URL_HERE` with your GitHub HTTPS URL

### Step 3: Deploy on Railway
- Visit: https://railway.app
- Click: "New Project"
- Click: "Deploy from GitHub repo"
- Authorize GitHub
- Select: `dxc-bot` repo
- Wait 2-5 minutes

### Step 4: Add Variables
In Railway dashboard → Variables tab → Add:
- `DISCORD_TOKEN` = your bot token
- `ALLOWED_GUILD_ID` = your server ID
- `DB_PATH` = database/bot.db
- `LAVALINK_URI` = http://localhost:2333
- `LAVALINK_PASSWORD` = youshallnotpass

✅ **DONE!** Bot runs 24/7!

---

## 👑 BEST LONG-TERM: Oracle Cloud (Free Forever)

See `JUST_DEPLOY.md` - Option C

---

## ✅ After Deploy

1. Check Discord - bot should be **Online**
2. Try a command: `/say hello`
3. If it works → ✅ **Success!**

---

## 📁 All Files You Need

Everything is in: `c:\DXC official bot\`

- `main.py` - Bot code
- `requirements.txt` - Dependencies
- `cogs/` - All features
- `database/` - Data storage
- `.env` - Your configuration

---

## 🎊 Your Bot Will:

✅ Run 24/7 continuously
✅ Auto-restart if crashes
✅ Handle all Discord commands
✅ Store data in database
✅ Cost you NOTHING

---

## 🚀 JUST FOLLOW ONE PATH:

**Path 1: Replit** (5 min - copy-paste from JUST_DEPLOY.md Option B)
**Path 2: Railway** (10 min - copy-paste from JUST_DEPLOY.md Option A)
**Path 3: Oracle** (30 min - copy-paste from JUST_DEPLOY.md Option C)

---

**That's it. Pick one and follow the steps. Your bot goes live!** 🎉

Full copy-paste ready code: See **`JUST_DEPLOY.md`**
