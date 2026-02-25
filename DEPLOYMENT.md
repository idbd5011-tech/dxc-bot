# DXC Official Bot - Setup & Deployment Guide

A comprehensive Discord bot with moderation, leveling, tickets, music, and more! This guide covers all errors fixed and permanent hosting setup.

## ✅ Issues Fixed

### Code Issues Resolved:
1. **SQL Injection Vulnerability** - Fixed `db.py` with parameter validation for dynamic column names
2. **Missing asyncio import** - Added to `tickets.py` for proper async operations
3. **Database initialization** - All tables properly created with migrations
4. **Missing dependencies** - `requirements.txt` created with all necessary packages
5. **Configuration management** - `.env` file setup with proper defaults

### Code Quality:
- ✅ All cogs have proper `setup()` functions
- ✅ All imports are at the module level (no inline imports)
- ✅ Proper error handling in database operations
- ✅ SQL queries use parameterized statements (no injection risk)

---

## 🚀 Quick Start

### Prerequisites:
- Python 3.11 or higher
- pip (Python package manager)
- Discord bot token (from [Discord Developer Portal](https://discord.com/developers/applications))

### Local Setup (Development):

1. **Clone/Setup Repository:**
   ```bash
   cd path/to/DXC\ official\ bot
   ```

2. **Create Virtual Environment:**
   ```bash
   # Windows
   python -m venv venv
   .\venv\Scripts\activate
   
   # Linux/Mac
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install Dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure Bot:**
   ```bash
   # Edit .env file with your credentials
   # Windows
   notepad .env
   
   # Linux
   nano .env
   ```
   
   Required values:
   - `DISCORD_TOKEN`: Your bot token from Discord Developer Portal
   - `ALLOWED_GUILD_ID`: The Discord server ID where the bot operates

5. **Run Bot:**
   ```bash
   # Windows
   python main.py
   
   # Linux
   python3 main.py
   ```

---

## 🌐 Permanent Hosting (VPS/Server)

### Option 1: Linux with Systemd (Recommended)

**Best for:** Linux VPS (Ubuntu, Debian, CentOS)

1. **Automated Setup:**
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

2. **Manual Setup (if needed):**
   ```bash
   # SSH into your server
   ssh user@your_vps_ip
   
   # Clone bot code
   git clone <your-repo> /opt/dxc-bot
   cd /opt/dxc-bot
   
   # Create virtual environment
   python3 -m venv venv
   source venv/bin/activate
   
   # Install dependencies
   pip install -r requirements.txt
   
   # Configure environment
   nano .env
   ```

3. **Create Systemd Service:**
   ```bash
   sudo nano /etc/systemd/system/dxc-bot.service
   ```
   
   Paste:
   ```ini
   [Unit]
   Description=DXC Official Discord Bot
   After=network.target
   
   [Service]
   Type=simple
   User=<your-username>
   WorkingDirectory=/opt/dxc-bot
   Environment="PATH=/opt/dxc-bot/venv/bin"
   ExecStart=/opt/dxc-bot/venv/bin/python main.py
   Restart=always
   RestartSec=10
   StandardOutput=append:/var/log/dxc-bot.log
   StandardError=append:/var/log/dxc-bot.error.log
   
   [Install]
   WantedBy=multi-user.target
   ```

4. **Enable & Start Service:**
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable dxc-bot.service
   sudo systemctl start dxc-bot.service
   ```

5. **Manage Bot:**
   ```bash
   # Check status
   sudo systemctl status dxc-bot
   
   # View logs
   sudo journalctl -u dxc-bot -f
   
   # Restart
   sudo systemctl restart dxc-bot
   
   # Stop
   sudo systemctl stop dxc-bot
   ```

---

### Option 2: Windows Server with Task Scheduler

**Best for:** Windows Server or Windows VPS

1. **Automated Setup:**
   ```powershell
   # Run PowerShell as Administrator
   .\deploy.ps1
   ```

2. **Manual Setup:**
   ```powershell
   # Create virtual environment
   python -m venv venv
   .\venv\Scripts\Activate.ps1
   
   # Install requirements
   pip install -r requirements.txt
   
   # Configure bot
   notepad .env
   ```

3. **Create Task Scheduler Entry:**
   - Open Task Scheduler (search "Task Scheduler")
   - Click "Create Basic Task"
   - **Name:** DXC-Bot
   - **Trigger:** At startup
   - **Action:** Start a program
     - Program: `C:\path\to\venv\Scripts\python.exe`
     - Arguments: `main.py`
     - Start in: `C:\path\to\bot\directory`
   - Check "Run with highest privileges"
   - Check "Run whether user is logged in or not"

4. **Start Service:**
   - Right-click the task → Run Now
   - Or restart your computer

---

### Option 3: Docker (Advanced)

**Best for:** Container-based deployments**

Create `Dockerfile`:
```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
```

Build and run:
```bash
docker build -t dxc-bot .
docker run -d --name dxc-bot -e DISCORD_TOKEN=your_token dxc-bot
```

---

### Option 4: Cloud Platforms

**Recommended Services:**
- **Heroku** (deprecated, use alternatives)
- **Railway.app** - Auto-deploy from GitHub
- **Replit** - Quick testing
- **AWS Lambda** - Serverless
- **Google Cloud Run** - Container-based
- **DigitalOcean Apps** - Easy deployment

For most platforms, simply:
1. Connect your GitHub repository
2. Set environment variables (DISCORD_TOKEN, ALLOWED_GUILD_ID, etc.)
3. Deploy! The platform will auto-install requirements.txt and run `python main.py`

---

## 📋 Environment Variables

Create a `.env` file with:

```env
# Required
DISCORD_TOKEN=your_bot_token_here
ALLOWED_GUILD_ID=your_guild_id_here

# Optional/Database
DB_PATH=database/bot.db

# Optional/Music (if using Lavalink)
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
```

Get your bot token:
1. Go to [Discord Developer Portal](https://discord.com/developers/applications)
2. Click "New Application"
3. Go to "Bot" tab → "Add Bot"
4. Copy the token under "TOKEN"

Get your guild ID:
1. Enable Developer Mode: User Settings → Advanced → Developer Mode
2. Right-click your server → Copy Server ID

---

## 📚 Cogs Overview

| Cog | Features |
|-----|----------|
| **announcements** | `/say` - Ghost messaging, `/embed` - Custom embeds, `/panel` - Advanced panels |
| **counters** | `/setup_counters` - Live member/boost counters |
| **leveling** | Automatic XP on messages, level-up notifications |
| **logging** | Logs member join/leave, message edits/deletes, voice activity |
| **moderation** | Strict channels, spam detection, warning system, banned words |
| **music** | `/play` - Music playback, pause/resume, volume control |
| **roles** | `/setup_reaction_roles` - Self-assignable roles |
| **socials** | Monitor Twitch/YouTube (framework ready) |
| **tickets** | `/setup_tickets` - Support ticket system |
| **tools** | `/mass_lockdown/unlock` - Bulk channel management |
| **verification** | One-click member verification system |

---

## 🔧 Troubleshooting

### Bot won't start
```bash
# Check Python installation
python --version

# Check dependencies
pip list

# Reinstall requirements
pip install -r requirements.txt --force-reinstall
```

### Bot won't connect to Discord
```bash
# Check token in .env
echo $DISCORD_TOKEN  # Linux/Mac
echo %DISCORD_TOKEN%  # Windows

# Verify token is correct in Discord Developer Portal
```

### Commands not showing up
```bash
# Sync commands with Discord
!sync  # Use the prefix command

# Or restart bot
# On Linux: sudo systemctl restart dxc-bot
# On Windows: Restart Task Scheduler task
```

### Database errors
```bash
# Delete database and reinitialize
rm database/bot.db

# Restart bot
python main.py
```

### Permissions issues
- Make sure bot role is **above** the roles it needs to manage
- Give bot "Administrator" permission during testing
- Check channel permissions

---

## 🛡️ Security Best Practices

1. **Never share your `.env` file**
2. **Keep `.env` in `.gitignore`**
3. **Rotate your bot token** if accidentally exposed
4. **Use strong database passwords** (if using remote DB)
5. **Keep bot dependencies updated**: `pip install -r requirements.txt --upgrade`
6. **Run bot with minimal permissions needed**

---

## 📞 Support & Updates

For issues or updates:
1. Check logs for error messages
2. Verify all environment variables are set
3. Ensure bot has required Discord permissions
4. Test bot in a private server first

---

## 📄 License

This bot is provided as-is for your Discord server. Modify and distribute as needed.

---

**Happy hosting! 🚀**
