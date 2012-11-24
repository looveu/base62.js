#!/usr/bin/env make -f

.DEFAULT_GOAL := all

.PHONY: all
all:
	@echo 'Target:'
	@echo
	@echo '  all'
	@echo '    output this message.'
	@echo
	@echo '  clean'
	@echo '    remove installed modules.'
	@echo
	@echo '  lint'
	@echo '    execute Closure Linter. (require gjslint command)'
	@echo
	@echo '  setup, setup-test-env'
	@echo '    install dependency modules with npm and bower.'
	@echo
	@echo '  test'
	@echo '    run test with Mocha.'
	@echo '    the browser, please open ./test/test-base62.html.'

.PHONY: clean
clean:
	$(RM) -r ./node_modules ./components

.PHONY: setup setup-test-env
setup: setup-test-env
setup-test-env:
	npm install
	bower install 'chai#~1.3' 'jquery#~1.8' 'mocha#~1.6'

.PHONY: lint
lint:
	gjslint --strict --nojsdoc base62.js

.PHONY: test
test:
	npm test
