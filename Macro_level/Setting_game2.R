# #####################################################
#
#
#
# #####################################################





# Call packages
library(igraph)
# Call functions


folder_dir<-getwd()

source(paste0(folder_dir,"/Actors/actor_function.R"))
source(paste0(folder_dir,"/Updating_process/alliance_f.R"))
source(paste0(folder_dir,"/Updating_process/target_actor.R"))
source(paste0(folder_dir,"/Updating_process/updating_f.R"))
source(paste0(folder_dir,"/plot_trends.R"))
source(paste0(folder_dir,"/plot_alliance_net.R"))


#####################################
# Create Actors
#####################################
Wealth<-runif(N,min=300, max=500)

actors<-list()
for(i in 1:N){
	actors[[i]]<-actor(position=i,Wealth[i],rep(0,N))
}



# #####################################################	 
#
# #####################################################	 

 #history_wealth<-matrix(0,nrow=T_periods,ncol=N)
   
# #####################################################	 
# Start Simulations
# #####################################################	 

  
 
  for(s in 1:1009){
  	 for(i in 1:N){
	actors[[i]]$wealth<-actors[[i]]$wealth+20 
}
  	results<-update_actors(actors,1)
  	actors<-results$actors
  	active <-results$active
  	target <-results$target
  	
 plotg_alliance2(actors,active,target,50,'Proportional to wealth',1,s)
 print(s)
}
update_actors<-function(actors, cost){
# #####################################################	 
# Choose active actors
# #####################################################	 
active<-sample(1:N,3, replace=F)

# #####################################################	 
# Choose target actors 
# #####################################################	 
target<-rep(0,3)
for(i in 1:3){
	target[i]<-target_actor(active[i],actors)
 }


# Update actors
if(!is.na(target[i])){
	actors<-update_process(active[i], target[i],actors, cost)
}


output<-list()
output$actors<-actors
output$active<-active
output$target <-target
return(output)
}









