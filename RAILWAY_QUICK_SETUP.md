# 🚀 Deploy to Railway.app (FREE - EASIEST)

## Why Railway.app?
✅ **Completely FREE** - Free tier included
✅ **Easiest setup** - 10 minutes total
✅ **Auto-deploy** - Push to GitHub → Auto updated
✅ **Always-on 24/7** - Free tier runs continuously
✅ **GitHub integration** - No manual uploads needed

---

## ⚡ Quick Setup (10 minutes)

### Step 1: Push Code to GitHub (3 minutes)

Open PowerShell in your bot folder:

```powershell
cd "c:\DXC official bot"

# Initialize git (if not already done)
git init
git add .
git commit -m "Initial bot commit"

# Create repository on GitHub first, then:
git remote add origin https://github.com/YOUR_USERNAME/dxc-bot.git
git branch -M main
git push -u origin main
```

**Need a GitHub account?** Go to https://github.com/signup (free)

---

### Step 2: Connect Railway to GitHub (2 minutes)

1. Go to https://railway.app
2. Click **"Start a New Project"**
3. Click **"Deploy from GitHub repo"**
4. **Authorize Railway** with your GitHub account
5. **Select your `dxc-bot` repository**
6. Click **"Deploy"**

Railway will:
- ✅ Detect Python project
- ✅ Install requirements.txt automatically
- ✅ Start your bot

---

### Step 3: Set Environment Variables (2 minutes)

In Railway Dashboard:

1. Click your project
2. Go to **Variables** tab
3. Add these variables:

```
DISCORD_TOKEN=your_new_regenerated_token_here
ALLOWED_GUILD_ID=your_server_id_here
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
```

4. Click **"Save"**

---

### Step 4: Verify Deployment (1 minute)

1. Go to **Deployments** tab
2. Wait for status to show **✅ Success**
3. Check Discord - your bot should be **Online**!

---

## 🎉 Done! Your Bot is Live 24/7

### Cost:
```
$0/month FREE
Free tier: $5 monthly cloud credits
No credit card charges for small bot
```

### What happens now:
✅ Bot runs 24/7 automatically
✅ Auto-restarts if it crashes
✅ Updates automatically when you push to GitHub

---

## 📝 Future Updates

Just push to GitHub and Railway auto-deploys:

```powershell
# Make changes to your bot
# Then:
git add .
git commit -m "Updated bot features"
git push origin main

# Railway automatically detects changes and redeploys!
```

---

## 🆘 Troubleshooting

**Bot won't start?**
→ Check Variables tab - verify DISCORD_TOKEN and ALLOWED_GUILD_ID

**Can't see logs?**
→ Railways dashboard → Deployments → Click deployment → View logs

**Bot goes offline after 30 min?**
→ Your instance might have spun down (paid tier needed)
→ Use Oracle Cloud instead (always free)

---

## 💡 If You Want Different Platform

### Option 2: Replit (Fastest - 5 minutes)
**File:** `QUICK_REPLIT_SETUP.md`
- 5 minute setup
- No GitHub needed
- Good for testing

### Option 3: Oracle Cloud (Best - Free Forever)
**File:** `QUICK_ORACLE_SETUP.md`
- 30 minutes setup
- Truly free forever
- Powerful (12GB RAM, 2 OCPU)
- Production-grade

---

## ✅ Checklist

- [ ] Created GitHub repository
- [ ] Pushed bot code to GitHub
- [ ] Created Railway account
- [ ] Connected GitHub to Railway
- [ ] Set DISCORD_TOKEN env variable
- [ ] Set ALLOWED_GUILD_ID env variable
- [ ] Deployment shows ✅ Success
- [ ] Bot appears Online in Discord

---

**Your bot is now running 24/7 for free!** 🎊
