#!/bin/bash
# DXC Bot - Oracle Cloud (Always Free) Deployment
# This script sets up the bot on Oracle Cloud's Always Free Tier VM

set -e

echo "=========================================="
echo "  DXC Bot - Oracle Cloud Setup"
echo "=========================================="
echo ""

# Step 1: Update system
echo "📦 Updating system..."
sudo apt-get update
sudo apt-get upgrade -y

# Step 2: Install dependencies
echo "🔧 Installing system dependencies..."
sudo apt-get install -y \
    python3.11 \
    python3.11-venv \
    python3.11-dev \
    python3-pip \
    git \
    curl \
    wget \
    nano \
    htop

# Step 3: Set Python 3.11 as default
echo "🐍 Setting Python 3.11 as default..."
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
python3 --version

# Step 4: Create bot directory
BOT_DIR="/home/ubuntu/dxc-bot"
echo "📁 Creating bot directory at $BOT_DIR..."
mkdir -p $BOT_DIR
cd $BOT_DIR

# Step 5: Clone or initialize repo (if you have a git repo)
# Uncomment the next line if you have a GitHub repo
# git clone https://github.com/your-username/dxc-bot.git .

# If no git, just create the directory structure
if [ ! -f "main.py" ]; then
    echo "📝 No bot files found. Please upload via SCP or git clone"
    echo "💡 Tip: scp -i your-key.key main.py ubuntu@your-instance-ip:/home/ubuntu/dxc-bot/"
    echo "💡 Tip: scp -i your-key.key -r cogs ubuntu@your-instance-ip:/home/ubuntu/dxc-bot/"
    echo "💡 Tip: scp -i your-key.key -r database ubuntu@your-instance-ip:/home/ubuntu/dxc-bot/"
    echo "💡 Tip: scp -i your-key.key requirements.txt ubuntu@your-instance-ip:/home/ubuntu/dxc-bot/"
    echo "💡 Tip: scp -i your-key.key .env ubuntu@your-instance-ip:/home/ubuntu/dxc-bot/"
fi

# Step 6: Create virtual environment
echo "🔨 Creating Python virtual environment..."
python3.11 -m venv $BOT_DIR/venv
source $BOT_DIR/venv/bin/activate

# Step 7: Install dependencies
echo "📦 Installing Python packages..."
if [ -f "$BOT_DIR/requirements.txt" ]; then
    pip install --upgrade pip setuptools wheel
    pip install -r $BOT_DIR/requirements.txt
    echo "✅ Dependencies installed"
else
    echo "⚠️ requirements.txt not found - you'll need to upload it"
fi

# Step 8: Create/verify .env
if [ ! -f "$BOT_DIR/.env" ]; then
    echo "⚙️ Creating .env file template..."
    cat > "$BOT_DIR/.env" << 'EOF'
DISCORD_TOKEN=your_bot_token_here
ALLOWED_GUILD_ID=your_guild_id_here
DB_PATH=database/bot.db
LAVALINK_URI=http://localhost:2333
LAVALINK_PASSWORD=youshallnotpass
EOF
    echo "⚠️ Please edit .env with your bot credentials!"
    echo "📝 nano /home/ubuntu/dxc-bot/.env"
fi

# Step 9: Create systemd service
echo "🚀 Setting up systemd service..."
sudo tee /etc/systemd/system/dxc-bot.service > /dev/null << EOF
[Unit]
Description=DXC Official Discord Bot
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=ubuntu
WorkingDirectory=$BOT_DIR
Environment="PATH=$BOT_DIR/venv/bin"
ExecStart=$BOT_DIR/venv/bin/python main.py
Restart=always
RestartSec=10
StandardOutput=append:/var/log/dxc-bot.log
StandardError=append:/var/log/dxc-bot.error.log

[Install]
WantedBy=multi-user.target
EOF

# Step 10: Set up logging
echo "📝 Setting up logging..."
sudo mkdir -p /var/log/dxc-bot
sudo touch /var/log/dxc-bot.log /var/log/dxc-bot.error.log
sudo chown ubuntu:ubuntu /var/log/dxc-bot.log /var/log/dxc-bot.error.log
sudo chown ubuntu:ubuntu /var/log/dxc-bot

# Step 11: Enable service
echo "🔄 Enabling systemd service..."
sudo systemctl daemon-reload
sudo systemctl enable dxc-bot.service

echo ""
echo "=========================================="
echo "  ✅ Setup Complete!"
echo "=========================================="
echo ""
echo "📝 Next Steps:"
echo ""
echo "1️⃣  Upload your bot files:"
echo "   scp -i your-key.key main.py ubuntu@YOUR_INSTANCE_IP:/home/ubuntu/dxc-bot/"
echo "   scp -i your-key.key -r cogs ubuntu@YOUR_INSTANCE_IP:/home/ubuntu/dxc-bot/"
echo "   scp -i your-key.key -r database ubuntu@YOUR_INSTANCE_IP:/home/ubuntu/dxc-bot/"
echo "   scp -i your-key.key requirements.txt ubuntu@YOUR_INSTANCE_IP:/home/ubuntu/dxc-bot/"
echo ""
echo "2️⃣  Edit .env with your bot token:"
echo "   nano /home/ubuntu/dxc-bot/.env"
echo ""
echo "3️⃣  Start the bot:"
echo "   sudo systemctl start dxc-bot"
echo ""
echo "4️⃣  Check status:"
echo "   sudo systemctl status dxc-bot"
echo ""
echo "5️⃣  View logs:"
echo "   sudo journalctl -u dxc-bot -n 100 -f"
echo ""
echo "🔗 Useful Commands:"
echo "   Start:    sudo systemctl start dxc-bot"
echo "   Stop:     sudo systemctl stop dxc-bot"
echo "   Restart:  sudo systemctl restart dxc-bot"
echo "   Status:   sudo systemctl status dxc-bot"
echo "   Logs:     sudo journalctl -u dxc-bot -f"
echo ""
echo "💡 Your bot will now:"
echo "   ✅ Auto-start when instance reboots"
echo "   ✅ Auto-restart if it crashes"
echo "   ✅ Stay permanently online 24/7"
echo "   ✅ Run completely free forever"
echo ""
