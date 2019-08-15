use "collections"

actor Input[TYPE: Any val]
  var _value: TYPE
  var _owner: Block tag
  
  new create(owner: Block tag, initialValue: TYPE) =>
    _owner = owner
    _value = initialValue
    

  be set( newValue: TYPE val ) =>
    _value = newValue
