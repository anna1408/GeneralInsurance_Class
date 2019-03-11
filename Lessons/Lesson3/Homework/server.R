library(shiny)
library(ggplot2)
library(dplyr)

data_KPI_povodne <- read.csv("C:\\GeneralInsurance_Class\\Data\\lesson2_KPI.csv")
data_KPI <- data_KPI_povodne %>% filter_all(all_vars(!is.na(.)))

server <- function(input, output){
  output$graf <- renderPlot({
    ggplot(data = data_KPI,mapping = aes_string(x = "Premium", y = "Expenses", colour = input$colorvar)) +
      geom_point() +
      geom_smooth()
  })
}