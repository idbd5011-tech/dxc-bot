#!/usr/bin/env python3
"""
DXC Bot - Setup Validation Script
Verifies all requirements and configurations are correct
"""

import os
import sys
import json

def print_header(text):
    print(f"\n{'='*60}")
    print(f"  {text}")
    print(f"{'='*60}\n")

def check_python_version():
    """Check Python version"""
    print("🐍 Checking Python version...")
    version = sys.version_info
    if version.major >= 3 and version.minor >= 9:
        print(f"✅ Python {version.major}.{version.minor}.{version.micro} OK")
        return True
    else:
        print(f"❌ Python 3.9+ required (found {version.major}.{version.minor})")
        return False

def check_env_file():
    """Check if .env exists and has required values"""
    print("📋 Checking .env file...")
    if not os.path.exists('.env'):
        print("❌ .env file not found")
        return False
    
    required_vars = ['DISCORD_TOKEN', 'ALLOWED_GUILD_ID']
    missing = []
    
    with open('.env', 'r') as f:
        content = f.read()
        for var in required_vars:
            if var not in content:
                missing.append(var)
            elif f"{var}=your_" in content or f"{var}=paste_" in content:
                missing.append(var)
    
    if missing:
        print(f"❌ Missing or unconfigured: {', '.join(missing)}")
        return False
    
    print("✅ .env file configured")
    return True

def check_dependencies():
    """Check if all dependencies are installed"""
    print("📦 Checking Python dependencies...")
    required_modules = ['discord', 'dotenv', 'aiosqlite', 'wavelink', 'aiohttp']
    missing = []
    
    for module in required_modules:
        try:
            __import__(module)
        except ImportError:
            missing.append(module)
    
    if missing:
        print(f"❌ Missing packages: {', '.join(missing)}")
        print("   Run: pip install -r requirements.txt")
        return False
    
    print("✅ All dependencies installed")
    return True

def check_file_structure():
    """Check if all required files exist"""
    print("📁 Checking file structure...")
    required_files = [
        'main.py',
        'requirements.txt',
        '.env',
        'database/db.py',
        'cogs/announcements.py',
        'cogs/counters.py',
        'cogs/leveling.py',
        'cogs/logging.py',
        'cogs/moderation.py',
        'cogs/music.py',
        'cogs/roles.py',
        'cogs/socials.py',
        'cogs/tickets.py',
        'cogs/tools.py',
        'cogs/verification.py',
    ]
    
    missing = []
    for file in required_files:
        if not os.path.exists(file):
            missing.append(file)
    
    if missing:
        print(f"❌ Missing files: {', '.join(missing)}")
        return False
    
    print("✅ All required files present")
    return True

def check_cog_setup_functions():
    """Verify all cogs have setup() functions"""
    print("🔧 Checking cog setup functions...")
    cog_files = [
        'cogs/announcements.py',
        'cogs/counters.py',
        'cogs/leveling.py',
        'cogs/logging.py',
        'cogs/moderation.py',
        'cogs/music.py',
        'cogs/roles.py',
        'cogs/socials.py',
        'cogs/tickets.py',
        'cogs/tools.py',
        'cogs/verification.py',
    ]
    
    missing_setup = []
    for cog_file in cog_files:
        with open(cog_file, 'r', encoding='utf-8') as f:
            if 'async def setup(bot)' not in f.read():
                missing_setup.append(os.path.basename(cog_file))
    
    if missing_setup:
        print(f"❌ Missing setup() functions in: {', '.join(missing_setup)}")
        return False
    
    print("✅ All cogs have setup() functions")
    return True

def check_database():
    """Check if database directory exists"""
    print("💾 Checking database setup...")
    if not os.path.exists('database'):
        os.makedirs('database')
        print("✅ Database directory created")
        return True
    
    print("✅ Database directory exists")
    return True

def check_imports():
    """Verify critical imports work"""
    print("🔌 Checking imports...")
    try:
        import discord
        import dotenv
        import aiosqlite
        print("✅ All critical imports working")
        return True
    except ImportError as e:
        print(f"❌ Import error: {e}")
        return False

def run_validation():
    """Run all validation checks"""
    print_header("DXC Bot - Setup Validation")
    
    checks = [
        check_python_version(),
        check_file_structure(),
        check_env_file(),
        check_database(),
        check_imports(),
        check_dependencies(),
        check_cog_setup_functions(),
    ]
    
    print_header("Validation Results")
    
    if all(checks):
        print("✅ All checks passed! Bot is ready to run.")
        print("\nto start the bot:")
        print("  Windows: run_bot.bat")
        print("  Linux:   python3 main.py")
        return 0
    else:
        print("❌ Some checks failed. Please fix the issues above.")
        print("\nVisit README.md for troubleshooting help.")
        return 1

if __name__ == '__main__':
    sys.exit(run_validation())
