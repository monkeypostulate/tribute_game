#folder<-getwd()

save_documents<-function(){
tags$div(



 h6('Save Results (as R object)', align='center'),
 h6('Folder'),  tags$input(id='filename',type="text", value=paste0(folder,'/saved_documents/'), class='content', style='width:90%'),
 h6('Name'),
 tags$input(id='filename2',type="text", value='wealth', class='content', style='width:90%')
         ,tags$br(),                  
   actionButton(inputId ='save',label='Save',class ="btn btn-primary", align='right', style='position:relative;left:90%')

, tags$hr(style='height: 2px; border-style: solid; background-color: #4e5d6c;border-radius: 1px;width:100%')

,h6('Save plots (as pdf file)', align='center'),
h6('Name'),
 tags$input(id='filename3',type="text", value='plot_graph', class='content', style='width:90%')
         ,tags$br(),                  
   actionButton(inputId ='save2',label='Save',class ="btn btn-primary", align='right', style='position:relative;left:90%')

, class='alert alert-dismissible alert-warning', style='width:35%') 

}


