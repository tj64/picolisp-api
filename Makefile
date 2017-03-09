# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

PIL_MODULE_DIR ?= .modules
REPO_PREFIX ?= https://github.com/aw

## Edit below
JSON_REPO = $(REPO_PREFIX)/picolisp-json.git
JSON_DIR = $(PIL_MODULE_DIR)/picolisp-json/HEAD
JSON_REF ?= v2.0.0
## Edit above

# Unit testing
TEST_REPO = $(REPO_PREFIX)/picolisp-unit.git
TEST_DIR = $(PIL_MODULE_DIR)/picolisp-unit/HEAD
TEST_REF ?= v2.0.0

# Generic
.PHONY: all clean

all: $(JSON_DIR)

$(JSON_DIR):
		mkdir -p $(JSON_DIR) && \
		git clone $(JSON_REPO) $(JSON_DIR) && \
		cd $(JSON_DIR) && \
		git checkout $(JSON_REF) && \
		$(MAKE)

$(TEST_DIR):
		mkdir -p $(TEST_DIR) && \
		git clone $(TEST_REPO) $(TEST_DIR) && \
		cd $(TEST_DIR) && \
		git checkout $(TEST_REF)

check: all $(TEST_DIR) run-tests

run-tests:
		 PIL_NO_NAMESPACES=true ./test.l --config test/config_test.l

clean:
		rm -rf $(JSON_DIR) $(TEST_DIR)
