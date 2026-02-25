# 🚀 Railway.app - Step by Step (10 minutes)

## Prerequisites
✅ Discord bot token (regenerated)
✅ Server ID (your guild ID)
✅ GitHub account (free at https://github.com)

---

## Step 1: Create GitHub Repository (2 min)

### On GitHub.com:
1. Click **"+"** (top right) → **"New repository"**
2. Name: `dxc-bot`
3. Description: `Discord Bot`
4. Select **"Public"** (free option)
5. Click **"Create repository"**
6. Copy the HTTPS URL you see

---

## Step 2: Push Code to GitHub (2 min)

### Open PowerShell in your bot folder:

```powershell
cd "c:\DXC official bot"

# First time only - configure git
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

# Initialize repository
git init
git add .
git commit -m "Initial commit"

# Add remote (replace with your repo URL from Step 1)
git remote add origin https://github.com/YOUR_USERNAME/dxc-bot.git
git branch -M main
git push -u origin main
```

You'll see:
```
Enumerating objects: 50, done.
Sending objects: 100%
To https://github.com/YOUR_USERNAME/dxc-bot.git
 * [new branch]      main -> main
```

✅ Your code is on GitHub!

---

## Step 3: Connect Railway to GitHub (3 min)

### 1. Go to https://railway.app
### 2. Click **"Start a New Project"**
### 3. Click **"Deploy from GitHub repo"**
### 4. If first time:
   - Click **"Authorize with GitHub"**
   - Follow prompts
   - Authorize Railway app

### 5. Select your repo:
   - Repository dropdown
   - Choose **"dxc-bot"**
   - Click **"Deploy"**

**Railway will automatically:**
- ✅ Detect Python
- ✅ Run `pip install -r requirements.txt`
- ✅ Run `python main.py`

---

## Step 4: Add Your Bot Token (2 min)

### In Railway Dashboard:

1. Click your project name (**dxc-bot**)
2. Click the **Variables** tab (middle tab)
3. Add each variable:

| Key | Value |
|-----|-------|
| `DISCORD_TOKEN` | Your regenerated Discord token |
| `ALLOWED_GUILD_ID` | Your Discord server ID |
| `DB_PATH` | `database/bot.db` |
| `LAVALINK_URI` | `http://localhost:2333` |
| `LAVALINK_PASSWORD` | `youshallnotpass` |

4. Click **"Save"** button

**Where to get these:**
- **DISCORD_TOKEN:** https://discord.com/developers/applications → Bot → Token
- **ALLOWED_GUILD_ID:** Discord Server → Right-click → Copy Server ID

---

## Step 5: Watch It Deploy (1 min)

### Go to **Deployments** tab:
- Watch the status
- Wait for **✅ Success** (green checkmark)
- This takes ~2-5 minutes

**In your Discord server:**
- Your bot should now be **Online**!
- Try a command: `/say hello`

---

## ✅ Done! Bot is Live! 🎉

Your bot now:
- ✅ Runs 24/7
- ✅ Auto-restarts if crashes
- ✅ Updates when you push to GitHub
- ✅ Costs **$0/month**

---

## 📝 How to Update Your Bot

Anytime you want to change code:

```powershell
cd "c:\DXC official bot"

# Make your changes...
# Then:
git add .
git commit -m "Updated features"
git push origin main

# Railway automatically redeploys within 1-2 minutes!
```

---

## 🆘 Troubleshooting

### Bot won't start
**Check:**
1. Variables tab - is DISCORD_TOKEN set correctly?
2. Regenerated your token? (Old one was exposed)
3. Deployments tab - any error messages?

### Bot goes offline
**Check:**
1. Free tier has limits - consider upgrading to paid ($5/month)
2. Or use Oracle Cloud instead (truly free)

### View detailed logs
1. Click **Deployments**
2. Click the latest deployment
3. Scroll down for error messages

### Push to GitHub but Railway didn't update
1. Wait 1-2 minutes
2. Click your project
3. Check Deployments tab
4. Should see new deployment starting

---

## 💡 Want to Use Different Platform?

- **Replit:** See `REPLIT_QUICK_SETUP.md` (5 min, no GitHub)
- **Oracle Cloud:** See `QUICK_ORACLE_SETUP.md` (30 min, free forever)
- **All options:** See `HOST_FOR_FREE.md`

---

## ✨ Railroad Success Tips

1. **Keep .env in .gitignore** (don't commit secrets)
   ```
   # Check: does your .gitignore have this?
   .env
   ```

2. **Test locally first**
   ```powershell
   python validate_setup.py
   run_bot.bat
   ```

3. **Check logs often**
   - Railway Dashboard → Deployments → View logs

4. **Update token immediately**
   - Old token was exposed
   - Use only new regenerated token

---

## 📊 Your Bot on Railway

```
Project Name: dxc-bot
Deployment Region: US-East (default)
Status: Active
Cost: FREE ($5 monthly credit)
Uptime: 24/7
Auto-restart: Yes
```

---

## 🎊 Congratulations!

Your Discord bot is now hosting on **Railway** completely free and running 24/7!

**Next:** Test commands in your Discord server! 🎉
