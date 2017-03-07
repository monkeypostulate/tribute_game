# #####################################################
#
# Tribute Model:
# Function: Creates plot showing the wealth trend of two actors
# Author: Abel Camacho Guardian
# This file is subject to the terms and conditions defined in
# file 'LICENSE.txt'
# #####################################################

# ###############
# Input: actors (i,j)
#        wealth of actors: walth
# ###############

# ###############
# Output: plot
# ###############


plot_com<-function(actors_c, wealth){


# number of periods
n<-nrow(wealth)

# Data:
# First column period
# second column wealth of actor i
# second column wealth of actor j
data_plotted<-matrix(0,nrow=n, ncol=3)
data_plotted[,1]<-1:n

# actor i equals actors_c[1]
# actor j equals actors_c[2]
data_plotted[,2]<-wealth[,actors_c[1]]
data_plotted[,3]<-wealth[,actors_c[2]]

# Transform matrix as data.frame
data_plotted<-data.frame(data_plotted)
# Name variables 
names(data_plotted)<-c('id','wealth1','wealth2')

actor1<-paste0('Actor ', actors_c[1])
actor2<-paste0('Actor ', actors_c[2])

# Crate plot
ggplot(data= data_plotted)+geom_line(aes(x=id,y=wealth1,colour=actor1))+geom_point(aes(x=id,y=wealth1,colour=actor1))+
geom_line(aes(x=id,y=wealth2, colour = actor2))+
geom_point(aes(x=id,y=wealth2, colour = actor2))+
xlab('Time')+ylab('Wealth')+theme(   axis.text = element_text(size = 14),
    legend.key = element_rect(fill = "gray80"),
    legend.background = element_rect(fill = "white"),
    legend.position = c(0.14, 0.80),
    panel.grid.major = element_line(colour = "grey90"),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "white")
)+scale_colour_manual('',breaks=c(actor1, actor2),values=c('red','blue'))





}