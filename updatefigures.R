file_info <- data.frame(filename = "ALRS-LPS-estimates",
                        source = "../HMS-newsletter/rec-BFT-estimated-landings-figures/",
                        saveto = "./content/images/rec-BFT-estimated-landings/")

for (i in 1:nrow(file_info)) {
  message(i,": ",file_info$filename[i])
  
  # Get most recent file name in the source directory
  most_recent_file <- sort(list.files(file_info$source[i]), decreasing = TRUE)[1]
  message(most_recent_file)
  
  # Check if the file exists in the Quarto project; update if out of date
  if (!file.exists(paste0(file_info$saveto[i],most_recent_file))) {
    message("Copying ",file_info$filename[i]," to '",file_info$saveto,"' folder...")
    file.copy(from = paste0(file_info$source[i],most_recent_file), to = file_info$saveto[i])
    
  } else {
    message(file_info$filename[i]," already located in '",file_info$saveto,"' folder")
  }
}
