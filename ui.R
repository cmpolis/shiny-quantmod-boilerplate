
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("R, Shiny, Quantmod Boilerplate"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput('symbol','Symbol',value='SPY'),
      dateRangeInput('date.range','Data Range', start='2001-01-01', end=as.character(Sys.Date())),
      selectInput('source', 'Data Source', list(Yahoo='yahoo', Google='google'))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("perfPlot")
    )
  )
))
