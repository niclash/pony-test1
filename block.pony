
interface Block

//   be connectFrom( input: String, sourceBlock: Block tag, output: String)
  
//   be connectTo( output: String val, destBlock: Block tag, destInput: Input[F64] tag)
  
  be connect( output: String val, to_block: Block tag, to_input: String val)
  
  be update[TYPE: Any val](input: String val, newValue: TYPE  val)

  be refresh()
