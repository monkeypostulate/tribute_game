folder<-getwd()

save_documents<-function(){
tags$div(



 h5('Save Results (as R object)', align='left'),
                

downloadButton('downloadData', label = "Download Simulation")

, tags$hr(style='height: 2px; border-style: solid; background-color:#0099CC;border-radius: 1px;width:100%')



, class='alert alert-dismissible alert-warning', style='position:relative;top:600px;width:100%;background-color:#66CCFF') 

}


