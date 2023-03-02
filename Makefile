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
	@ruff src && \
	for file in $^ ; do \
		pushd $${file}  > /dev/null; \
		test -f setup.py && python setup.py bdist_egg --dist-dir=../../../plugins clean --all > /dev/null 2> /dev/null; \
		popd  > /dev/null; \
	done

run:
	@venv/bin/python src/core/main.py

dev: build run