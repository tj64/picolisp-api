(response-json
  (encode
    (list '("hello" . "world")
          (cons "api_version" . *API_VERSION) ) ) )
