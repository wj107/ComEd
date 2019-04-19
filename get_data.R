#########################################################
#---------get ComEd hourly load data
#########################################################

require(rvest)

link<-"https://www.comed.com/SiteCollectionDocuments/Historical-Load-Profiles.xls"

download.file(link,destfile="comed_data.xls")

##---re-write with readxl package/tidyverse!!!
require(gdata)

read.xls("comed_data.xls",sheet=1)->single.family.elec
read.xls("comed_data.xls",sheet=2)->multi.family.elec
read.xls("comed_data.xls",sheet=6)->small.bus.elec
read.xls("comed_data.xls",sheet=7)->med.bus.elec
read.xls("comed_data.xls",sheet=8)->streetlight.elec

#----name data
Names<-c("date",paste0(1:24,"h"))
names(single.family.elec)<-Names
names(multi.family.elec)<-Names
names(small.bus.elec)<-Names
names(med.bus.elec)<-Names
names(streetlight.elec)<-Names

#---trim extra columns
single.family.elec<-single.family.elec[,1:25]
multi.family.elec<-multi.family.elec[,1:25]
small.bus.elec<-small.bus.elec[,1:25]
med.bus.elec<-med.bus.elec[,1:25]
streetlight.elec<-streetlight.elec[,1:25]

#---delete large xls file
file.remove("comed_data.xls")


