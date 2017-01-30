# #####################################################
#
#
#
# #####################################################




plot_com<-function(actors_c, wealth){

all_values<-wealth[, actors_c]
for(i in 1:length(actors_c))
{
	all_values<-c(all_values, wealth[, actors_c[i]])
	}
max_v<-max(all_values)

plot(wealth[, actors_c[1]], type='l', ylim=c(0, max_v), xlab='Time',ylab='Wealth', xlim=c(0,nrow(wealth)))
lines(wealth[, actors_c[2]], col='red')
legend('topleft',legend=c('Actors',actors_c[1], actors_c[2]),
lty=c(0,1,1), col=c('','black','red'))
#legend('topleft',legend=c('Actors',actors_c[1], actors_c[2], actors_c[3], actors_c[4]),
#lty=c(0,1,1,1,1), col=c('','black','red','green','blue'))

}