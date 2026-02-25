# 🚀 Deploy Your Bot RIGHT NOW (5 Steps)

## ⚠️ FIRST: Do This ONCE

### Step 1: Get Your New Bot Token

1. Open: https://discord.com/developers/applications
2. Click your app name
3. Click **"Bot"** (left sidebar)
4. Click **"Reset Token"** (red button)
5. Click **"Copy"** → Paste somewhere safe (you'll need it!)

### Step 2: Get Your Server ID

1. Open Discord
2. Go to Settings → Advanced → Developer Mode (toggle ON)
3. Right-click your server name
4. Click **"Copy Server ID"** → Save it

**You now have:**
- ✅ Bot Token (new one)
- ✅ Server ID

---

## 🎯 DEPLOY IN 5 MINUTES

### Option A: Railway.app (Recommended)

**Step 1: Create GitHub Account (1 min)**
```
https://github.com/signup
→ Fill email, password
→ Done
```

**Step 2: Create GitHub Repository (1 min)**
```
https://github.com/new
→ Repository name: dxc-bot
→ Public (free)
→ Create repository
→ Copy the HTTPS URL you see
```

**Step 3: Push Your Code (2 min)**

Open PowerShell, paste this:
```powershell
cd "c:\DXC official bot"
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git init
git add .
git commit -m "bot"
git remote add origin PASTE_YOUR_REPO_URL_HERE
git branch -M main
git push -u origin main
```

Replace `PASTE_YOUR_REPO_URL_HERE` with your GitHub repo URL from Step 2.

**Step 4: Deploy on Railway (1 min)**

1. Open: https://railway.app
2. Click **"New Project"**
3. Click **"Deploy from GitHub repo"**
4. Click **"Authorize with GitHub"** → Complete authorization
5. Select your **dxc-bot** repo
6. Click **"Deploy"** and wait ~2 minutes

**Step 5: Add Your Bot Token (1 min)**

In Railway Dashboard:
1. Click your project
2. Click **"Variables"** tab
3. Add these:

| Key | Value |
|-----|-------|
| DISCORD_TOKEN | Your bot token from Step 1 |
| ALLOWED_GUILD_ID | Your server ID from Step 2 |
| DB_PATH | database/bot.db |
| LAVALINK_URI | http://localhost:2333 |
| LAVALINK_PASSWORD | youshallnotpass |

4. Click **"Save"**

**DONE! ✅**

Your bot is now running online 24/7!

---

### Option B: Replit (NO GitHub - 5 minutes)

**Step 1: Go to Replit**
```
https://replit.com
→ Click "Create Repl"
→ Language: Python
→ Name: dxc-bot
→ Click "Create"
```

**Step 2: Upload Files**

In Replit, use Upload button to upload:
- `main.py`
- `requirements.txt`

Then create folder `cogs` and upload all cog files.
Create folder `database` and upload `db.py`.

**Step 3: Create .env**

In Replit:
- Click "Add file"
- Name: `.env`
- Paste:
```
DISCORD_TOKEN=your_bot_token_from_step_1
ALLOWED_GUILD_ID=your_server_id_from_step_2
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
```

**Step 4: Install & Run**

In Replit terminal:
```bash
pip install -r requirements.txt
python main.py
```

**DONE! ✅**

Bot is running! (Free tier - may need $7/month for always-on)

---

## ✅ Verify it Works

Check your Discord server - your bot should be **Online**!

Try a command:
```
/say hello
```

If it works → ✅ **You did it!**

---

## 🎊 Your Bot is Now:

✅ Running 24/7
✅ Completely FREE
✅ Online right now
✅ Handling all Discord commands
✅ Storing data in database

---

## 📞 If Something Goes Wrong

**Bot won't start:**
1. Check token is correct
2. Check server ID is correct
3. Check in Railway/Replit logs for errors

**Can't see logs:**
- Railway: Click Deployments → View logs
- Replit: Bottom panel shows output

**Need to update code:**
```powershell
# Make changes, then:
git add .
git commit -m "updated"
git push origin main
# Railway auto-deploys!
```

---

## 🎉 You're Done!

Your Discord bot is now hosted online, completely free, running 24/7.

No more steps needed!
