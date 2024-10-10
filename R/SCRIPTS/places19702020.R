
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
  dplyr::select(-NAME)

nhgis19702020 <- read_csv("./R/DATA-RAW/nhgis0023_csv/nhgis0023_csv/nhgis0023_ts_nominal_place.csv") %>%
  dplyr::select(NHGISCODE, AV0AA1970:AV0AA2020) %>%
  pivot_longer(!NHGISCODE, names_to = "Variable", values_to = "Pop") %>%
  rename(YEAR = Variable,
         NHGISPLACE = NHGISCODE) %>%
  mutate(YEAR = as.integer(substr(YEAR,6,9)),
         NHGISPLACE = str_pad(NHGISPLACE, 10, side = "right", pad = "0"))

datcom3 <- left_join(datcom2, nhgis19702020) %>%
  mutate(Pop2 = case_when(
    is.na(Pop) ~ PLACE,
    .default = as.character(Pop)
  )) %>%
  dplyr::select(-Pop) %>%
  pivot_wider(names_from = YEAR, values_from = Pop2, values_fill = NA) %>%
  arrange(STATE, NHGISPLACE)
  
datcom3[datcom3 == "NULL"] <- NA