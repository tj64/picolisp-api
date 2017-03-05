# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2017 Alexander Williams, Unscramble <license@unscramble.jp>

# Only checks if the size of the file matches
(de test-json-file ()
  (use Info Size Date Body
    (json-file "test-data.json")
    (when (= Size 57) T) ) )

# Only checks if the size of the string matches
(de test-json-string ()
  (use Size Date Body
    (json-string "{\"Status\":\"200 OK\"}")
    (when (= Size 19) T) ) )

[de test-response-json ()
  (pipe
    (response-json "{\"Status\":\"200 OK\"}")
    (when
      (and
        (= (line) '("H" "T" "T" "P" "/" "1" "." "1" " " "2" "0" "0" " " "O" "K"))
        (= (line) '("S" "e" "r" "v" "e" "r" ":" " " "P" "i" "c" "o" "L" "i" "s" "p"))
        (line) # Skip the Date header
        (= (line) '("C" "o" "n" "t" "e" "n" "t" "-" "L" "e" "n" "g" "t" "h" ":" " " "1" "9"))
        (= (line) '("C" "o" "n" "t" "e" "n" "t" "-" "T" "y" "p" "e" ":" " " "a" "p" "p" "l" "i" "c" "a" "t" "i" "o" "n" "/" "j" "s" "o" "n")) )
      T ]

[de test-202-accepted ()
  (if *CPU
    "{\"Status\":\"202 Accepted\"}"
    "{\"Status\": \"202 Accepted\"}" ]

[execute
  '(assert-equal  "OK" (http-code 200) "Ensure the HTTP message for 200 is 'OK'")
  '(assert-equal  (test-202-accepted) (out "/dev/null" (http-msg 202)) "Ensure the HTTP message for 202 is returned as JSON")
  '(assert-t      (test-json-file) "Ensure JSON file is validated")
  '(assert-t      (test-json-string) "Ensure JSON string is validated")
  '(assert-t      (test-response-json) "Ensure a generic HTTP response is returned")
  ]
