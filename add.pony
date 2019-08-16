
actor AddBlock is Block
  let _input1: Input[F64] ref
  let _input2: Input[F64] ref
  let _output: Output[F64] ref
  let _name: String val
  
  new create(name: String) =>
    _name = name
    _input1 = Input[F64](0.0)
    _input2 = Input[F64](0.0)
    _output = Output[F64](this, 0.0)
    
  be connectTo( output: String val, destBlock: Block tag, destInput: Input[F64] tag) =>
    if output == "output"  then
      _output.connect(destBlock,destInput)
    end
    
  be connectFrom( input: String, sourceBlock: Block tag, output: String) =>
    if output == "output"  then
      if input == "input1" then
        sourceBlock.connectTo(output, this, _input1)
      elseif input == "input2" then
        sourceBlock.connectTo(output, this, _input2)
      end
    end
    
  
  be update[TYPE: Any val](input: Input[TYPE] tag, newValue: TYPE  val) =>
    match newValue
    | let v: F64 => 
        if input is _input1  then
          _input1.set( v )
        end
        if input is _input2  then
          _input2.set( v )
        end
    end
    refresh()
    
  be refresh() =>
    let value : F64 = _input1.value().add( _input2.value() )
    _output.set( value )
    
  be updateWithName[TYPE: Any val](input: String val, newValue: TYPE  val) =>
    match newValue
    | let v: F64 => 
        if input == "input1" then _input1.set( v ) end
        if input == "input2" then _input2.set( v ) end
    end
    refresh()
    

  be listInputs(callback: QueryResult[Array[String] val] tag) =>
    let input1: String = "input1="+_input1.value().string()
    let input2: String = "input2="+_input2.value().string()
    callback.resultIs([input1; input2])
    
  be listOutputs(callback: QueryResult[Array[String] val] tag) =>
    let output: String = "output=" + _output.value().string()
    callback.resultIs([output])
    
