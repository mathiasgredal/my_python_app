"""The setuptools configuration."""
from setuptools import setup

# NOTE: We only need to include the name here
setup(
    name="enemy_plugin",
    version="1.0.0",
    url="https://github.com/mypackage.git",
    author="Author Name",
    author_email="author@gmail.com",
    description="Description of my package",
    package_dir={"enemy_plugin": "src", "enemy_plugin.deps": "deps"},
    install_requires=["my_python_app"],
)
