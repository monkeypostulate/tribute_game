# #####################################################
#
#
#
# #####################################################



#
shinyServer(function(input, output, session) {
	
	
	
	
	
	observeEvent(input$simulation, {
		
	  N<-input$size	
	  Time_s<-input$time	
  
	 	history_track<-setting_simulate(N, Time_s)
		

	 # Plot
	 output$distPlot <- renderPlot({
	  actor1<-input$actor1
	  actor2<-input$actor2
	 plot_com(c(actor1,actor2),history_track$wealth)
	 
	}) 
	
	
		 output$distPlot2 <- renderPlot({
	
	plotg_alliance(history_track,input$threshold)

	 
	}) 
	 
	 
		# Save
observeEvent(input$save, {
		
			filename<-paste0(input$filename,input$filename2,'.csv')
	write(history_track$wealth, filename)
	
	filenamepdf<-paste0(input$filename,input$filename3,'pdf')
		pdf(filenamepdf)
		plotg_alliance(history_track,.6)
		dev.off()
	} )
	 
	 	
	 			})
		

	 	
	 	
	
	 
	 
	 
	 
	 	})