###Preparing data from C. sordidus study (Chagos 2019) to use in nutrient, growth, and reproduction analyses

####------load packages----####
library(tidyverse)

####----------------------------load data------------------------------------####
cso_dat<-read.csv("C_sordidus_used_data_clean.csv", header=TRUE)
str(cso_dat)


####----------------------limit data to mature females/females for which we have gonad samples-----------------------####
##so stage 3 in histology analysis
cso_dat_lfm<-
  cso_dat %>%
  filter(histo_stage == "3")
nrow(cso_dat_lfm) # n = 96


####---------------------more data processiong------------------------####
##2 outliers in terms of weight, definitely a result of error in data recording
##change weight to NA so they arent used in any weight calculations
plot(whole_wt_kg~fork_length_cm, data=cso_dat_lfm)
text(whole_wt_kg~fork_length_cm, labels=sample_ID, data=cso_dat_lfm, cex=0.9, font=2)
##CSO-93 and CSO-94 are the two outliers
cso_dat_lfm$whole_wt_kg[cso_dat_lfm$sample_ID=="CSo-093"]
cso_dat_lfm$whole_wt_kg[cso_dat_lfm$sample_ID=="CSo-094"]
cso_dat_lfm[cso_dat_lfm$whole_wt_kg==0.64,]
cso_dat_lfm[cso_dat_lfm$whole_wt_kg==0.56,]
#weights = 0.64 and 0.56, and these are the only two samples with those weights

cso_dat_lfm<-
  cso_dat_lfm %>%
  mutate(whole_wt_kg = na_if(whole_wt_kg, 0.56),
         whole_wt_kg = na_if(whole_wt_kg, 0.64))
str(cso_dat_lfm)


####----------------------center, log-trasnform variables for later use-----------------------####
cso_dat_lfm <- 
  cso_dat_lfm %>%
  mutate(c_length = fork_length_cm - mean(fork_length_cm),
         c_age = age_final - mean(age_final),
         lN15 = log(N15),
         lNperc = log(N_percent),
         llength = log(fork_length_cm),
         c_llength = llength - mean(llength),
         lweight = log(whole_wt_kg))


#convert whole weight estiamtes to grams, because fishbase a, b parameters in cm and grams,
#so change our units to make comparable
cso_dat_lfm <- 
  cso_dat_lfm %>%
  mutate(whole_wt_g = whole_wt_kg*1000,
         lweight_g = log(whole_wt_g))

###make gonad weight numeric, not factor
cso_dat_lfm <- 
  cso_dat_lfm %>%
  mutate(gonad.weight_g =  as.numeric(as.character(gonad.weight_g)))


####----------------------checking sample sizes-----------------------####
cso_dat_lfm %>% 
  group_by(atoll, island) %>% 
  tally()

cso_dat_lfm %>% 
  tally()


####-----------------------------------Save as .Rdata file-------------------------------####
save(cso_dat_lfm, file = "cso_data.Rdata")
