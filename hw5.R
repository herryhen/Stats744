## BMB: please do **not** use install.packages() in a script
## this decision should be left to user
## install.packages("rnrfa")

## this is a lot of packages. Do you really need them all?
## Maybe comment what some of the
## less familiar ones are for??
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
library(tmap)  ## BMB: duplicated line
library(mapview)
library(rnrfa)

## I uncommented these so your code would do something ...
map_lnd = tm_shape(lnd) + tm_borders(col="black") + tm_fill(col="white")
tiles = "http://a.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png"
map_lnd + tm_basemap(server = tiles)
mapview(lnd, alpha.regions = 0.15, layer.name="Borough", label="NAME")+
  mapview(nz, layer.name="New Zealand", label="Name") +
  mapview(hawaii, layer.name="Hawaii", label="NAME") +
  mapview(us_states)

## BMB: are NAME and Name the same? why does capitalization differ?

## BMB: where is this from?
## looks similar to this? https://rdrr.io/github/GarrettMooney/moonmisc/src/R/lsp.R
## it's OK to use code from the web but you **MUST** cite your sources.
## otherwise it's plagiarism.
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

## BMB: Error in (function (classes, fdef, mtable)  :
##   unable to find an inherited method for function ‘mapView’ for signature ‘"tmap"’
## does this actually work for you?

## there's almost nothing here (there was *nothing* here that worked at all,
## until I uncommented some stuff.  You didn't explain anything.
## Everything *might* be copied from somewhere, but I can't tell.

## mark: 1.2/3

