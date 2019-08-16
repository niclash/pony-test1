
trait Block

  be connectFrom( input: String, sourceBlock: Block tag, output: String)
  
  be connectTo( output: String val, destBlock: Block tag, destInput: Input[F64] tag)
  
  be update[TYPE: Any val](input: Input[TYPE] tag, newValue: TYPE  val)

  be updateWithName[TYPE: Any val](input: String val, newValue: TYPE  val)
  
