hello:
	echo " This is my first make command"

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt


test:
	python -m pytest -vv test_adder.py &&\
		test_hello.py
all:
	hello install 