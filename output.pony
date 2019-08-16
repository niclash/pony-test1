use "collections"

class Output[TYPE: Any val] 
  var _value: TYPE
  var _owner: Block tag
  var _dest: List[Link[TYPE] val] ref
  
  new create(owner: Block tag, initialValue: TYPE) =>
    _owner = owner
    _value = initialValue
    _dest = List[Link[TYPE] val]

  fun ref set( newValue: TYPE val ) =>
    for dest in _dest.values() do
      dest.update( newValue )
    end
    _value = newValue

  fun value() : this->TYPE =>
    _value
    
  fun ref connect(destBlock: Block tag, input: Input[TYPE] tag) =>
    var link:Link[TYPE] val = recover Link[TYPE](destBlock, input) end
    _dest.push(link)

