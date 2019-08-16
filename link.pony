
class Link[TYPE: Any val]
  let block: Block tag
  let input: Input[TYPE] tag
  
  new create( destBlock: Block tag, destInput: Input[TYPE] tag) =>
    block = destBlock
    input =  destInput
    
  fun update( newValue: TYPE ) =>
    block.update[TYPE](input, newValue )
    
