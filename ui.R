
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Estimate Samples for a Proportions Test"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
#       sliderInput("alpha",
#                   "Alpha Value:",
#                   min = 1,
#                   max = 50,
#                   value = 30),
#       sliderInput("beta",
#                   "Beta Value:",
#                   min =,
#                   max=,
#                   value=,),
        radioButtons("alpha",
                     "Alpha Value:",
                     c("0.01","0.025","0.05", "0.1")),
        radioButtons("tail",
                     "Tails:",
                     c("one", "two")),
        radioButtons("beta",
                     "Beta Value:",
                     c("0.01","0.025","0.05", "0.1")),
        sliderInput(inputId = "p1",label = "p1(%):",min = 0, max = 1, step = 0.01,value = 0.08),
        sliderInput(inputId = "p2",label = "p2(%):",min = 0, max = 1, step = 0.01,value = 0.10),
        numericInput(inputId = 'r',label = "Ratio:",value = 1, min = 1, max = 10, step = 1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tableOutput("samples")
    )
  )
))
