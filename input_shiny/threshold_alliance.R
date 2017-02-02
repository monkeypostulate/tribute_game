
threshold_parameter<-function(){
	tags$div(
	h4('Alliance Network'),
	
	tags$ul(
 	tags$li(
h6('Threshold'),
tags$input(id='threshold', type='number', step=10, value=50,min=0,max=100, style='height:30px;text-align:right; width:60px')
, style='display:inline;'),
tags$li(h1(), style='width:10px'),
tags$li( 
h6('Period'), 
tags$input(id='time_threshold', type='number', step=1, value=6,min=0,max=5000, style='height:30px;text-align:right; width:60px')
, style='display:inline;')

, class='nav nav-pills')
,
 h6('Choose fight'), tags$input(id='fight', type="number",value=1, step=1,min=1,max=3,style='height:30px;text-align:right; width:60px')
,
 selectInput("size_nodes", h6("Size of nodes"), choices = c('Normal','Proportional to wealth'))
)

}