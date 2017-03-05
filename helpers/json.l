# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

[de api-json-load-32bit ()
  (load "@lib/json.l")

  (de encode (Value)
    (pipe (printJson Value) (line T)) )

  (de decode (Value Type)
    (if Type
      (in Value (readJson))
      (parseJson Value) ]

[de api-json-load-64bit ()
   (load (pack (car (file)) ".modules/picolisp-json/HEAD/json.l")) ]

[de json-file (Json)
  (setq Info (info Json)
        Size (car Info)
        Date '(httpDate (cadr Info) (cddr Info))
        Body (pack (in Json (till (eof) ]

[de json-string (Json)
  (setq Size (length Json)
        Date '(httpDate (date T) (time T))
        Body Json ]

[de response-json-generic (Json Code Flg Headers)
  (default Code 200)
  (use Info Size Date Body
    (if Flg
        (json-file Json)
        (json-string Json) )
    (ifn  Size
          (http-msg 404 "Missing or invalid JSON file")
          (response-generic Code Size Date Body Headers) ]

[de response-json (Json Code Flg)
  (response-json-generic Json Code Flg '(("Content-Type" . "application/json") ]

[de response-json-nocache (Json Code Flg)
  (response-json-generic Json Code Flg '(("Content-Type" . "application/json") ("Cache-Control" . "no-cache") ]
