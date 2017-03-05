# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

[de validate-hash (Hash)
  (let (Path      (pack *APP_DATA "/api.token")
        Token     (when (num? (car (info Path))) (in Path (line T)))
        Tokenhash (when Token (get-sha256 Token))
        Hmac      (when Tokenhash (get-sha256 (pack (get-http-method) "/" (get-http-url)) Tokenhash)) )

    (when Hmac (= Hash Hmac)) ]

[de validate-token (Token)
  (let Path (pack *APP_DATA "/api.token")
    (when (and Token (num? (car (info Path))))
      (= Token (in Path (line T) ]

[de validate-auth ()
  (let (Hash  (get 'hash 'http)
        Token (get 'token 'http) )
    (if Hash
        (validate-hash Hash)
        (validate-token Token) ]

# returns 403 if authentication failed
# returns 400 if "GET" and "POST" methods are reversed
# returns NIL otherwise
(de check-auth-request (Method)
  (if (validate-auth)
      (case Method
        ("GET"  (when   *Post (http-msg 400 "Invalid authentication method. Expected GET") (bye)))
        ("POST" (unless *Post (http-msg 400 "Invalid authentication method. Expected POST") (bye))) )
      (http-msg 403 "Authentication error")
      (bye) ) )

(setq *APP_DATA (get-conf "app-data"))
