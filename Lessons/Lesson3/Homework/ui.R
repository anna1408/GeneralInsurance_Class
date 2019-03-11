library(dplyr)

data_KPI_povodne <- read.csv("C:\\GeneralInsurance_Class\\Data\\lesson2_KPI.csv")
data_KPI <- data_KPI_povodne %>% filter_all(all_vars(!is.na(.)))


ui <- fluidPage(
  titlePanel("Scatter plot with colour"),
  
  
  sidebarLayout
  (
    sidebarPanel(
    
    selectInput("colorvar", "Colouring Var:", 
                choices=colnames(data_KPI[,1:5]))
    ),
    
    mainPanel(
      plotOutput("graf")  
    )
  )
)
