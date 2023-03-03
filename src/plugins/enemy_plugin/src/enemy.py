"""The enemy plugin."""
import logging

from enemy_plugin.deps import requests, yaml

logging.info("The enemy plugin")
logging.info(f"PyYAML version: {yaml.__version__}")
logging.info(f"Requests version: {requests.__version__}")
