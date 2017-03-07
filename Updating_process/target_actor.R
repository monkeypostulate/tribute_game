# #####################################################
#
# Tribute Model:
# Function: Determine target actor
# Author: Abel Camacho Guardian
# This file is subject to the terms and conditions defined in
# file 'LICENSE.txt'
# #####################################################

# ############
# Input: active actor: i
#        all actors:  actors
# ############

# ############
# Output: Target actor or NA
# ############


target_actor<-function(i,actors){
	
	N<-length(actors)
# ################################################
# Calculate vulnerability of each potential target	
# ################################################
	vulnerability<-rep(0,N)
	
	for(j in 1:N){
  # Total wealth of alliance i if i decided to ask tribute from j
	 total_weath_i<-forming_alliance(i,j,actors)$wealth1
  # Total wealth of alliance j if i decided to ask tribute from j
  	total_weath_j<-forming_alliance(i,j,actors)$wealth2
	# Calculate vulnerability
	vulnerability[j]<-(total_weath_i-total_weath_j)/total_weath_i

	}

# Check if an agent is a target
# Actor i can only a target j if all actors between i and j support actor i.
# Intially everyone is a potential target	
potential_target<-rep(1,N)
potential_target[i]<-0
for(j in c(1:N)[-i]){
	potential_target1<-1
	potential_target2<-1
	j2<-if(i>j)j+1 else j-1
	# First path
  for(k in i:j2){
  	# If someone between i and j does not support i, then 
  	# j is not longer a potential target using path 1
  	if(forming_alliance(i,j,actors)$alliance[k,2]!=i) potential_target1<-0
  }
  # Second path
  for(k in c(1:N)[-c(i:j2,j)])
  {
  	# If someone between i and j does not support i, then 
  	# j is not longer a potential target using path 2
  	  	if(forming_alliance(i,j,actors)$alliance[k,2]!=i) potential_target2<-0
  }
  # If there is a path where all actors support i, then j is a potential target.
potential_target[j]<-max(potential_target1, potential_target2)
}	
# Matrix containing actors, potential actors and the vulnerarbility
	results<-matrix(0, nrow=N,ncol=3)
	results[,1]<-1:N
	results[,2]<-potential_target
	results[,3]<-vulnerability
	results<-results[results[,2]==1,]
# Select actor with highest vulnerability
	results<-results[order(results[,3], decreasing=T),]
	
	output<-if(results[1,3]>0) results[1,1] else NA 
# Output	
	return(output)
}