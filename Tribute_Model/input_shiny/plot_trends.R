try<-function(){
 tags$div(
            
  
           
           tags$ul(
           tags$li(
             h4('Actor 1 '),  
               tags$input(id='actor1',type="number", value=10, min=5, max=10, style='height:30px')        
 , class='dropdown') , 
 tags$li(h1('   '))    ,
   tags$li(  h4('Actor 2'), 
      tags$input(id='actor2',type="number", value=1, min=1, max=10, style='height:30px') 
      , class='dropdown' ) ,  
       class='nav nav-pills')          
        
       , tags$br() 
 
  , style='width: 100%' )  
   

}

