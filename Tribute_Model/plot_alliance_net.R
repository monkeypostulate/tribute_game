# #####################################################
#
#
#
# #####################################################



plotg_alliance<-function(history_track, threshold){
	actors<-history_track$actors
	Time_s<-nrow(history_track$wealth)
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


netw<-graph_from_adjacency_matrix(coallitions)
wealth_all<-history_track$wealth[Time_s,]/max(history_track$wealth[Time_s,])
netw <-igraph::set_vertex_attr(netw, 'wealth', index = 1:N, wealth_all)

# plot
plot.igraph(netw, vertex.size=30*V(netw)$wealth,edge.arrow.size=0.01, layout=l)
}