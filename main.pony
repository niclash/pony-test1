use "collections"

actor Main is QueryResult[Array[String] val]
  var _env: Env
  let _b1: AddBlock 
  let _b2: AddBlock 
  let _b3: AddBlock 
  var _alive: Bool
  
  new create(env: Env) =>
    _env = env
    _alive = true
    _b1 = AddBlock( "block1" )
    _b2 = AddBlock( "block2" )
    _b3 = AddBlock( "block3" )
    _b3.connectFrom( "input1", _b1, "output" )
    _b3.connectFrom( "input2", _b2, "output" )
    _b1.updateWithName[F64]( "input1", 3.0 )
    _b1.updateWithName[F64]( "input2", 4.0 )
    _b2.updateWithName[F64]( "input1", 5.0 )
    _b2.updateWithName[F64]( "input2", 6.0 )
    this.forever()

  be forever() =>
    match _alive
    | true =>
      _b3.listOutputs(this)
      this.forever()
    | false =>
      None
    end
    
  
  be resultIs( result: Array[String] val ) =>
    for n in result.values() do
      _env.out.print( n )
      if n == "output=18" then _alive=false end
    end
