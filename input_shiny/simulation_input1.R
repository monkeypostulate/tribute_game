 try2<-function(){
 	tags$div(
          h4('Number of actors'),    tags$input(id='size',type="number", value=10, min=5, max=20, style='height:30px')
,
     
         h4('Time'),    tags$input(id='time',type="number", value=10, min=5, max=1000, style='height:30px')
,

    tags$br(),
    actionButton(inputId ='simulation',label='Simulation',class ="btn btn-success")
      
         , tags$br()
         , style='width: 100%') 
         }