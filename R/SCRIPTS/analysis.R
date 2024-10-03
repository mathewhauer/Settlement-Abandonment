library(sf)
library(mapview)
library(tidyverse)

datcom <- data.frame()
for(i in seq(1900,2010, 10)){
  print(i)
  places1900 <- st_read(paste0("./R/DATA-RAW/nhgis0016_shape/US_place_point_", i ,".shp")) %>%
    dplyr::select(STATE, NHGISST, PLACE, NAME, NHGISPLACE, YEAR) # %>%
    # mutate(!!varname := NHGISPLACE) %>%
    # dplyr::select(-YEAR, -NHGISPLACE) %>%
    #st_drop_geometry()
  datcom <- rbind(datcom, places1900)
}

datcom2 <- datcom %>%
  st_drop_geometry() %>%
  dplyr::select(-NAME) %>%
  pivot_wider(names_from = YEAR, values_from = PLACE) %>%
  arrange(STATE, NHGISPLACE)

abandoned <- datcom2 %>%
  filter(is.na(`2010`)) 

abandoned2 <- abandoned %>% dplyr::select(`1900`:`2010`) %>%  rowwise() %>% mutate(n_notNA = sum(!is.na(c_across()))) 

abandoned <- cbind(abandoned, pull(abandoned2, n_notNA)) %>%
 filter(`pull(abandoned2, n_notNA)` >1) 

abandoned19401950 <- datcom2 %>%
  filter(!is.na(`1940`),
         is.na(`1950`))

geometries <- datcom %>%
  dplyr::select(-YEAR, -NAME) %>%
  unique() %>%
  filter(NHGISPLACE %in% abandoned$NHGISPLACE) %>%
  filter(!grepl(" CDP", PLACE)) %>%
  shift_geometry()


  # filter(`2010` == "NULL")

m<- mapview(geometries, zcol = "PLACE")

statefile <- tigris::states(cb = TRUE) %>%  shift_geometry() %>%
  filter(!GEOID  %in% c("60", "66", "69", "72", "78"))

ggplot(statefile) +
  geom_sf(fill = NA) +
  geom_sf()
  theme_void()
  
a <- tm_shape(statefile) +
  tm_polygons(col = "white",
             border.col = "grey") +
  tm_shape(geometries) +
  tm_dots(col = "black") +
  tm_layout(main.title = "All 2600 Candidate Abandoned Settlements")
tmap_save(a, "abandonedmap.png")
mapshot(m, url = paste0(getwd(), "/map.html"))

