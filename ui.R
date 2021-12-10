#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Visualize models"),
    sidebarLayout(
        sidebarPanel(
            h4("Slope and Intercept"),
            textOutput("SlopeOut"),
            textOutput("intOut"),
            checkboxInput("showModel", "Show/Hide model", value = TRUE),
            hr(),
            helpText("1. Use your mouse to select a set of data points to see the fitted model of mpg by hp."),
            hr(),
            helpText("2. Show/Hide model will show/hide a regression line of the selected data.")
        ),
        mainPanel(
            plotOutput("plot1", brush=brushOpts(
                id="brush1"
            ))
        )
    )
))