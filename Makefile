hello:
	echo " This is my first make command"

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disabled=R,C, E1120, W0613 hello.py

test:
	python -m pytest -vv test_adder.py &&\
		test_hello.py
all:
	hello install 