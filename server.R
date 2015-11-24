
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(quantmod)

shinyServer(function(input, output) {
  
  tickerData <- reactive({
    getSymbols(input$symbol,
      src = input$source, 
      from = input$date.range[1],
      to = input$date.range[2],
      auto.assign = FALSE)
  })

  output$perfPlot <- renderPlot({

    chartSeries(tickerData(),
      theme = chartTheme("white"), 
      type = "line",
      TA = NULL)
  })

})
