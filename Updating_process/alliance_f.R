


# #####################################################
# Antony: 
# And now, Octavius,# Listen to great news. Brutus and Cassius# Are gathering forces; we must immediately raise an army; Therefore let's add to our allies,# Bring our good friends in, stretch our supplies,# And let's immediately have a meeting,
# #####################################################


# Label actors according to their alliance:
# 0: Neutral
# i: Agent supports agent i
# j: Agent supports agent j

forming_alliance<-function(i,j,actors){

    N<-length(actors)
    # Initially everyone is neutral
    alliance<-rep(0,N)
    commitment<-rep(0,N)
    wealth<-rep(0,N)
    # Divide actors in two groups
    alliance[i]<-i
    alliance[j]<-j

    # Generate alliance according to their commitment
	actors_label<-1:N
	actors_label<-actors_label[-c(i,j)]
     
	for(k in actors_label ){
	if(actors[[k]]$commitment[i]>actors[[k]]$commitment[j])
	{
		alliance[k]<-i
		commitment[k]<-actors[[k]]$commitment[i]
	    wealth[k]<-actors[[k]]$wealth

		}
	if(actors[[k]]$commitment[i]<actors[[k]]$commitment[j])
	{
		alliance[k]<-j
		commitment[k]<-actors[[k]]$commitment[j]
		wealth[k]<-actors[[k]]$wealth
		}
	}
	wealth[i]<-actors[[i]]$wealth
	wealth[j]<-actors[[j]]$wealth


	alliance_team<-matrix(0,nrow=N,ncol=4)
	alliance_team[1:N,1]<-1:N
	alliance_team[1:N,2]<-alliance
	alliance_team[1:N,3]<-commitment
	alliance_team[1:N,4]<-wealth
	alliance_team<-data.frame(alliance_team)
	names(alliance_team)<-c('id','allied','commitment','wealth')
	

  for(k in alliance_team[alliance_team[,'allied']==i,'id']){	
    temp_path<-alliance_team[k:i,2]
    exist_alliance<-length(temp_path[temp_path==i])==length(temp_path)
    temp_path2<-if(k<i)c(1:k,i:N) else c(1:i,k:N)
    temp_path2<-alliance_team[temp_path2,2]
    exist_alliance2<-length(temp_path2[temp_path2==i])==length(temp_path2)
    if(!(exist_alliance |exist_alliance2))
      alliance_team[k,'allied']<-0
      }	
  
  for(k in alliance_team[alliance_team[,'allied']==j,'id']){	
    temp_path<-alliance_team[k:j,2]
    exist_alliance<-length(temp_path[temp_path==j])==length(temp_path)
    temp_path2<-if(k<j)c(1:k,k:N) else c(1:j,k:N)
    temp_path2<-alliance_team[temp_path2,2]
    exist_alliance2<-length(temp_path2[temp_path2==j])==length(temp_path2)
    if(!(exist_alliance |exist_alliance2))
      alliance_team[k,'allied']<-0
  }
  


	
		# Alliance Wealth
	Wealth_alliance_i<-0
for(k in alliance_team[alliance_team[,2]==i,1]){
	Wealth_alliance_i<-actors[[k]]$wealth+ Wealth_alliance_i
	}

	Wealth_alliance_j<-0
for(k in alliance_team[alliance_team[,2]==j,1]){
	Wealth_alliance_j<-actors[[k]]$wealth+ Wealth_alliance_j
	}	
	
	
	# Output
	output<-list()
	output$alliance<-alliance_team
	output$wealth1<-Wealth_alliance_i
	output$wealth2<-Wealth_alliance_j
	return(output)
}