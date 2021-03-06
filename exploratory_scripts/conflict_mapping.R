library(sp)
library(sf)
library(gganimate)
source(here::here("01_data_import.R"))

conflictLocation <- d_drc %>% 
  select(event_date, event_type, fatalities, admin1, admin2, latitude, longitude) %>% 
  filter(admin1 %in% c("Nord-Kivu", "Orientale")) 
#Ituri is under "admin2", which... I have a lot to learn about admin boundaries in DRC

coords <- select(conflictLocation, longitude, latitude)
conflictData <- select(conflictLocation, event_date, admin2, fatalities)
spatialConflict <- SpatialPointsDataFrame(coords = coords, 
                                          data = conflictData,
                                          proj4string = CRS("+proj=longlat +datum=WGS84"))
spatialConflict <- st_as_sf(spatialConflict, coords = c("lon", "lat"), crs = 4326)  
# I know there's an sf only way to do this, but honestly it's late and i'm feeling very incapable

centralAfricaShapefile <- st_read("shapefiles/GLOBAL_ADM2-2/GLOBAL_ADM2.shx")
# oh i probably should have used read_sf here but whatever, it works i guess. 

drcBorders <- centralAfricaShapefile %>% 
  filter(ADM1_NAME %in% c("NORD KIVU", "ITURI")) %>%
  select(ADM2_NAME, ADM1_NAME, ADM2_ALTNA, geometry)
          
spatialConflict$event_date <- as.Date(spatialConflict$event_date, "%d %B %Y")

#animating it because i can

ggplot(spatialConflict) + theme_void() + 
  geom_sf(data = drcBorders, aes(fill = ADM1_NAME)) + 
  geom_sf(data = spatialConflict, aes(size = fatalities), alpha = .7, show.legend = "point") + 
  #labs(title = 'Day: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  #transition_time(event_date) +
  #ease_aes('linear') +
  NULL
#anim_save("kivu_conflict.gif")
#uncomment for gif. i commented it out because it takes forever and i didn't want to accidentally trigger it again.


# theme_void is necessary to make it stop randomly throwing a "polygon edge not found" error - 
# "polygon edge not found" is not reproducible, but github suggests that it's related to the degree symbol
# removing axis ticks entirely seems to fix it. 


# there's that one weird point which is ... probably not in kivu. dunno what to do with it. 