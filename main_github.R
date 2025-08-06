library(knitr)

#dir <- "F:/1_MSE/ICCAT_MSEweb/github/"
dir <- "C:/Users/Ai Kimoto/Documents/GitHub/iccat-mse-web/"
dirSp <- paste0(dir,"species/")

setwd(dir)

#General page
rmarkdown::render("mse_general.Rmd",params = list(dir= dir), output_file = paste0(dir,"index.html"), run_pandoc = TRUE)

#individual species
sp_list <- c("NALB","BFT","NSWO","WSKJ","multiTT","Other Species")
#nsp <- 1 #1"NALB",2"BFT",3"NSWO",4"WSKJ",5"multiTT"
for (nsp in c(1:5)){
sp <- sp_list[nsp]
rmarkdown::render(paste0(dir,"mse_readme_page.Rmd"),params = list(sp = sp, dir= dir), output_file = paste0(dirSp,sp,"/",sp,"_readme.html"), run_pandoc = TRUE)
rmarkdown::render(paste0(dir,"mse_species.Rmd"),params = list(sp = sp, dir= dir), output_file = paste0(dirSp,sp,"/",sp,"_MSE.html"), run_pandoc = TRUE)
}

#Other Species
rmarkdown::render(paste0(dir,"mse_othersp.Rmd"),params = list(dir= dir), output_file = paste0(dirSp,"others/Other_Species_MSE.html"), run_pandoc = TRUE)

#References
rmarkdown::render(paste0(dir,"mse_reference.Rmd"),params = list(dir= dir), output_file = paste0(dir,"mse_reference.html"), run_pandoc = TRUE)
