plot_alliance_wealth<-function(){
 tags$div(
 
 h4('Wealth of Alliance'),
 h6('Period'),
 tags$input(id='time_threshold2', type='number', step=1, value=6,min=0,max=5000, style='height:30px;text-align:right; width:60px')
 ,
 h6('Choose fight'), tags$input(id='fight2', type="number",value=1, step=1,min=1,max=3,style='height:30px;text-align:right; width:60px')
 
  )
 
 }