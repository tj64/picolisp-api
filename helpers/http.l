# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

(load "@lib/http.l")

# Modifications for @lib/http.l
(undef 'http404)

(de http404 ()
  (http-msg 404) )

(de *Http_codes
  (200 . "OK")
  (202 . "Accepted")
  (400 . "Bad Request")
  (403 . "Forbidden")
  (404 . "Not Found") )

[de get-http-method ()
  (cond
    (*Post "POST")
    (T "GET") ]

# Chop the end of the requested URL
[de get-http-url ()
  (glue "/" (head -1 (mapcar pack (split (chop *Url) "/") ]

(de http-code (Code)
  (cdr (assoc Code *Http_codes)) )

[de http-error (Code Error)
  (response-json-generic
    (encode (list (cons "Status" (pack Code " " (http-code Code))) (cons "Error-Message" Error)))
    Code
    NIL
    (list (cons "Content-Type" "application/json") (cons "Error-Message" Error)) ]

(de http-msg (Code Error)
  (if Error
      (http-error Code Error)
      (response-json [encode (list (cons "Status" (pack Code " " (http-code Code)] Code) ) )

[de response-generic (Code Size Date Body Headers)
  (prinl "HTTP/1.1 " Code " " (http-code Code) "^M")
  (prinl "Server: PicoLisp^M")
  (prin "Date: ")
  (httpDate (date T) (time T))
  (when Size
    (prinl "Content-Length: " Size "^M") )
  (mapc '((N) (prinl (car N) ": " (cdr N) "^M")) Headers)
  (when Date
    (prin "Last-Modified: ")
    (eval Date)
    (prinl "^M") )
  (prin Body) ]

(de api-http-stop ()
  (prinl "HTTP server stopped") )

[de api-http-start ()
  (finally
    (api-http-stop)
    (prinl "HTTP server listening on port: " *API_PORT)
    (chdir *API_ROOT
      (server *API_PORT *API_INDEX) ]

# generate the list of allowed API endpoints
[de api-http-allowed ()
  (chdir *API_ROOT
    (extract '((N)
              (when (=T (car (info N))) (pack N "/")))
              (dir) ]
