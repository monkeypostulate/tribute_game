# #####################################################
#
# Tribute Model:
# Function: Creates plot showing the wealth of alliances
# Author: Abel Camacho Guardian
# This file is subject to the terms and conditions defined in
# file 'LICENSE.txt'
# #####################################################

# Input

plot_barchar<-function(history_track, time_thre, fight_chosen){
	
 
 
i<-history_track$active$active[time_thre, fight_chosen]
fight_chosen<-fight_chosen+3
j<-history_track$active$active[time_thre, fight_chosen]
	
	actors<-history_track$actors[[time_thre]]
	
	if(!is.na(j)){
	alliance_i<-forming_alliance(i,j,actors)$alliance[forming_alliance(i,j,actors)$alliance[,'allied']==i,]
	 total_weath_i<-forming_alliance(i,j,actors)$wealth1

alliance_j<-forming_alliance(i,j,actors)$alliance[forming_alliance(i,j,actors)$alliance[,'allied']==j,]
	total_weath_j<-forming_alliance(i,j,actors)$wealth2

	
	cc1<-alliance_i[,c('id','allied','wealth')]
	cc2<-alliance_j[,c('id','allied','wealth')]
	
	c1<-as.matrix(cc1[,c(1,3)])
	c2<-as.matrix(cc2[,c(1,3)])
c1<-data.frame(c1)
c1[,1]<-as.character(c1[,1])

c2<-data.frame(c2)
c2[,1]<-as.character(c2[,1])

g1<-ggplot(data=c1, aes(x=id, y=wealth))+geom_bar(stat='identity', colour='black', fill=rgb(1,0,0))+
ylim(0,max(c1[,'wealth'],c2[,'wealth'])+1)+ggtitle('Active Alliance')+xlab('Actors')+theme(   axis.text = element_text(size = 14),
    legend.key = element_rect(fill = "gray80"),
    legend.background = element_rect(fill = "white"),
    legend.position = c(0.14, 0.80),
    panel.grid.major = element_line(colour = "grey90"),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "white")
)

g2<-ggplot(data=c2, aes(x=id, y=wealth))+geom_bar(stat='identity', colour='black', fill=rgb(0,0,1))+
ylim(0,max(c1[,'wealth'],c2[,'wealth'])+1)+ggtitle('Target Alliance')+xlab('Actors')+theme(   axis.text = element_text(size = 14),
    legend.key = element_rect(fill = "gray80"),
    legend.background = element_rect(fill = "white"),
    legend.position = c(0.14, 0.80),
    panel.grid.major = element_line(colour = "grey90"),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "white")
)

grid.arrange(g1,g2, nrow=1)
 
}	

if(is.na(j)){	
plot(1:10,1:10,xlab='',ylab='', type='n', xaxt='n', yaxt='n', main='Active actor did not target anyone')	}
}