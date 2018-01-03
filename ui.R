#
# This is the user-interface portion of the shiny-app.


library(shiny)

# UI for application that shows linear regression analysis for mtcars Data Set
shinyUI(fluidPage(
  
  # Application title
  titlePanel("mtCars Data - Regression analysis"),
  
  # Sidebar with inputs
  sidebarLayout(
    sidebarPanel(
      
      selectInput("vcar", "Select the first variable",
                  choices = c("Miles per Gallon" = "mpg",
                              "Horse Power" = "hp"),
                  selected = "mpg"),
      
      selectInput("tcar", "Select the second variable",
                  choices = c("Automatic Transmission" = "am",
                              "Manual Transmission" = "gear",
                              "Cylinders" = "cyl"),
                  selected = "am"),
      
      checkboxInput("Abline", "Draw Abline", TRUE),
      submitButton('Submit')
      
    ),
    
    # Show plot
    mainPanel(
      h4('Selected first variable (mpg/hp)'),
      verbatimTextOutput("vc"),
      h4('Selected second variable (am/gear/cyl)'),
      verbatimTextOutput("tc"),
      tags$br(),
      h3('Linear Regression analysis'),
      plotOutput("distPlot")
    )
  )
))