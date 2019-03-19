#########################################################
#---------get ComEd hourly load data
#########################################################

require(rvest)

link<-"https://www.comed.com/SiteCollectionDocuments/Historical-Load-Profiles.xls"

download.file(link,destfile="comed_data.xls")

##---re-write with readxl package/tidyverse!!!
require(gdata)

read.xls("comed_data.xls")->dat
