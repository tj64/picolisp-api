# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

[de test-validate-token ()
  (use *APP_DATA
    (setq *APP_DATA "data")
    (assert-t (validate-hash "14b64ed452e893199536869623b22a15aeea565daa062b77c69a46c14b6f06fd") "Ensure token hash is validated")
    (assert-t (validate-token "mytoken") "Ensure token string is validated")
    (assert-nil (validate-auth) "Ensure no token or hash returns NIL") ]

[execute
  '(test-validate-token)
  ]
