# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

[execute
  '(assert-equal "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08" (get-sha256 "test") "Ensure 'test' is hashed with SHA256")
  '(assert-equal "0329a06b62cd16b33eb6792be8c60b158d89a2ee3a876fce9a881ebb488c0914" (get-sha256 "test" "secret") "Ensure 'test' is HMAC hashed with SHA256")
  '(assert-equal 49888 (get-conf "api-port") "Ensure config entry can be parsed")
  '(assert-equal '(("custom-variables.l")) (getl-conf "app-helpers") "Ensure config list can be parsed")
  '(assert-equal 49888 *API_PORT "Ensure *API_PORT is configured")
  '(assert-equal "index.html" *API_INDEX "Ensure *API_INDEX is configured")
  '(assert-equal "test/www" *API_ROOT "Ensure *API_ROOT is configured")
  ]
