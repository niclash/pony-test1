actor Logging
  var printer: OutStream
  
  new create( out: OutStream) =>
    printer = out
    
  be debug( msg: String ) =>
     printer.print(msg)

  
