# #####################################################
#
# Tribute Model
# Author: Abel Camacho Guardian
# This file is subject to the terms and conditions defined in
# file 'LICENSE.txt'
# #####################################################

# #####################################################
# Load libraries
# #####################################################
library(shiny)
library(ggplot2)
library(gridExtra)
library(grid)
# #####################################################
# Load functions
# #####################################################
 
 folder_dir<-getwd()
       
 source(paste0(folder_dir,'/plotwealth.R'))       
 source(paste0(folder_dir,'/Macro_level/Setting_game.R'))     


# Define the server logic required for the simulations 
server <- function(input, output) {

# Simulation starts after user clicks the button 
# input$ simulation
 observeEvent(input$simulation, {

# ######
# The simulations are done here		
	 N<-input$size	
	 Time_s<-input$time	
	 history_track<-setting_simulate(N, Time_s, input$cost)
		

	 # Plot the wealth evolution of two actors
	 output$comparewealthPlot<- renderPlot({
	  # Chosen actors can only be one of the simulated actors.
	  actor1<-if(input$actor1>input$size) input$size else input$actor1
	  actor1<-if(input$actor1<1) 1 else actor1
	  actor2<-if(input$actor2>input$size) input$size else input $actor2 
	  actor2<-if(input$actor2<1) 1 else actor2 

	 plot_com(c(actor1,actor2),history_track$wealth)
	 
	}) 
	


# ######
# Plot alliance network	
	output$allianceNetwealth <- renderPlot({
	# Period chosen cannot be greater than the maximum number of simulations.
		plot_at_time<-if(input$time<input$time_threshold) input$time else input$time_threshold
	# Time starts at period 1
	plot_at_time<-if(plot_at_time>1) plot_at_time else 1
	chosen_thre<-input$threshold
	fight<-if(input$fight<3)input$fight else 3
	fight<-if(input$fight>1)input$fight else 1
	
	plotg_alliance(history_track, chosen_thre, plot_at_time, 'Proportional to wealth',fight)
	})

# ######
# Plot wealth of alliances
	 output$histogram <- renderPlot({
	# Period chosen cannot be greater than the maximum number of simulations.	 	
	plot_at_time2<-if(input$time<input$time_threshold) input$time else input$time_threshold
	# Time starts at period 1
	plot_at_time2<-if(plot_at_time2>1) plot_at_time2 else 1
	fight <-if(input$fight <3)input$fight else 3
	fight <-if(input$fight>1)input$fight else 1	
 plot_barchar(history_track, plot_at_time2, fight)
 })
	 
	
# Download data
	  output$downloadData <- downloadHandler(
   filename = function() {
     paste('TributeModel-Date-', Sys.Date(), '.RData', sep='')
   },
   content = function(con) {
    save(history_track, file=con)
                           }
 )
	 	 
	 	
	 			})
		

}


# Functions to
ui <- fluidPage(htmlTemplate( "simulations.html",

# #####
# Start simulation
startsimulations=actionButton(inputId ='simulation',label='Simulation', style="color:white;
	background-color:#F19F4D;
	border-radius: 8px;
	height:28px;"),

# #####
# Basic Parameters
# Choose number of actors
size_chosen=tags$input(id='size',type="number", value=10, min=5, max=15),
# Chose number of periods
time_chosen=tags$input(id='time',type="number", value=10, min=5, max=500),
# Choose cost of war
costwar_chosen=tags$input(id='cost',type="number", step=.05, value=.25, min=0, max=1),
# #####
# Parameter for plotting wealth trend
# Two actors chosen
actor_1= tags$input(id='actor1',type="number", value=1, min=5, max=50),
actor_2=tags$input(id='actor2',type="number", value=10, min=1, max=50),
# Plot that compare wealth
plot_trends=plotOutput('comparewealthPlot'),


# #####
# Parameter for plotting network
# Threshold for creating links
threshold_chosen=tags$input(id='threshold', type='number', step=10, value=50,min=0,max=100),
# Chosen period 
alliance_period=tags$input(id='time_threshold', type='number', step=1, value=6,min=0,max=5000),
# War chosen (there are three)
fight_chosen=tags$input(id='fight', type="number",value=1, step=1,min=1,max=3),
# Plot Network
alliance_network2=plotOutput("allianceNetwealth"),

# Plot wealth of alliances
wealth_histrogram=plotOutput("histogram"),
# Download Button
downloadlink=downloadLink("downloadData", "Download Simulation")

)
  )
  
  # Create shiny app
  shinyApp(ui=ui,server=server)