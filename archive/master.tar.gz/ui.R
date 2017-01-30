# #####################################################
#
#
#
# #####################################################
library(shiny)

# #####################################################
# Load functions
# #####################################################

folder_dir<-getwd()
source(paste0(folder_dir,'/input_shiny/simulation_inpUt1.R'))
 source(paste0(folder_dir,'/input_shiny/plot_trends.R'))       
 source(paste0(folder_dir,'/input_shiny/save_documents.R'))       
 source(paste0(folder_dir,'/input_shiny/threshold_alliance.R'))       

source(paste0(folder_dir,'/Macro_level/Setting_game.R'))     

# #####################################################
# Define User Interface (UI)
# #####################################################
 
shinyUI(
fluidPage(

 
includeCSS("boot2.css"),
  
  # Application title
 

h1("Tribute Model", align='center')   ,
tags$hr(style='height: 4px; border-style: solid; background-color: #f0ad4e;border-radius: 1px;width:100%'),
tags$hr(style='height: 4px; border-style: solid; background-color: #f0ad4e;border-radius: 1px;width:100%'),
  # Sidebar with a slider input for number of observations
      tags$form(       
try2()
       , tags$hr(style='height: 2px;
    border-style: solid;
    background-color: #f0ad4e;
    border-radius: 1px;
    width:100%')
    ,
    selectInput("plot", h4("Choose plot"), choices = c('Trends','Alliance Network')) 
,
tags$hr(style='height: 2px; border-style: solid; background-color: #f0ad4e;border-radius: 1px;width:100%'),
  conditionalPanel( condition="input.plot=='Trends'",
    try()  ),
    conditionalPanel( condition="input.plot=='Alliance Network'",
    try4()
    )
     , 
 tags$hr(style='height: 2px; border-style: solid; background-color: #f0ad4e;border-radius: 1px;width:100%'),                 
  
 class='jumbotron',style='width: 35%')    ,
 
 
 try3() ,
   
   
   
  # Show a plot of the generated distribution
  mainPanel( conditionalPanel( condition="input.plot=='Trends'", plotOutput("distPlot") , style='position: fixed;right:2%;top:25%; width:60%' ) 
,
conditionalPanel( condition="input.plot=='Alliance Network'", plotOutput("distPlot2") , style='position: fixed;right:2%;top:20%; width:60%' ) 
  )


)) 
 
  
  

