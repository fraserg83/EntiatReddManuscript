#selects data
attach(Entiat_Redd_Data_rkm_2003_2016)

#plots redd distribution by rkm annually color is spc
ggplot(data = Entiat_Redd_Data_rkm_2003_2016) + geom_point(mapping = aes(x = rkm, y = Year, color = Spc))

ggplot(data = Entiat_Redd_Data_rkm_2003_2016) + geom_point(mapping = aes(x = rkm, y = Year, color = Spc))

ggplot(data = Entiat_Redd_Data_rkm_2003_2016) + geom_point(mapping = aes(x = rkm, y = Year, color = Spc))

attach(Redd)

#Histogram of total redds by 1.0 rkm increments
ggplot(data = Redd) + geom_point(mapping = aes(x = rkmround, y = Redd, color = Spc)) + facet_wrap(~ Year, nrow = 3)

#Histogram of total redds by 1.0 rkm increments by species
ggplot(data = Redd) + geom_bar(mapping = aes(x = rkmround, color = Spc))

#Histogram of total redds by 1.0 rkm increments by species facet wrap by year
ggplot(data = Redd) + geom_bar(mapping = aes(x = rkmround, color = Spc)) + facet_wrap(~ Year, nrow = 3)

#Histogram of total redds by 1.0 rkm increments by species facet wrap by year fill by species
ggplot(data = Redd) + geom_bar(mapping = aes(x = rkmround, fill = Spc)) + facet_wrap(~ Year, nrow = 3)

#Histogram of total redds by 1.0 rkm increments by species facet wrap by year fill by species
ggplot(data = Redd) + geom_col(mapping = aes(x = rkmround, y = Redd, fill = Spc)) + facet_wrap(~ Year, nrow = 3)

attach(Redd_Data)

ggplot(data = Redd_Data) + geom_point(mapping = aes(x = rkm, y = Year, color = Spc))

####Start here####
install.packages("tidyverse")

library(tidyverse)

attach(Redd_Data)

ggplot(data = Redd_Data) + geom_point(mapping = aes(x = Rkm, y = Year, color = Species))

#Histogram of total redds by 1.0 rkm increments by species facet wrap by year fill by species with color scheme reversed
ggplot(data = Redd_Data) + geom_col(mapping = aes(x = Rkm, y = Redd, fill = Species)) + scale_fill_brewer(palette = "Set1", direction = -1) + facet_wrap(~ Year, nrow = 3)

#Histogram of total redds by Jweek by species facet wrap by year fill by species with color scheme reversed
ggplot(data = Redd_Data) + geom_col(mapping = aes(x = Week, y = Redd, fill = Species)) + scale_fill_brewer(palette = "Set1", direction = -1) + facet_wrap(~ Year, nrow = 3)

#Histogram of total redds by Jweek by species facet wrap by year fill by species with color scheme reversed and background gridlines removed
ggplot(data = Redd_Data) + geom_col(mapping = aes(x = Week, y = Redd, fill = Species)) + scale_fill_brewer(palette = "Set1", direction = -1) +theme(panel.border = element_blank(),
                                                                                                                                                panel.grid.major = element_blank(),
                                                                                                                                                 panel.grid.minor = element_blank(), 
                                                                                                                                                axis.line = element_line(size = 0.5, linetype = "solid", colour = "black")) + facet_wrap(~ Year, nrow = 3)

#Histogram of total redds by Jweek by species facet wrap by year fill by species with color scheme reversed and background gridlines removed
ggplot(data = Redd_Data) + geom_col(mapping = aes(x = Week, y = Redd, fill = Species)) + scale_fill_brewer(palette = "Set1", direction = -1) +theme(panel.grid.minor = element_blank(), panel.grid.major = element_blank(), axis.line = element_line(size = 0.5, linetype = "solid", colour = "black")) + facet_wrap(~ Year, nrow = 3) + theme(strip.text.x = element_text(size=12, face = "bold"))                 

#Histogram of total redds by Rkm by species facet wrap by year fill by species with color scheme reversed and background gridlines removed
ggplot(data = Redd_Data) + geom_col(mapping = aes(x = Rkm, y = Redd, fill = Species)) + scale_fill_brewer(palette = "Set1", direction = -1)+theme(panel.grid.minor = element_blank(), panel.grid.major = element_blank(), axis.line = element_line(size = 0.5, linetype = "solid", colour = "black")) + facet_wrap(~ Year, nrow = 3) + theme(strip.text.x = element_text(size=12, face = "bold"))                                                                  

#Install Deducer
install.packages(c("JGR","Deducer","DeducerExtras"))
library(Deducer)
JGR()
