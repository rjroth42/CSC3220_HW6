# server.R
source("helpers.R")
counties = readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {

    output$map <- renderPlot({
      text = input$var

      color = switch(text, 
                     "Percent White" = "green", 
                     "Percent Black" = "blue", 
                     "Percent Hispanic" = "red", 
                     "Percent Asian" = "yellow" )
      var = switch(text, 
                     "Percent White"    = counties[,3], 
                     "Percent Black"    = counties[,4], 
                     "Percent Hispanic" = counties[,5], 
                     "Percent Asian"    = counties[,6] )
     
                     
      percent_map(var , color, text, input$range[1], input$range[2])
    })
      
  }
)
    