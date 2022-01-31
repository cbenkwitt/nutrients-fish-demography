# nutrients-fish-demography
Data and code for "Natural nutrient subsidies alter demographic trade-offs in a functionally important coral-reef fish" by Benkwitt CE, Taylor BM, Meekan MG, Graham NAG. 2021. Scientific Reports 11:12575.

Contains all data (.csv and .Rdata files), scripts for analysis (.R and .Rmd files), and Bayesian models (.Rds files). 

Metadata for csv data files:

C_sordidus_used_data_clean.csv - contains individual-level data for all female Chlorurus sordidus (n = 116) from lagoon-side of rat-free versus rat-infested islands, collected March 2019.

Column metadata:
 $ sample_ID      : unique individual ID, Factor w/ 116 levels
 $ collection_date: day-month-year, Factor w/ 7 levels
 $ atoll          : atoll where individual collected, Factor w/ 3 levels 
 $ island         : island where individual collected, Factor w/ 9 levels
 $ treatment      : is the island rat-free with many seabirds ("birdy") or rat-infested with few islands ("ratty"), Factor w/ 2 levels 
 $ phase          : IP = Initial Phase, Factor w/ 1 level
 $ fork_length_cm : measured fork length (= total length for this species), cm, num
 $ whole_wt_kg    : measured whole weight, kg, num
 $ sex            : identified sex from macroscopic gonad inspection, f = female, Factor w/ 1 level
 $ macro_stage    : identified reproductive stage from macroscopic gonad inspection, Factor w/ 4 levels
 $ gonad_lobes    : number of gonad lobes saved, int
 $ gonad.weight_g : measured gonad weight, g, num
 $ histo_stage    : identified reproductive stage from histological analysis, Factor w/ 4 levels
 $ otolith_wt_g   : measured otolith weight, g, num
 $ age_final      : measured age, years, int
 $ N15            : measured deltaN15 in muscle sample, num
 $ N_percent      : measured percent nitrogen in muscle sample, num
 
 Chagos_birds_rats_UVC_data_2018_2019.csv - contains underwater visual census data for all parrotfish counted in 2018 and 2019. 
 
Column metadata:
 $ Year       : year of survey, most islands in 2018 but Eagle in 2019, int
 $ Atoll      : atoll where survey conducted, Factor w/ 3 levels 
 $ Island     : island where survey conducted, Factor w/ 10 levels (10 instead of 11 because no parrotfish observed around South Brother)
 $ Treatment  : is the island rat-free with many seabirds ("No_rats") or rat-infested with few islands ("Rats"), Factor w/ 2 levels 
 $ Transect   : int  1-4
 $ Area       : transect area, in meters squared, int 150
 $ Family     : Factor w/ 1 level "Scaridae"
 $ Species    : Factor w/ 14 levels
 $ Function   : Factor w/ 1 level "Herbivore"
 $ Structure  : structural complexity of transect, 0-5 scale, num
 $ Coral_cover: percent hard coral cover of transect, num 
 $ Length     : total length of individual fish, estimated to the nearest cm, int
 $ Biomass    : biomass of individual fish, kg/ha, num
 $ Abundance  : density of individaul fish, ind/ha, num 
 
Please contact Dr. Casey Benkwitt (c.benkwitt@lancaster.ac.uk) for any questions or to inquire about using these data.
