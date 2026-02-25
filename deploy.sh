#!/bin/bash

# DXC Official Bot - Production Deployment Script
# This script sets up the bot for permanent hosting on Linux/VPS

set -e

echo "=== DXC Bot Deployment Setup ==="

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "❌ This script is for Linux. For Windows, use deploy.ps1"
    exit 1
fi

# Step 1: Update system
echo "📦 Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Step 2: Install Python and dependencies
echo "🐍 Installing Python 3.11..."
sudo apt-get install -y python3.11 python3.11-venv python3.11-dev python3-pip
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

# Step 3: Install git (if not present)
echo "🔧 Installing git..."
sudo apt-get install -y git

# Step 4: Create bot directory
BOT_DIR="/opt/dxc-bot"
echo "📁 Creating bot directory at $BOT_DIR..."
sudo mkdir -p $BOT_DIR
sudo chown $USER:$USER $BOT_DIR

# Step 5: Clone or setup
if [ ! -d "$BOT_DIR/.git" ]; then
    echo "📂 Initializing git repository..."
    cd $BOT_DIR
    git init
else
    cd $BOT_DIR
fi

# Step 6: Create Python virtual environment
echo "🔨 Creating Python virtual environment..."
python3.11 -m venv $BOT_DIR/venv
source $BOT_DIR/venv/bin/activate

# Step 7: Install Python dependencies
echo "📦 Installing Python packages..."
pip install --upgrade pip setuptools wheel
pip install -r $BOT_DIR/requirements.txt

# Step 8: Create .env file if not exists
if [ ! -f "$BOT_DIR/.env" ]; then
    echo "⚙️ Creating .env file..."
    cp "$BOT_DIR/.env.template" "$BOT_DIR/.env" 2>/dev/null || (
        cat > "$BOT_DIR/.env" << 'EOF'
DISCORD_TOKEN=your_bot_token_here
ALLOWED_GUILD_ID=your_guild_id_here
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
EOF
    )
    echo "⚠️ Please edit $BOT_DIR/.env with your bot credentials!"
fi

# Step 9: Create systemd service file
echo "🚀 Setting up systemd service..."
sudo tee /etc/systemd/system/dxc-bot.service > /dev/null << EOF
[Unit]
Description=DXC Official Discord Bot
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$BOT_DIR
Environment="PATH=$BOT_DIR/venv/bin"
ExecStart=$BOT_DIR/venv/bin/python main.py
Restart=always
RestartSec=10

# Logging
StandardOutput=append:/var/log/dxc-bot.log
StandardError=append:/var/log/dxc-bot.error.log

[Install]
WantedBy=multi-user.target
EOF

# Create log directory
sudo mkdir -p /var/log/dxc-bot
sudo touch /var/log/dxc-bot.log /var/log/dxc-bot.error.log
sudo chown $USER:$USER /var/log/dxc-bot.log /var/log/dxc-bot.error.log

# Step 10: Reload systemd
echo "🔄 Reloading systemd daemon..."
sudo systemctl daemon-reload

# Step 11: Enable and start the service
echo "✅ Enabling DXC Bot service..."
sudo systemctl enable dxc-bot.service

echo ""
echo "=== Setup Complete! ==="
echo ""
echo "Next steps:"
echo "1. Edit your bot token: nano $BOT_DIR/.env"
echo "2. Start the bot: sudo systemctl start dxc-bot"
echo "3. Check status: sudo systemctl status dxc-bot"
echo "4. View logs: sudo journalctl -u dxc-bot -f"
echo ""
echo "Useful commands:"
echo "  Start bot:   sudo systemctl start dxc-bot"
echo "  Stop bot:    sudo systemctl stop dxc-bot"
echo "  Restart bot: sudo systemctl restart dxc-bot"
echo "  View logs:   sudo journalctl -u dxc-bot -n 100 -f"
echo "  Bot status:  sudo systemctl status dxc-bot"
echo ""
