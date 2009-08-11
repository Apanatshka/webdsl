application test

  entity User{
    name :: String
  }
  
  define page home(){
    test() with {
      content(s:String){ "123" output(s) }
    }
    
    break
    
    test2()
  }

  define test() requires content(s:String){
    "content: " content("456")
  }

  define test2() {
    validationContextTest with{
      error(messages : List<String>) { errorMessageTest(messages) }
      content() { "content" }
    }
  }
   
  define errorMessageTest(messages : List<String>){
    <h1>
      for(m: String in messages){
        output(m)
      }
      elements
    </h1>
  }
   
  define validationContextTest() requires error(m: List<String>), content(){
    error(["123","456","789"]){
      content
    }
  }
  