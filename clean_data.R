############################################################
#---------------clean ComEd data for analysis
############################################################

#---eliminate extra columns
dat<-dat[,1:25]

#----fixup column names
names(dat)<-c("date",1:24)

