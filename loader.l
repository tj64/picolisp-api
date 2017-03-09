# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

(while  (opt)
        (case @
              (--config (load (opt))) ) )

(unless *API_CONFIG (out 2 (prinl "Missing --config <config.l>")) (bye 65))

# Load module info
(load "module.l")

# Load helpers
(load "helpers/core.l" "helpers/http.l" "helpers/json.l")

# Initial setup
(allowed `(api-http-allowed))
(allow *API_INDEX)

(mime "md" "text/markdown; charset=UTF-8" 60)

(if (== 64 64)
    (api-json-load-64bit)
    (api-json-load-32bit) )

# Load auth
(when (get-conf "auth-type")
  (load (pack "auth/" @ ".l")) )

# Load app
(mapcar '((N) (load (pack *API_ROOT "/" (; N 1)))) (getl-conf "app-helpers"))
