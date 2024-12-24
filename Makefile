.PHONY: all init run logs test cov

all: help

help: Makefile
	@sed -n 's/^##//p' $< | cat

init:
	@rm -rf .venv poetry.lock && python3 -m venv .venv && . .venv/bin/activate && pip install poetry && poetry lock --no-update && poetry install

run:
	@ . .venv/bin/activate && poetry run uvicorn main:app --reload

test:
	@ . .venv/bin/activate && poetry run pytest $(FILE) -vvv

cov:
	@ . .venv/bin/activate && poetry run coverage run -m pytest && poetry run coverage report -m && poetry run coverage html
