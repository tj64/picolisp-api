#!/usr/bin/env pil
#
# PicoLisp REST API (api)
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

(load (pack (car (file)) "loader.l"))

(api-http-start)

(wait)