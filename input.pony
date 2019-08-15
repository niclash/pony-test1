use "collections"

actor Input[TYPE]
  var value: TYPE
  var owner: Block tag
  
  new create() =>
    value = None
    

  be set( newValue: TYPE ) =>
    value = newValue
