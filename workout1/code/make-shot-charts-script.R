##################################
## Title: make-shot-charts-script.R
## Description: Plotting stage
## Inputs: Shot data tables fro each player
## Outputs: Charts
##################################
library(ggplot2)
library(grid)
library(jpeg)
court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
shots <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
andre <- shots[shots$name == 'Andre Iguodala', ]
draymond <- shots[shots$name == 'Draymond Green', ]
kevin <- shots[shots$name == 'Kevin Durant', ]
klay <- shots[shots$name == 'Klay Thompson', ]
stephen <- shots[shots$name == 'Stephen Curry', ]
andre_shot_chart <- ggplot(data = andre) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
ggsave(filename = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
draymond_shot_chart <- ggplot(data = draymond) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
ggsave(filename = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
kevin_shot_chart <- ggplot(data = kevin) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
ggsave(filename = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
klay_shot_chart <- ggplot(data = klay) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
ggsave(filename = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
stephen_shot_chart <- ggplot(data = stephen) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()
ggsave(filename = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
gsw_shot_charts <- ggplot(data = shots)+ annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') + theme_minimal() + facet_wrap(~name, ncol = 3)
ggsave(filename = "../images/gsw-shot-charts.pdf", width = 8, height = 7)
ggsave(filename = "../images/gsw-shot-charts.png", width = 8, height = 7)

