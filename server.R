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
  
	 	history_track<-setting_simulate(N, Time_s, input$cost)
		

	 # Plot
	 output$distPlot <- renderPlot({
	 	actor1<-actor2<-0
	  actor1<-if(input$actor1>input$size) input$size else input$actor1
	  actor2<-if(input$actor2>input$size) input$size else input$actor2 
	 plot_com(c(actor1,actor2),history_track$wealth)
	 
	}) 
	
	
		 output$distPlot2 <- renderPlot({
	plot_at_time<-if(input$time<input$time_threshold) input$time else input$time_threshold
	plot_at_time<-if(plot_at_time>1) plot_at_time else 1
	chosen_thre<-input$threshold
	fight<-if(input$fight<3)input$fight else 3
	fight<-if(input$fight>1)input$fight else 1
	
	plotg_alliance(history_track, chosen_thre, plot_at_time,input$size_nodes,fight)
	}) 

		 output$distPlot3 <- renderPlot({
	plot_at_time2<-if(input$time<input$time_threshold2) input$time else input$time_threshold2
	plot_at_time2<-if(plot_at_time2>1) plot_at_time2 else 1
	fight2<-if(input$fight2<3)input$fight2 else 3
	fight2<-if(input$fight2>1)input$fight2 else 1	
 plot_barchar(history_track, plot_at_time2,fight2)
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
		

	 	
	 	
	
	 
	 
	 
	 
	 	})