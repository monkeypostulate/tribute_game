# #####################################################
#
# Tribute Model:
# Function: Determine alliances
# Author: Abel Camacho Guardian
# This file is subject to the terms and conditions defined in
# file 'LICENSE.txt'
# #####################################################


# ##################################
# Input: active actor: i
#        target actor: j
#        actors: actors (list)
# ##################################

# ##################################
# Output:  output (list)
#       alliances: output$alliance
#       Wealth of alliance i: output$wealth1
#       Wealth of alliance i: output$wealth2


# Label actors according to their alliance:
# 0: Neutral
# i: Agent supports agent i
# j: Agent supports agent j

forming_alliance<-function(i,j,actors){

# #####	
   # Number of actors
    N<-length(actors)
    # Initially everyone is neutral
    alliance<-rep(0,N)
    commitment<-rep(0,N)
    wealth<-rep(0,N)
    # Divide actors in two groups
    # Supporting actor i
    alliance[i]<-i
    # Supporting actor j
    alliance[j]<-j

    # Generate alliance according to their commitment
	actors_label<-1:N
	actors_label<-actors_label[-c(i,j)]
     
	for(k in actors_label ){
		#  Temporary alliance Put agent k in alliance i if commitment to i is greater than the commitment to j
	if(actors[[k]]$commitment[i]>actors[[k]]$commitment[j])
	{
		alliance[k]<-i
		commitment[k]<-actors[[k]]$commitment[i]
	    wealth[k]<-actors[[k]]$wealth

		}
		#  Temporary alliance Put agent k in alliance i if commitment to i is greater than the commitment to j
	if(actors[[k]]$commitment[i]<actors[[k]]$commitment[j])
	{
		alliance[k]<-j
		commitment[k]<-actors[[k]]$commitment[j]
		wealth[k]<-actors[[k]]$wealth
		}
	}
	wealth[i]<-actors[[i]]$wealth
	wealth[j]<-actors[[j]]$wealth

commitment[i]<-commitment[j]<-100
     # Alliances and wealth of actors in an alliance
	alliance_team<-matrix(0,nrow=N,ncol=4)
	alliance_team[1:N,1]<-1:N
	alliance_team[1:N,2]<-alliance
	alliance_team[1:N,3]<-commitment
	alliance_team[1:N,4]<-wealth*commitment/100
	alliance_team<-data.frame(alliance_team)
	names(alliance_team)<-c('id','allied','commitment','wealth')
	
# Determine alliance i
  for(k in alliance_team[alliance_team[,'allied']==i,'id']){
  	# Alliances of actor between k and i	
    temp_path<-alliance_team[k:i,2]
    # True if all actors between k and i support i
    exist_alliance<-length(temp_path[temp_path==i])==length(temp_path)
    # Second possible path
    temp_path2<-if(k<i)c(1:k,i:N) else c(1:i,k:N)
    temp_path2<-alliance_team[temp_path2,2]
    # True if all actors between k and i support i
    exist_alliance2<-length(temp_path2[temp_path2==i])==length(temp_path2)
    # If there there is not path between k and i such that everyone support i, then k is not part of the alliance i.
    if(!(exist_alliance |exist_alliance2))
      alliance_team[k,'allied']<-0
      }	
  
  for(k in alliance_team[alliance_team[,'allied']==j,'id']){	
   	# Alliances of actor between k and j	
   temp_path<-alliance_team[k:j,2]
        # True if all actors between k and j support j
     exist_alliance<-length(temp_path[temp_path==j])==length(temp_path)
    # Second possible path
    temp_path2<-if(k<j)c(1:k,j:N) else c(1:j,k:N)
    temp_path2<-alliance_team[temp_path2,2]
    # True if all actors between k and j support j
    exist_alliance2<-length(temp_path2[temp_path2==j])==length(temp_path2)
    # If there there is not path between k and j such that everyone support j, then k is not part of the alliance j.
    if(!(exist_alliance |exist_alliance2))
      alliance_team[k,'allied']<-0
  }
  


# #####	
	# Alliance Wealth
	# Temporary commitment for i
	actors[[i]]$commitment[i]<-100
	Wealth_alliance_i<-0
for(k in alliance_team[alliance_team[,2]==i,1]){
	Wealth_alliance_i<-actors[[k]]$wealth*
	actors[[k]]$commitment[i]+ Wealth_alliance_i
	}
	# Temporary commitment for j
	actors[[j]]$commitment[j]<-100
	Wealth_alliance_j<-0
for(k in alliance_team[alliance_team[,2]==j,1]){
	Wealth_alliance_j<-actors[[k]]$wealth*actors[[k]]$commitment[j]+ Wealth_alliance_j
	}	


 actors[[i]]$commitment[i]<-0
 actors[[j]]$commitment[j]<-0
	
# #####		
	# Output
	output<-list()
	output$alliance<-alliance_team
	output$wealth1<-Wealth_alliance_i
	output$wealth2<-Wealth_alliance_j
	return(output)
}