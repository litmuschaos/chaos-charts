# Makefile for building Chaos charts
# Reference Guide - https://www.gnu.org/software/make/manual/make.html

.PHONY: deps
deps:
	@echo "-----Installing dependencies-----"
	sudo apt update
	sudo apt-get install python3
	sudo apt install python3-pip
	pip3 install packaging

.PHONY: versionmaker
versionmaker:
	@echo "-----version maker-----"
	bash ./scripts/version/version_maker.sh

.PHONY: combineExpCR
combineExpCR:
	@echo "--------Combining Experiments CR-------"
	bash ./scripts/combine_all_cr.sh

.PHONY: combineExpCR
combineExpCR:
	@echo "--------Combining Experiments CR-------"
	bash ./scripts/combine_all_cr.sh

.PHONY: push
push:
	@echo "---------git push to master-------"
	bash ./scripts/version/push.sh
