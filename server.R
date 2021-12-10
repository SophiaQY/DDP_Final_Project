#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


shinyServer(function(input, output){
    
    model <- reactive({
        brushed_data <- brushedPoints(mtcars, input$brush1,
                                      xvar = "hp", yvar = "mpg")
        if(nrow(brushed_data)<2){
            return(NULL)
        }
        lm(mpg ~ hp, data= brushed_data)
    })
    
    output$slopeOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[2]]
        }
    })
    
    output$intOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]]
        }
    })
    
    output$plot1 <- renderPlot({
        plot(mtcars$hp, mtcars$mpg, xlab = "Horse Power", ylab = "Miles per Gallon",
             main = "MPG VS horse power", cex=1.5, pch=16, bty="n")
        if(input$showModel){
            abline(model(), col="blue", lwd=2)
        }
    })
})