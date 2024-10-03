library(LexisPlotR)
library(tidyverse)

abandoncol1 <- "black"
  abandoncol <- "darkgray"
cohortcol <- "green"
censcocol <- "yellow"

lexis <- lexis_grid(year_start = 1900, 
                    year_end = 2010, 
                    age_start = 0, 
                    age_end = 100,
                    delta=10,
           lwd = 0.01)   |>
  lexis_year(year = 1940, fill = abandoncol1) |>
  lexis_year(year = 1941, fill = abandoncol) |>
  lexis_year(year = 1942, fill = abandoncol) |>
  lexis_year(year = 1943, fill = abandoncol) |>
  lexis_year(year = 1944, fill = abandoncol) |>
  lexis_year(year = 1945, fill = abandoncol) |>
  lexis_year(year = 1946, fill = abandoncol) |>
  lexis_year(year = 1947, fill = abandoncol) |>
  lexis_year(year = 1948, fill = abandoncol) |>
  lexis_year(year = 1949, fill = abandoncol) |>
  
  lexis_year(year = 1975, fill = censcocol) |>
  lexis_year(year = 1976, fill = censcocol) |>
  lexis_year(year = 1977, fill = censcocol) |>
  lexis_year(year = 1978, fill = censcocol) |>
  lexis_year(year = 1979, fill = censcocol) |>
  lexis_year(year = 1980, fill = censcocol) |>
  lexis_year(year = 1981, fill = censcocol) |>
  lexis_year(year = 1982, fill = censcocol) |>
  lexis_year(year = 1983, fill = censcocol) |>
  lexis_year(year = 1984, fill = censcocol) |>
  lexis_year(year = 1985, fill = censcocol) |>
  lexis_year(year = 1986, fill = censcocol) |>
  lexis_year(year = 1987, fill = censcocol) |>
  lexis_year(year = 1988, fill = censcocol) |>
  lexis_year(year = 1989, fill = censcocol) |>
  lexis_year(year = 1990, fill = censcocol) |>
  lexis_year(year = 1991, fill = censcocol) |>
  lexis_year(year = 1992, fill = censcocol) |>
  lexis_year(year = 1993, fill = censcocol) |>
  lexis_year(year = 1994, fill = censcocol) |>
  lexis_year(year = 1995, fill = censcocol) |>
  lexis_year(year = 1996, fill = censcocol) |>
  lexis_year(year = 1997, fill = censcocol) |>
  lexis_year(year = 1998, fill = censcocol) |>
  lexis_year(year = 1999, fill = censcocol) |>
  lexis_year(year = 2000, fill = censcocol) |>
  lexis_year(year = 2001, fill = censcocol) |>
  lexis_year(year = 2002, fill = censcocol) |>
  lexis_year(year = 2003, fill = censcocol) |>
  lexis_year(year = 2004, fill = censcocol) |>
  
  lexis_cohort(cohort = 1900, fill = cohortcol) |>
  lexis_cohort(cohort = 1901, fill = cohortcol) |>
  lexis_cohort(cohort = 1902, fill = cohortcol) |>
  lexis_cohort(cohort = 1903, fill = cohortcol) |>
  lexis_cohort(cohort = 1904, fill = cohortcol) |>
  lexis_cohort(cohort = 1905, fill = cohortcol) |>
  lexis_cohort(cohort = 1906, fill = cohortcol) |>
  lexis_cohort(cohort = 1907, fill = cohortcol) |>
  lexis_cohort(cohort = 1908, fill = cohortcol) |>
  lexis_cohort(cohort = 1909, fill = cohortcol) |>
  lexis_cohort(cohort = 1910, fill = cohortcol) |>
  lexis_cohort(cohort = 1911, fill = cohortcol) |>
  lexis_cohort(cohort = 1912, fill = cohortcol) |>
  lexis_cohort(cohort = 1913, fill = cohortcol) |>
  lexis_cohort(cohort = 1914, fill = cohortcol) |>
  lexis_cohort(cohort = 1915, fill = cohortcol) |>
  lexis_cohort(cohort = 1916, fill = cohortcol) |>
  lexis_cohort(cohort = 1917, fill = cohortcol) |>
  lexis_cohort(cohort = 1918, fill = cohortcol) |>
  lexis_cohort(cohort = 1919, fill = cohortcol)

lexis2 <- lexis + theme(axis.text=element_text(size=14)) + labs(x="Year", y="Age")
ggsave("lexisfigure.png", lexis2)