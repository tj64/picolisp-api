#!/usr/bin/env pil
#
# PicoLisp REST API (tests)
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

(load (pack (car (file)) "loader.l"))

(load (pack (car (file)) ".modules/picolisp-unit/HEAD/unit.l"))

# Load tests
(chdir (pack (car (file)) "test/")
  (load "test_core.l" "test_http.l" "test_json.l" "test_auth_token.l") )

(prinl "^J  Testing PicoLisp REST API^J")

(report)
