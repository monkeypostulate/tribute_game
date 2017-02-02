target_actor<-function(i,actors){
	
	N<-length(actors)
# ################################################
# Calculate vulnerability of each potential target	
# ################################################
	vulnerability<-rep(0,N)
	
	for(k in 1:N){
		
	######
		alliance_i<-forming_alliance(i,k,actors)$alliance[forming_alliance(i,k,actors)$alliance[,'allied']==i,]
	 total_weath_i<-forming_alliance(i,k,actors)$wealth1
alliance_j<-forming_alliance(i,k,actors)$alliance[forming_alliance(i,k,actors)$alliance[,'allied']==k,]
	total_weath_j<-forming_alliance(i,k,actors)$wealth2
	
	vulnerability[k]<-(total_weath_i-total_weath_j)/total_weath_i
	######	
#	vulnerability[k]<-(forming_alliance(i,k,actors)$wealth1-forming_alliance(i,k,actors)$wealth2)/forming_alliance(i,k,actors)$wealth1
	}
	# Is it a target?
	

potential_target<-rep(1,N)
potential_target[i]<-0
for(j in c(1:N)[-i]){
	potential_target1<-1
	potential_target2<-1
	j2<-if(i>j)j+1 else j-1
	# First path
  for(k in i:j2){
  	if(forming_alliance(i,j,actors)$alliance[k,2]!=i) potential_target1<-0
  }
  # Second path
  for(k in c(1:N)[-c(i:j2,j)])
  {
  	if(forming_alliance(i,j,actors)$alliance[k,2]!=i) potential_target2<-0
  }
potential_target[j]<-max(potential_target1, potential_target2)
}	
	results<-matrix(0, nrow=N,ncol=3)
	results[,1]<-1:N
	results[,2]<-potential_target
	results[,3]<-vulnerability
	results<-results[results[,2]==1,]
	results<-results[order(results[,3], decreasing=T),]
	output<-if(results[1,3]>0) results[1,1] else NA 
	return(output)
}