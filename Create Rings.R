library(tidyverse)
library(data.table)
library(raster)
library(sf)

https://gis.stackexchange.com/questions/229453/create-a-circle-of-defined-radius-around-a-point-and-then-find-the-overlapping-a

a <- 'F:\\Taxi_Data\\CitiBike'
setwd(a)

# Load dockstation data
dock <- fread('Docking_Station_Data_Trim.csv')

# Convert to sf
dock_sf <- dock %>% 
  st_as_sf(coords = c("Station_Long", "Station_Lat"), crs = 4326) %>% 
  st_transform(2263) # Reproject to EPSG:2263, this is for NY and will allow for equal circle diameter 

# Create ring around point thats 100m
dock_sf_ring <- st_buffer(dock_sf, dist = 100)
