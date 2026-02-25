# 🎨 Replit - FASTEST Setup (5 minutes, No GitHub)

## Best For
✅ Quickest deployment
✅ No GitHub account needed
✅ Browser-based IDE
✅ Good for testing

## Prerequisites
- Discord bot token (regenerated)
- Server ID

---

## Step 1: Create Repl (1 min)

### On https://replit.com:
1. Click **"Create Repl"** (or **"+"**)
2. Language: **Python 3.11**
3. Name: `dxc-bot`
4. Click **"Create"**

---

## Step 2: Upload Your Files (2 min)

### In the Replit editor:

**Left sidebar → Upload file:**
1. Upload `main.py`
2. Upload `requirements.txt`

**Create folders:**
1. Click **"Add folder"** → name it `cogs`
2. Upload all files from your `cogs/` folder:
   - `announcements.py`
   - `counters.py`
   - `leveling.py`
   - `logging.py`
   - `moderation.py`
   - `music.py`
   - `roles.py`
   - `socials.py`
   - `tickets.py`
   - `tools.py`
   - `verification.py`

3. Create **"database"** folder
4. Upload `db.py` inside

---

## Step 3: Create .env File (1 min)

### In Replit:
1. Click **"Add file"** button
2. Name: `.env`
3. Paste:
```env
DISCORD_TOKEN=your_regenerated_token_here
ALLOWED_GUILD_ID=your_server_id_here
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
```

---

## Step 4: Install Dependencies (1 min)

### In Terminal (bottom panel):
```bash
pip install -r requirements.txt
```

Wait for installation to complete (shows checkmark ✅)

---

## Step 5: Run Bot (1 min)

### Click the **Run** button (green button, top)

**You should see:**
```
Database initialized.
Loaded announcements
Loaded counters
...
Logged in as YourBot#1234 (ID: 123456789)
Monitoring 24/7...
```

✅ **Bot is running!**

Check Discord - bot should be **Online**!

---

## 💰 Cost & Upgrading

**Free Tier:**
- ✅ Runs when you click "Run"
- ⚠️ Spins down after project is inactive (~30 min)
- **Cost:** Free

**Replit Pro ($7/month):**
- ✅ Always-on (24/7)
- ✅ More compute power
- ✅ Custom domain
- **Cost:** $7/month

---

## 🔄 Keep Bot Always-On (Option 1: Free)

Use a free uptime checker:

1. Go to https://uptimerobot.com
2. Create account (free)
3. Monitor your Replit URL: `https://dxc-bot.replit.dev` (or your URL)
4. Uptime Robot pings your URL every 5 minutes
5. This keeps your Replit from spinning down

**Cost:** Free

---

## 🔄 Keep Bot Always-On (Option 2: Paid)

Upgrade to Replit Pro:

1. Click **Upgrading** (top right)
2. Select **Pro** ($7/month)
3. Pay with credit card
4. Bot runs 24/7 automatically

---

## 📝 Update Your Bot

Every time you want to change code:

1. Edit files in Replit editor
2. Click **Run** button again
3. Bot restarts with changes

---

## 🆘 Troubleshooting

### Bot won't start
**Check:**
1. `.env` has correct `DISCORD_TOKEN`
2. Token is regenerated (old one was exposed)
3. `.env` file exists and readable
4. Terminal shows any error messages?

### View Error Logs
- Bottom panel → see output
- If error occurred, it's shown there

### Need to stop bot
- Click the **Stop** button

### Bot goes offline
- Free tier spins down after 30 min inactivity
- Use Replit Pro ($7/mo) OR Oracle Cloud (free)

---

## 💡 Need More Control?

If Replit feels limited:

### Option: Switch to Railway.app
- Still free
- Better uptime
- More features
- See `RAILWAY_STEP_BY_STEP.md`

### Option: Switch to Oracle Cloud
- Truly free forever
- More powerful (12GB RAM)
- See `QUICK_ORACLE_SETUP.md`

---

## ✨ Replit Tips

1. **Share your bot:**
   - Top right → Share button
   - Get your Replit project URL
   - Can share with friends

2. **Invite bot to your server:**
   - https://discord.com/developers/applications
   - OAuth2 → URL Generator
   - Scopes: `bot` + `applications.commands`
   - Permissions: `Administrator`
   - Copy URL and open in browser

3. **Monitor logs:**
   - Always watch the bottom panel
   - Errors show immediately

4. **Backup your database:**
   - Download `database/bot.db` regularly
   - Right-click file → Download

---

## ✅ You're Live!

Your bot is now:
- ✅ Running on Replit
- ✅ In your Discord server
- ✅ Ready for commands

**Test it:**
```
/say hello
/embed Title Description
```

---

## 🎊 Next Steps

1. Test bot commands in Discord
2. If happy, upgrade to Pro ($7/mo) for always-on
3. Or switch to free forever options (Railway/Oracle)

---

## 💬 Want Always-On for FREE?

Use one of these:
- **Railway.app** (10 min setup) → See `RAILWAY_STEP_BY_STEP.md`
- **Oracle Cloud** (30 min setup) → See `QUICK_ORACLE_SETUP.md`

---

**Your Discord bot is live on Replit!** 🚀
