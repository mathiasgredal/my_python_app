# My Python App

This is a simple example on how to have a plugin system with python.

## Getting started:

With python installed you can build all the plugins and run the project with:

```bash
> python3.11 -m venv venv
> source venv/bin/activate # or venv\Scripts\activate on windows
> pip install -e ".[dev]"
> make dev
2023-03-03 02:18:51,685 [INFO] root: Starting program...
2023-03-03 02:18:51,685 [INFO] root: Loading plugins...
2023-03-03 02:18:51,696 [INFO] root: Player plugin, got number from common: 12
```

You can run linting with: `make lint`
