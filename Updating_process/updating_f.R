# #####################################################
#
#
#
# #####################################################

update_process<-function(i,j, actors){
	
	
# #####################################################
# Hamlet:
# Fight or not to fight, that is the question:
# Whether 'tis nobler in the mind to suffer
# The slings and arrows of outrageous fortune,
# Or to take Arms against a Sea of troubles, 	
# #####################################################	 
# Fight or not?
	alliance_i<-forming_alliance(i,j,actors)$alliance[forming_alliance(i,j,actors)$alliance[,'allied']==i,]
	 total_weath_i<-forming_alliance(i,j,actors)$wealth1
alliance_j<-forming_alliance(i,j,actors)$alliance[forming_alliance(i,j,actors)$alliance[,'allied']==j,]
	total_weath_j<-forming_alliance(i,j,actors)$wealth2
	
fight= .20*total_weath_i*(actors[[j]]$wealth/total_weath_j)>250
	
	# Decision not to fight
	if(fight){ # There is no fight
	  # Update wealth 
	  # gets tribute
	actors[[i]]$wealth<-actors[[i]]$wealth+min(actors[[j]]$wealth,250)
	# pays tribute
	actors[[j]]$wealth<-actors[[j]]$wealth-min(actors[[j]]$wealth,250)
	# Update Commitment: 
	# Protection
	actors[[i]]$commitment[j]<-min(actors[[i]]$commitment[j]+10,100)
	# Subservience
	actors[[j]]$commitment[i]<-min(actors[[j]]$commitment[i]+10,100)
	}

# Decision to fight:
# #####################################################	 
# Caeser:
# Cowards die many times before their deaths; 
# The valiant never taste of death but once.
# It seems to me most strange that men should fear; 
# Seeing that death, a necessary end, 
# Will come when it will come
# #####################################################	 
	else{
		####################
		# Alliances:
		####################


# Cost and commitment update: Alliance i:
 for(k in alliance_i[,'id'])	{
  actors[[k]]$wealth<-max(alliance_i[alliance_i[,'id']==k,'wealth']-
	(alliance_i[alliance_i[,'id']==k,'wealth']/total_weath_i)* total_weath_j*.25,0)
	}
	
# Cost and commitment update: Alliance j:
 for(k in alliance_j[,'id'])	{
  actors[[k]]$wealth<-max(alliance_j[alliance_i[,'id']==k,'wealth']*
	(alliance_j[alliance_i[,'id']==k,'wealth']/total_weath_i)* total_weath_i*.25,0)
	}	

	

# Update all commitments	
	ni<-length(alliance_i[,'id'])
	nj<-length(alliance_j[,'id'])

	
   for(k in 1:ni){
 	 for(k2 in k:ni){ 
 		 i1<-alliance_i[k,'id']
 		 i2<-alliance_i[k2,'id']
 		 actors[[i1]]$commitment[i2]<-min(actors[[i1]]$commitment[i2]+10,100)
 		 actors[[i2]]$commitment[i1]<-min(actors[[i2]]$commitment[i1]+10,100)
 	 }
   }	


  for(k in 1:nj){
 	 for(k2 in k:nj){
 		 j1<-alliance_j[k,'id']
 		 j2<-alliance_j[k2,'id']
 		 actors[[j1]]$commitment[j2]<-min(actors[[j1]]$commitment[j2]+10,100)
 		 actors[[j2]]$commitment[j1]<-min(actors[[j2]]$commitment[j1]+10,100)
 	 }
  }

  for(k in 1:ni){
 	 for(k2 in 1:nj){
 		 ic<-alliance_i[k,'id']
 		 jc<-alliance_j[k2,'id']
 		 actors[[ic]]$commitment[jc]<-max(actors[[ic]]$commitment[jc]-10,0)
 		 actors[[jc]]$commitment[ic]<-max(actors[[jc]]$commitment[ic]-10,0)
 	 }
  }	
	
	}
	# Output: Updated actors
	return(actors)
	
	
}

