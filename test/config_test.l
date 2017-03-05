# (tests) config.l for the PicoLisp REST API

[de *API_CONFIG
  ("api-port"     49888)
  ("api-index"    "index.html")
  ("api-root"     "test/www")
  ("app-data"     "test/data")
  ("app-helpers"  ("custom-variables.l"))
  ("auth-type"    "token")
  ]

# Mock the path for testing
# (setq *API_ROOT (pack (pwd) "/" (car (file)) "test/www"))
