# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

[de get-sha256 (String Key)
  # works around output diff between openssl 0.9.8 and 1.0.x
  (pipe (out (trim (list 'openssl "dgst" "-sha256" (when Key "-hmac") Key)) (prin String))
        (pack (last (split (chop (line T)) " ") ]

[de get-conf (Setting)
  (cadr (assoc Setting *API_CONFIG)) ]

[de getl-conf (Setting)
  (cdr (assoc Setting *API_CONFIG)) ]

[setq
  *API_PORT     (get-conf "api-port")
  *API_INDEX    (get-conf "api-index")
  *API_ROOT     (get-conf "api-root")
  ]
