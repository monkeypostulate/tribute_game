# #####################################################
#
#
#
# #####################################################
library(shiny)
library(ggplot2)
library(gridExtra)
library(grid)
# #####################################################
# Load functions
# #####################################################
 
folder_dir<-getwd()
source(paste0(folder_dir,'/input_shiny/simulation_inpUt1.R'))
 source(paste0(folder_dir,'/input_shiny/plot_trends.R'))       
 source(paste0(folder_dir,'/plottest.R'))       
 source(paste0(folder_dir,'/input_shiny/save_documents.R'))       
 source(paste0(folder_dir,'/input_shiny/threshold_alliance.R'))       
 source(paste0(folder_dir,'/input_shiny/wealth_of_alliances.R'))       

source(paste0(folder_dir,'/Macro_level/Setting_game.R'))     


server <- function(input, output) {

  
 
 
 
 observeEvent(input$simulation, {
		
	  N<-input$size	
	  Time_s<-input$time	
  
	 	history_track<-setting_simulate(N, Time_s, input$cost)
		

	 # Plot
	 output$distPlot <- renderPlot({
	 	actor1<-actor2<-1
	  actor1<-if(input$actor1>input$size) input$size else input$actor1
	  actor2<-if(input$actor2>input$size) input$size else input$actor2 
	 plot_com(c(actor1,actor2),history_track$wealth)
	 
	}) 
	
	
		 output$allianceNet <- renderPlot({
	plot_at_time<-if(input$time<input$time_threshold) input$time else input$time_threshold
	plot_at_time<-if(plot_at_time>1) plot_at_time else 1
	chosen_thre<-input$threshold
	fight<-if(input$fight<3)input$fight else 3
	fight<-if(input$fight>1)input$fight else 1
	
	plotg_alliance(history_track, chosen_thre, plot_at_time,'Normal',fight)
	}) 
	
			 output$allianceNetwealth <- renderPlot({
	plot_at_time<-if(input$time<input$time_threshold) input$time else input$time_threshold
	plot_at_time<-if(plot_at_time>1) plot_at_time else 1
	chosen_thre<-input$threshold
	fight<-if(input$fight<3)input$fight else 3
	fight<-if(input$fight>1)input$fight else 1
	
	plotg_alliance(history_track, chosen_thre, plot_at_time, 'Proportional to wealth',fight)
	})

		 output$histogram <- renderPlot({
	plot_at_time2<-if(input$time<input$time_threshold) input$time else input$time_threshold
	plot_at_time2<-if(plot_at_time2>1) plot_at_time2 else 1
	fight <-if(input$fight <3)input$fight else 3
	fight <-if(input$fight>1)input$fight else 1	
 plot_barchar(history_track, plot_at_time2, fight)
 })
	 
				 output$allianceInitialconditions <- renderPlot({
	chosen_thre<-input$threshold
	fight<-if(input$fight<3)input$fight else 3
	fight<-if(input$fight>1)input$fight else 1
	
	plotg_alliance(history_track, chosen_thre, 1, 'Proportional to wealth',fight)
	})
	
	
	
	  output$downloadData <- downloadHandler(
   filename = function() {
     paste('data-', Sys.Date(), '.RData', sep='')
   },
   content = function(con) {
    save(history_track, file=con)
                           }
 )
	 	 
	 	
	 			})
		

}



ui <- fluidPage(htmlTemplate( "simulations.html",

chooseplot=selectInput("plot", 'Choose Plot', choices = c('Trends','Alliance Network', 'Alliance Wealth'))
,
startsimulations=actionButton(inputId ='simulation',label='Simulation')
,
size_chosen=tags$input(id='size',type="number", value=10, min=5, max=15),
time_chosen=tags$input(id='time',type="number", value=10, min=5, max=500),
costwar_chosen=tags$input(id='cost',type="number", step=.05, value=.25, min=0, max=1)
,
actor_1= tags$input(id='actor1',type="number", value=1, min=5, max=50),
actor_2=tags$input(id='actor2',type="number", value=10, min=1, max=50) ,
plot_trends=plotOutput('distPlot'),
text1=textOutput('texte'),
plottends=plot_trends() ,


alliance_network1=plotOutput("allianceNet"),
alliance_network2=plotOutput("allianceNetwealth"),
threshold_chosen=tags$input(id='threshold', type='number', step=10, value=50,min=0,max=100),
alliance_period=tags$input(id='time_threshold', type='number', step=1, value=6,min=0,max=5000),
fight_chosen=tags$input(id='fight', type="number",value=1, step=1,min=1,max=3),

wealth_histrogram=plotOutput("histogram"),
initial_network=plotOutput("allianceInitialconditions"),

downloadlink=downloadLink("downloadData", "Download Simulation")

)
  )
  
  
  shinyApp(ui=ui,server=server)