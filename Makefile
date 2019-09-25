# Makefile for building Chaos Exporter
# Reference Guide - https://www.gnu.org/software/make/manual/make.html

.PHONY: versionmaker
versionmaker:
	@echo "version maker"
	# dependency to run gem pkg manger
	sudo apt-get install rubygems
	bash ./scripts/version_maker.sh

.PHONY: push
push:
	@echo "---------git push to master-------"
	bash ./scripts/push.sh