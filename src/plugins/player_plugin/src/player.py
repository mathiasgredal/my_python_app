"""The enemy plugin."""
import logging

from player_plugin.deps import requests, yaml

logging.info("The player plugin")
logging.info(f"PyYAML version: {yaml.__version__}")
logging.info(f"Requests version: {requests.__version__}")
