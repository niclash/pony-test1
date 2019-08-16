class Input[TYPE: Any val]
  var _value: TYPE

  new create(initialValue: TYPE) =>
    _value = consume initialValue

  fun ref set( newValue: TYPE) =>
    _value = consume newValue

  fun value() : this->TYPE =>
    _value
