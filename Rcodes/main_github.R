library(knitr)

#dir <- "F:/1_MSE/ICCAT_MSEweb/github/"
dir <- "C:/Users/Ai Kimoto/Documents/GitHub/iccat-mse-web/"
dirR <- "C:/Users/Ai Kimoto/Documents/GitHub/iccat-mse-web/Rcodes/"
dirSp <- paste0(dir,"species/")

setwd(dir)

#General page
rmarkdown::render(paste0(dirR,"mse_general.Rmd"),params = list(dir= dir), output_file = paste0(dir,"index.html"), run_pandoc = TRUE)

#individual species
sp_list <- c("NALB","BFT","NSWO","WSKJ","multiTT","SALB","BSH","Other Species","GEN")
#nsp <- 6 #1"NALB",2"BFT",3"NSWO",4"WSKJ",5"multiTT",6"SALB",7"BSH"
for (nsp in c(1:5)){
sp <- sp_list[nsp]
rmarkdown::render(paste0(dirR,"mse_readme_page.Rmd"),params = list(sp = sp, dir= dir), output_file = paste0(dir,"species/",sp,"_readme.html"), run_pandoc = TRUE)
rmarkdown::render(paste0(dirR,"mse_species.Rmd"),params = list(sp = sp, dir= dir), output_file = paste0(dir,"species/",sp,"_MSE.html"), run_pandoc = TRUE)
}

for (nsp in c(6:7)){
sp <- sp_list[nsp]
rmarkdown::render(paste0(dirR,"mse_species_short.Rmd"),params = list(sp = sp, dir= dir), output_file = paste0(dir,"species/",sp,"_MSE.html"), run_pandoc = TRUE)
}

#Other Species
rmarkdown::render(paste0(dirR,"mse_othersp.Rmd"),params = list(dir= dir), output_file = paste0(dir,"species/Other_Species_MSE.html"), run_pandoc = TRUE)

#References
rmarkdown::render(paste0(dirR,"mse_reference.Rmd"),params = list(dir= dir), output_file = paste0(dir,"species/mse_reference.html"), run_pandoc = TRUE)

