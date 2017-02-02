plot_trends<-function(){
 tags$div(
            
  h4('Compare Actors'),
           
           tags$ul(
           tags$li(
           
           
             h6('Actor 1 '),  
               tags$input(id='actor1',type="number", value=1, min=5, max=50, style='height:30px;text-align:right; width:60px')        
 , class='dropdown') , 
 tags$li(h1('   '), style='width:15px')    ,
   tags$li(  h6('Actor 2'), 
      tags$input(id='actor2',type="number", value=10, min=1, max=50, style='height:30px;text-align:right; width:60px') 
      , class='dropdown' ) ,  
       class='nav nav-pills')          
        
       , tags$br() 
 
  , style='width: 100%' )  
   

}

