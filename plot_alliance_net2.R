# #####################################################



plotg_alliance2<-function(actors,active, target, threshold, size_nodes, fight_chosen, time_thre){
	
    N<-length(actors)
# Layout
  l<-matrix(0,nrow=N,ncol=2)
for(i in 1:N){
  l[i,]<-c(cos(2*(i-1)*pi/N),2*sin(2*(i-1)*pi/N))


}


# Create Network
coallitions<-matrix(0,nrow=N,ncol=N)
rownames(coallitions)<-1:N
colnames(coallitions)<-1:N

for(k in 1:N){
for(k2 in c(1:N)[-k]){

coallitions[k,k2]<- if(actors[[k]]$commitment[k2]>=threshold) 1 else 0
}}


wealth<-rep(0,N)
for(i in 1:N){
	wealth[i]<-actors[[i]]$wealth
}



netw<-graph_from_adjacency_matrix(coallitions)
wealth_all<-wealth/max(wealth)
netw <-igraph::set_vertex_attr(netw, 'wealth', index = 1:N, wealth_all)



a<-active[fight_chosen]
b<-target[fight_chosen]
if(!is.na(b)){
	
title<-paste0("Active actor: ",a,'. Target actor: ',b)
veccol<-forming_alliance(a,b,actors)$alliance[,'allied']
veccol<-replace(veccol, veccol ==a,-1)
 veccol<-replace(veccol, veccol ==b,-2)
veccol<-veccol+3
}
else{
	title<-''
	veccol<-rep(3,N)
}


# plot
if(size_nodes=='Proportional to wealth')
plot.igraph(netw, vertex.size=35* wealth_all,edge.arrow.size=0.01, layout=l, vertex.color=c('#4484CE','#F19F4D', 'gray60')[veccol], main=title, xlab=paste0('Period:', time_thre, '. Threshold: ', threshold))

if(size_nodes=='Normal')
plot.igraph(netw, vertex.size=35,edge.arrow.size=0.01, layout=l, vertex.color=c('#4484CE','#F19F4D', 'gray60')[veccol], main=title, xlab=paste0('Period:', time_thre, '. Threshold: ', threshold))


}