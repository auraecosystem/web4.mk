PROJECT := Web4

PACKAGE := package.jqi

BUILD := build

all:
	web4 compile $(PACKAGE)
	web4 validate $(PACKAGE)
	web4 generate $(PACKAGE)
	web4 bundle $(BUILD)

clean:
	rm -rf build

test:
	web4 test

deploy:
	web4 deploy production
