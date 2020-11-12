# Coursera - Developing Data Products Course Project
# Shiny Application and Reproducible Pitch 
# MTCARS data set analysis: MPG and type of transmission Evaluate the relationship between 
# consumption of the engine, and type of transmission 

library(shiny)
library(markdown)

shinyUI(navbarPage("Motor Trend Car Road Tests",
                   tabPanel("About",
                            mainPanel( 
                                includeMarkdown("about.Rmd")
                            )
                   ),                    tabPanel("Main Panel",
                            # Sidebar
                            sidebarLayout( 
                                sidebarPanel( 
                                    helpText("Below you can provide information and explore which cars from the dataset are more efficient."),
                                    numericInput('dist', 'Distance (in miles):', 100, min = 1, max = 1000),
                                    numericInput('cost', 'Gasoline price (per gallon):', 2.11, min = 2, max = 5, step = 0.01),
                                    numericInput('gas', 'Maximum expenditure on gasoline:', 50, min = 1, max = 1000),
                                    checkboxGroupInput('cyl', 'No. of cylinders:', c("Four" = 4, "Six" = 6, "Eight" = 8), selected = c(4,6,8)), 
                                    sliderInput('hp', 'Horsepower:', min = 50, max = 340, value = c(50,200), step = 10),
                                    sliderInput('disp', 'Displacement:', min = 70, max = 480, value = c(70,280), step = 10),
                                    checkboxGroupInput('am', 'Transmission:', c("Manual" = 1, "Automatic" = 0), selected = c(1,0))
                                ),
                                mainPanel( 
                                    dataTableOutput('table')
                                )
                            )
                   )

)
)