install.packages("rnrfa")


library(ggmap)
library(tidyverse)
library(sf)
library(googleway)
library(ggspatial)
library(rnaturalearth)
library(rnaturalearthdata)
library(geogrid)
library(viridis)
library(gganimate)
library(tmap)
library(spData) #dataset
library(spDataLarge) #dataset
library(tmap)
library(mapview)
library(rnrfa)

#map_lnd = tm_shape(lnd) + tm_borders(col="black") + tm_fill(col="white")
# tiles = "http://a.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png"
# map_lnd + tm_basemap(server = tiles)
#mapview(lnd, alpha.regions = 0.15, layer.name="Borough", label="NAME")+
#  mapview(nz, layer.name="New Zealand", label="Name") +
#  mapview(hawaii, layer.name="Hawaii", label="NAME") +
#  mapview(us_states)

lsp <- function (package, all.names = FALSE, pattern) {
  package <- deparse(substitute(package))
  ls(pos = paste("package", package, sep = ":"), all.names = all.names, 
     pattern = pattern)
}
lsp(rnrfa)

tmap_mode("view") #interactive map
mapview(world, alpha.regions = 0.15, layer.name="Countries", label="name") +
  tm_basemap("OpenStreetMap")

#I was trying to create an interactive map that showed the world countries but I ran out of time to do a stronger concept.
