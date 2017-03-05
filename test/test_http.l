# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

[de test-http-methods ()
  (use *Post
    (setq *Post "POST")
    (assert-equal "POST" (get-http-method) "Ensure *Post is POST") )
  (assert-equal "GET" (get-http-method) "Ensure unset *Post is GET") ]

[de test-url ()
  (use *Url
    (setq *Url "api/v1/default")
    (assert-equal "api/v1" (get-http-url) "Ensure *Url is returned without final segment") ]

[de test-200-ok ()
  (if *CPU
    "{\"Status\":\"200 OK\"}"
    "{\"Status\": \"200 OK\"}" ]

[de test-404-not-found ()
  (if *CPU
    "{\"Status\":\"404 Not Found\",\"Error-Message\":\"Missing test.l\"}"
    "{\"Status\": \"404 Not Found\", \"Error-Message\": \"Missing test.l\"}" ]

[execute
  '(test-http-methods)
  '(test-url)
  '(assert-equal "Not Found" (http-code 404) "Ensure 404 response is given")
  '(assert-equal (test-404-not-found) (out "/dev/null" (http-error 404 "Missing test.l")) "Ensure 404 error response is given")
  '(assert-equal (test-200-ok) (out "/dev/null" (http-msg 200)) "Ensure 200 response is given")
  '(assert-equal '(("index.html") "api/") *Allow "Validated allowed endpoints")
  '(assert-equal 1 *API_VERSION "Ensure *API_VERSION is set from custom-variables.l")
  ]
