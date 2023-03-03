lint:
	@echo " - black" && \
	black -q --check src  && \
	echo " - isort" && \
	isort --check src && \
	echo " - ruff" && \
	ruff src && \
	echo " - mypy" && \
	mypy src && \
	echo " - interrogate" && \
	interrogate -q -c pyproject.toml . && \
	echo "Passed all linting checks!"

reformat:
	@echo " - ruff" && \
	ruff --fix src && \
	echo " - black" && \
	black -q src && \
	echo " - isort" && \
	isort src && \
	echo "Reformatted code!"

build: ./src/plugins/*
	@for file in $^ ; do \
		pushd $${file}  > /dev/null; \
		test -f requirements.txt && PIP_TARGET=deps pip install -r requirements.txt; \
		touch deps/__init__.py; \
		test -f setup.py && python setup.py install bdist_egg --dist-dir=../../../plugins clean --all; \
		popd  > /dev/null; \
	done

run:
	@venv/bin/python src/core/main.py

dev: build run