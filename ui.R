
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Estimate Samples for a Proportions Test"),

  # User Inputs including alpha, beta values among others
  sidebarLayout(
    sidebarPanel(
        radioButtons("alpha",
                     "Alpha Value:",
                     c("0.01","0.025","0.05", "0.1")),
        radioButtons("tail",
                     "Tails:",
                     c("one", "two")),
        radioButtons("beta",
                     "Beta Value:",
                     c("0.05","0.1","0.2", "0.25")),
        sliderInput(inputId = "p1",
                    label = "p1(%):",
                    min = 0,
                    max = 100,
                    step = 1,
                    value = 8),
        sliderInput(inputId = "p2",
                    label = "p2(%):",
                    min = 0,
                    max = 100,
                    step = 1,
                    value = 10),
        numericInput(inputId = 'r',
                     label = "Ratio:",
                     value = 1,
                     min = 1,
                     max = 10,
                     step = 1),
        numericInput(inputId = 'ph',
                     label = "Samples per Week:",
                     value = 25,
                     min = 1,
                     step =1)
    ),

    # Show a table of the generated sample values
    mainPanel(
      tableOutput("samples")
    )
  )
))
