 simulation_parameters<-function(){
 	tags$div(
 	h4('Parameters'),
 	
 	tags$ul(
 	tags$li(
          h6('Number of actors',style='text-align:left'),    tags$input(id='size',type="number", value=10, min=5, max=20, style='height:30px;text-align:right;width:60px')
, class='active'),
  tags$li(h1(' '), style='width:10px') ,  
  tags$li(       h6('Time',style='text-align:left'),    tags$input(id='time',type="number", value=10, min=5, max=1000, style='height:30px;text-align:right; width:60px')
, style='display:inline;'),

 tags$li(
    h6('Cost of war %',style='text-align:left'),    tags$input(id='cost',type="number", step=.05, value=.25, min=0, max=1, style='height:30px;text-align:right; width:60px')
), class='nav nav-pills')

      
      
         , style='width: 100%') 
         }