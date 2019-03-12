##################################
## Title: make-shot-data-script.R
## Description: Data preparation stage
## Inputs: Five shot data tables fro each player
## Outputs: A new table and Summaries of modified table and newly created combined table.
##################################
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
curry$name <- c("Stephen Curry")
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
iguodala$name <- c("Andre Iguodala")
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
green$name <- c("Draymond Green")
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
durant$name <- c("Kevin Durant")
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
thompson$name <- c("Klay Thompson")
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- c("shot_yes")
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- c("shot_no")
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- c("shot_yes")
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- c("shot_no")
green$shot_made_flag[green$shot_made_flag == 'y'] <- c("shot_yes")
green$shot_made_flag[green$shot_made_flag == 'n'] <- c("shot_no")
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- c("shot_yes")
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- c("shot_no")
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- c("shot_yes")
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- c("shot_no")
curry$minute <- 12 * curry$period - curry$minutes_remaining
iguodala$minute <- 12 * iguodala$period - iguodala$minutes_remaining
green$minute <- 12 * green$period - green$minutes_remaining
durant$minute <- 12 * durant$period - durant$minutes_remaining
thompson$minute <- 12 * thompson$period - thompson$minutes_remaining
sink("../output/stephen-curry-summary.txt")
summary(curry)
sink()
sink("../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()
sink("../output/draymond-green-summary.txt")
summary(green)
sink()
sink("../output/kevin-durant-summary.txt")
summary(durant)
sink()
sink("../output/klay-thompson-summary.txt")
summary(thompson)
sink()
shots <- rbind(curry, iguodala, green, durant, thompson)
write.csv(shots, "../data/shots-data.csv")
sink("../output/shots-data-summary.txt")
summary(shots)
sink()

