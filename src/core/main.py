"""The main entrypoint for the program."""
import importlib
import logging
import os
import pkgutil
import sys
from pathlib import Path

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(name)s: %(message)s")

logging.info("Starting program...")


def list_file_paths(directory: str) -> list[str]:
    """Return a list with the absolute paths for every file in the given directory."""
    path = Path(directory).resolve()
    return [entry.path for entry in os.scandir(path) if entry.is_file()]


def load_plugins() -> None:
    """Load all the plugins in the plugin folder."""
    logging.info("Loading plugins...")
    for filename in list_file_paths("plugins"):
        if filename.endswith(".egg"):
            sys.path.append(filename)
            for _, modname, _ in pkgutil.iter_modules([filename]):
                importlib.import_module(modname)
            continue


if __name__ == "__main__":
    load_plugins()
