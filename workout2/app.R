#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Steven's Shiny App1"),
   fluidRow(
     column(4, 
            sliderInput("initial",
                        "Initial Amount",
                        min = 0,
                        max = 100000,
                        value = 1000, 
                        step = 500), 
            sliderInput("contrib", 
                        "Annual Contribution", 
                        min = 0, 
                        max = 50000, 
                        value = 2000,
                        step = 500)
            ), 
     column(4, 
            sliderInput("return", 
                           "Return Rate (in %)", 
                           min = 0, 
                           max = 20,
                           value = 5, 
                           step = 1), 
            sliderInput("growth", 
                        "Growth Rate (in %)", 
                        min = 0, 
                        max = 20, 
                        value = 2, 
                        step = 1)
            ), 
     column(4, 
            sliderInput("years", 
                        "Years", 
                        min = 0, 
                        max = 50, 
                        value = 20, 
                        step = 1), 
            selectInput("is_facet", 
                        "Facet?", 
                        choices = c("No", "Yes"))
            )
   ),
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot"),
         tableOutput("table")
      )
)

future_value <- function(amount, rate, years) {
  fv = amount * (1 + rate) ^ years
  return(fv)
}

annuity <- function(contrib, rate, years) {
  fv_a = contrib * (((1 + rate) ^ years - 1) / rate)
  return(fv_a)
}

growing_annuity <- function(contrib, rate, growth, years) {
  fvga = contrib * (((1 + rate) ^ years - (1 + growth) ^ years) / (rate - growth))
  return(fvga)
}

# Define server logic required to draw a histogram
server <- function(input, output) {
  dat <- reactive({
    year <- c(0:input$years)
    no_contrib <- c(0:input$years)
    fixed_contrib <- c(0:input$years)
    growing_contrib <- c(0:input$years)
    for (y in year) {
      no_contrib[y + 1] = future_value(input$initial, input$return / 100, y)
      fixed_contrib[y + 1] = future_value(input$initial, input$return / 100, y) + annuity(contrib = input$contrib, rate = input$return / 100, years = y)
      growing_contrib[y + 1] = future_value(input$initial, input$return / 100, y) + growing_annuity(contrib = input$contrib, rate = input$return / 100, growth = input$growth / 100, years = y)
    }
    dat <- data.frame('year' = year, 'no_contrib' = no_contrib, 'fixed_contrib' = fixed_contrib, 'growing_contrib' = growing_contrib)
    return(dat)
  })
   
   output$distPlot <- renderPlot({
     dat_melt <- melt(dat(), id.vars = 'year')
     if (input$is_facet == 'No') {
       ggplot(dat_melt, aes(x = year, y = value, color = variable)) + geom_point() + geom_line()
     } else {
       ggplot(dat_melt, aes(x = year, y = value, color = variable)) + geom_point() + geom_line() + facet_wrap(~variable, ncol = 3) + ggtitle("Timelines")
     }
   })
   
   output$table <- renderTable({
     dat()
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

