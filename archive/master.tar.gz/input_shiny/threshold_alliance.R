
try4<-function(){
	tags$div(
h4('Threshold for Alliance'),
tags$input(id='threshold', type='number', step=.1, value=.6,min=0,max=1, style='height:30px;width=45px')
)

}