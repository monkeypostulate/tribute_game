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


setting_simulate<-function(N, T_periods, cost){
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

history_track<-list()
history_track$wealth<-matrix(0,nrow=T_periods,ncol=N)
history_track$active<-list()
history_track$active$active<-matrix(0,nrow=T_periods, ncol=6)
history_track$active$alliance<-matrix(0,nrow=T_periods,ncol=N)
history_track$actors<-list()

# #####################################################	 
# Start Simulations
# #####################################################	 

for(time_s in 1:T_periods){

if(time_s!=1){
# Star of new Year
Wealth<-runif(N,min=300, max=500)

for(i in 1:N){
	actors[[i]]$wealth<-actors[[i]]$wealth+20 
}
}


history_track$actors[[time_s]]<-actors
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
	history_track$active$active[time_s,i]<-active[i]
	history_track$active$active[time_s,3+i]<-target[i]
}


# Update actors
if(!is.na(target[i])){
	forming_alliance(active[i],target[i],actors)
	actors<-update_process(active[i], target[i],actors, cost)
}

#Track Wealth
for(actor_s in 1:N){
history_track$wealth[time_s,actor_s]<-actors[[actor_s]]$wealth
}



}

# Output
return(history_track)
}








