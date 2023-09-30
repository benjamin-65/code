

library(ggmap)
library(ggplot2)
library(readxl)
library(ggrepel)
register_google("AIzaSyBoG8AJwAXv7gvCCrQidgLvAtw-ULZqu5c")
garcia_med_data <- read_excel("garcia_med_data.xlsx", sheet = 4)

garc_fac <- read_excel("garcia_med_data.xlsx", sheet = 5)







garcia_med_data$zipcode[5] <- "doral, fl"

garcia_med_data$zipcode <- as.character(garcia_med_data$zipcode)
bsm <- geocode(garcia_med_data$zipcode)
garcia_med_data <- cbind(garcia_med_data, bsm)


garc_fac$Zipcode <- as.character(garc_fac$Zipcode)

asm <- geocode(garc_fac$Zipcode)

garc_fac <- cbind(garc_fac, asm)




mia <- geocode("miami, fl")

mia_map <- get_map(location = mia, zoom = 10)
Map.somp <- ggmap(mia_map)
#Map.somp



garc_pat_map <- Map.somp + geom_point(data = garcia_med_data, aes(x = garcia_med_data$lon, 
                                                          y = garcia_med_data$lat, shape = garcia_med_data$facility), 
                                      color = "blue", size = 1)
garc_fac_pat_map <- garc_pat_map + geom_point(data = garc_fac, aes(x = garc_fac$lon,
                                                                  y = garc_fac$lat, shape = garc_fac$`Hospital/Facility`),
                                              color = "red", size = 1)
garc_fac_pat_map 
