use "collections"

actor Main
  var _env: Env
  var _log: Logging
  
  new create(env: Env) =>
    _env = env
    _log = Logging(_env.out)
    
