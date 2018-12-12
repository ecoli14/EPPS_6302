install.packages('gtrendsR')
library (gtrendsR)

install.packages("ggplot2")
library(ggplot2)

#define the keywords
keywords=c("nigger+niggers")
#set the geographic area: DE = Germany
country=c('US')
#set the time window
time=("all")
#set channels 
channel='web'

#All time plot
general=gtrends(keywords, gprop =channel,geo=country, time = time )
genttrend=general$interest_over_time

plot<-ggplot(data=genttrend, aes(x=date, y=hits,group=keyword,col=keyword))+
  geom_line()+xlab('Time')+ylab('Relative Interest')+ theme_bw()+ scale_color_manual(values=c("#000000"), labels="{Nword}") +
  theme(legend.title = element_blank(),legend.position="bottom",legend.text=element_text(size=12))+ggtitle("Google Search Volume over Time")
plot

trends = gtrends(keywords, gprop =channel,geo=country, time = time )
#select only interst over time 
time_trend=trends$interest_over_time
head(time_trend)

#Plot: Change legend to {Nword}, change color to black
plot<-ggplot(data=time_trend, aes(x=date, y=hits,group=keyword,col=keyword))+
  geom_line()+xlab('Time')+ylab('Relative Interest')+ theme_bw()+
  theme(legend.title = element_blank(),legend.position="bottom",legend.text=element_text(size=12))+ggtitle("Google Search Volume")
plot

#Define Keywors for Trump
keywords=c("nigger + niggers")
#set the geographic area: DE = Germany
country=c('US')
#set the time window
time=("2015-01-01 2018-12-05")
#set channels 
channel='web'

#Setup for plotting
trump=gtrends(keywords, gprop =channel,geo=country, time = time )
trumptrend=trump$interest_over_time

#Plot: Change legend to {Nword} and color to red
plot<-ggplot(data=trumptrend, aes(x=date, y=hits,group=keyword,col=keyword))+
  geom_line()+xlab('Time')+ylab('Relative Interest')+ theme_bw()+ scale_color_manual(values=c("#CC6666"), labels="{Nword}") +
  theme(legend.title = element_blank(),legend.position="bottom",legend.text=element_text(size=12))+ggtitle("Google Search Volume From Trump's Candidacy to Today")
plot

#Keywords for Obama
keywords=c("nigger + niggers")
#set the geographic area: DE = Germany
country=c('US')
#set the time window
time=("2005-01-01 2015-01-01")
#set channels 
channel='web'

obama=gtrends(keywords, gprop =channel,geo=country, time = time )
obamatrend=obama$interest_over_time

plot<-ggplot(data=obamatrend, aes(x=date, y=hits,group=keyword,col=keyword))+
  geom_line()+xlab('Time')+ylab('Relative Interest')+ theme_bw()+ scale_color_manual(values=c("#000066"), labels="{Nword}") + 
  theme(legend.title = element_blank(),legend.position="bottom",legend.text=element_text(size=12))+ggtitle("Google Search Volume From Obama's Candidacy to Start of Trump's Campaign")
plot


#Attempt to gather output for each state
region<-gtrends(c("nigger+niggers"), geo = c("US"), time="2017-01-01 2017-12-31", gprop = "web", branclow_search_volume)$interest_by_region
write.csv(time_trend, "nword_hits.csv")

#only returs first so many states in full
#fix online says to use this...but does not work
devtools::install_github("PMassicotte/gtrendsR", branch = "low-search-volume")

plot(gtrendsR::gtrends(keyword = c("nigger+niggers"), geo = "US", time = "2017-01-01 2017-12-31"))
(gtrendsR::gtrends(keyword = c("nigger+niggers"), geo = "US", time = "2017-01-01 2017-12-31", low_search_volume = TRUE))$interest_by_region



#Extra play code for presentaiton and learning
trump <- gtrends(c("nigger + niggers"), geo = c("US"), time = "2015-01-01 2018-12-05")
plot(trump)

compw <- gtrends(c("Beto O'Rourke", "Ted Cruz"), geo = c("US"), time = "2017-01-01 2018-12-05")
plot(compw)

google.trends = gtrends(c("nigger + niggers"), gprop = "web", time = "all")[[1]]
google.trends = dcast(google.trends, date ~ keyword + geo, value.var = "hits")
rownames(google.trends) = google.trends$date
google.trends$date = NULL

head(google.trends)

write.csv(time_trend, "nword_hits.csv")

time_trend2=trends$interest_by_region
head(time_trend)

google.trends2 = gtrends(c("nigger + niggers"), gprop = "web", time = "2015-01-01 2018-12-05")[[1]]
google.trends = dcast(google.trends, date ~ keyword + geo, value.var = "hits")
rownames(google.trends) = google.trends$date
google.trends$date = NULL

head(google.trends2)

plot<-ggplot(data=google.trends2, aes(x=date, y=hits,group=keyword,col=keyword))+
  geom_line()+xlab('Time')+ylab('Relative Interest')+ theme_bw()+
  theme(legend.title = element_blank(),legend.position="bottom",legend.text=element_text(size=12))+ggtitle("Google Search Volume")
plot

keywords=c("nigger + niggers")
#set the geographic area: DE = Germany
country=c('US')
#set the time window
time=("2017-01-01 2018-01-01")
#set channels 
channel='web'

trends_region = gtrends(keywords, gprop =channel,geo=country, time = time )
#select only interest by region
region_trend=trends$interest_by_region
region_trend

write.csv(region_trend, "nword_region_2018_v03.csv")

plot(gtrendsR::gtrends(keyword = c("nhl", "nfl"), geo = "US", time = "2006-01-01 2018-12-05"))

google.trends2 = gtrends(c("nhl"), gprop = "web", time = "all")[[1]]
google.trends = dcast(google.trends, date ~ keyword + geo, value.var = "hits")
rownames(google.trends) = google.trends$date
google.trends$date = NULL

head(google.trends2)

plot(gtrendsR::gtrends(keyword = c("Trump"), geo = "US", time = "2015-01-01 2018-12-05"))
plot(gtrendsR::gtrends(keyword = c("nigger + niggers"), geo = "US", time = "2015-01-01 2018-12-05"))
plot(gtrendsR::gtrends(keyword = c("Obama"), geo = "US", time = "2007-01-01 2015-01-01"))
plot(gtrendsR::gtrends(keyword = c("nigger+niggers"), geo = "US", time = "2007-01-01 2015-01-01"))
