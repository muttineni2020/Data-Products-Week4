# This is server side code for ui.R

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$vc <- renderPrint({input$vcar})
  output$tc <- renderPrint({input$tcar})
  
  output$distPlot <- renderPlot({
    
    #Data frame
    mtcarsCal <- mtcars[,input$vcar] ~ mtcars[,input$tcar]
    mtcars.lm <- lm(formula=mtcarsCal, data=mtcars)
    
    
    # draw the scatter diagram with the specified values
    plot(mtcarsCal, data=mtcars, xlab = input$vcar, ylab = input$tcar)
    if (input$Abline){abline(mtcars.lm,col="blue")}
    
  })
  
})