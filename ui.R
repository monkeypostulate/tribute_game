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

# #####################################################
# Define User Interface (UI)
# #####################################################
 
shinyUI(
fluidPage(

 
includeCSS("boot2.css"),
  
  # Application title
 

h1("Tribute Model", align='center')   ,
tags$ul(
tags$ul(

tags$li(  

selectInput("plot", 'Choose Plot', choices = c('Trends','Alliance Network', 'Alliance Wealth'))
),

 tags$li(  
 actionButton(inputId ='simulation',label='Simulation', class='btn btn-primary', style='position:relative;top:1px;height:59px'), class='navbar-form navbar-left', href='#'),
 class='nav navbar-nav'  ), 
 
 class='navbar navbar-inverse', style='height:65px, width:100%' ) ,
   
 
 
  # Sidebar with a slider input for number of observations
      tags$form(       
simulation_parameters()
       , tags$hr(style='height: 2px;
    border-style: solid;
    background-color: #f0ad4e;
    border-radius: 1px;
    width:100%')
    
,
#tags$hr(style='height: 2px; border-style: solid; background-color: #f0ad4e;border-radius: 1px;width:100%'),
  conditionalPanel( condition="input.plot=='Trends'",
    plot_trends() 
     ),
    conditionalPanel( condition="input.plot=='Alliance Network'",
    threshold_parameter()
    ),
        conditionalPanel( condition="input.plot=='Alliance Wealth'",
    plot_alliance_wealth())
     , 
 tags$hr(style='height: 2px; border-style: solid; background-color: #f0ad4e;border-radius: 1px;width:100%')
 ,
 class='jumbotron',style='width: 25%')    ,
 
 
save_documents() ,
   
   
   
  # Show a plot of the generated distribution
  mainPanel(
 tags$div(
   conditionalPanel( condition="input.plot=='Trends'", plotOutput("distPlot") ) 
,
conditionalPanel( condition="input.plot=='Alliance Network'", plotOutput("distPlot2") #, style='position: fixed;right:2%;top:20%; width:60%' 
) ,
conditionalPanel( condition="input.plot=='Alliance Wealth'", plotOutput("distPlot3"))
  
 )
 ,style='position:absolute;display:block;margin:auto;width:50%; left:25%; top:25%')
 
 )
) 
 
  
  

