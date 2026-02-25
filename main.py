import discord
from discord.ext import commands
import os
from dotenv import load_dotenv
from database.db import init_db

# Load environment variables
load_dotenv()

class OfficialBot(commands.Bot):
    def __init__(self):
        # We use all intents to ensure member tracking, message content filtering, etc. work properly.
        intents = discord.Intents.all()
        super().__init__(
            command_prefix='!', # Prefix fallback, though we are primarily using Slash Commands
            intents=intents,
            help_command=None    # Custom help command or slash-based help can be added later
        )

    async def setup_hook(self):
        """Called upon bot start before login. Good for loading cogs & syncing tree."""
        # Initialize SQLite database
        await init_db()
        print("Database initialized.")

        # Load all extensions (cogs)
        if os.path.exists('./cogs'):
            for filename in os.listdir('./cogs'):
                if filename.endswith('.py') and not filename.startswith('__'):
                    try:
                        await self.load_extension(f'cogs.{filename[:-3]}')
                        print(f"Loaded {filename}")
                    except Exception as e:
                        print(f"Failed to load extension {filename}: {e}")
        
        # Sync slash commands to Discord
        await self.tree.sync()
        print("Slash commands synced globally.")

    async def on_ready(self):
        print(f'Logged in as {self.user} (ID: {self.user.id})')
        print('------')
        print('Monitoring 24/7...')
        
        print('Monitoring 24/7...')

    async def on_guild_join(self, guild):
        allowed_guild_id_str = os.environ.get('ALLOWED_GUILD_ID')
        
        # If no allowed guild is set, we don't strictly enforce it just in case, but warn
        if not allowed_guild_id_str:
            print(f"Warning: Bot joined {guild.name} but ALLOWED_GUILD_ID is not set in .env")
            return
            
        try:
            allowed_guild_id = int(allowed_guild_id_str)
        except ValueError:
            print("Error: ALLOWED_GUILD_ID in .env must be an integer.")
            return

        if guild.id != allowed_guild_id:
            print(f"Unauthorized guild join detected: {guild.name} ({guild.id}). Leaving immediately.")
            await guild.leave()

if __name__ == '__main__':
    token = os.environ.get('DISCORD_TOKEN')
    if not token or token == 'your_bot_token_here':
        print("Error: Please set a valid DISCORD_TOKEN in the .env file.")
    else:
        bot = OfficialBot()
        bot.run(token)
