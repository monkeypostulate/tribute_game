# #####################################################
#
# Tribute Model:
# Function: create actors
# Author: Abel Camacho Guardian
# This file is subject to the terms and conditions defined in
# file 'LICENSE.txt'
# #####################################################

actor<-function(position,wealth,commitment){
# An actor is defined by:
# It position in the network position
# Its wealth
# Its c commitment to other actors	
	actor<-list()
	actor$position<-position
	actor$wealth<-wealth
	actor$commitment<-commitment
	
	return(actor)
	
}




