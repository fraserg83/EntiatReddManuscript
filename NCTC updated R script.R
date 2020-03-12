####Start here####
install.packages("tidyverse")
install.packages("adehabitatHR")

library(tidyverse)
library(readxl)
library(adehabitatHR)

#import the data via import button
attach(Redd_Data)

setwd("D:/Entiat Redd Data")



Redd_Data <- read_excel("D:/Entiat Redd Data/Redd Data.xlsx")
View(Redd_Data)

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



#### Kernal Density####

require(sf)
require(raster)
require(data.table)
require(adehabitatHR)
require(sp)
require(tidyverse)
require(mapview)

# Limit data to one year. 
#Redd_2015<- filter(.data = Redd_Data, Year == "2015")

# First need to make data spatially aware using lon/lat
#Redd_2015<- st_as_sf(Redd_2015, coords = c("Longitude", "Latitude"), crs = "+init=epsg:4326", remove = FALSE)

# Need to make Redd_Data spatially aware
Redd_Data<- st_as_sf(Redd_Data, coords = c("Longitude", "Latitude"), crs = "+init=epsg:4326", remove = FALSE)

# Plots Redd 2015 data on map
mapview(Redd_2015, zcol="Species")

# Creates new data from WA NHD, dsn is location, layer is name of file
streams <- st_read(dsn = "C:/CSP1004", layer = "WA_Hydrography__NHD_Flowline")

# Filter WA NHD data by Entiat River
Entiat <- filter(.data = streams, GNIS_Name == "Entiat River")

# Tell R that Entiat is spatial data, renamed EntiatSpatial
EntiatSpatial <- st_as_sf(Entiat, coords = c("geometry"), crs = "+init=epsg:4326", remove = FALSE)

# Puts EntiatSpatial on map
mapview(EntiatSpatial)

# Puts EntiatSpatial and Redd_2015 on same map
mapview(EntiatSpatial) + mapview(Redd_Data, zcol="Species")

#### Kernel Density ####
km<- seq(from = 20, to = 56, by = 0.5)
den<- density(Redd_Data$Rkm, kernel = "gaussian", n = km, from = 14, to = 60)
outMod<- data.frame(RKM = den$x, Density = den$y)

plot(den)
min(Redd_Data$Rkm)


