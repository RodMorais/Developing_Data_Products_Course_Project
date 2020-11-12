# Coursera - Developing Data Products Course Project
# Shiny Application and Reproducible Pitch 
# MTCARS data set analysis: MPG and type of transmission Evaluate the relationship between 
# consumption of the engine, and type of transmission 

library(shiny) 
library(datasets) 
library(dplyr) 

shinyServer(function(input, output) { 

    # Show the cars that correspond to the filters 
    output$table <- renderDataTable({ 
        disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1) 
        hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1) 
        data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg,  
                          GasExp = input$dist/mpg*input$cost, 
                          Cylinders = cyl, Displacement = disp, Horsepower = hp,  
                          Transmission = am) 
        data <- filter(data, GasExp <= input$gas, Cylinders %in% input$cyl,  
                       Displacement %in% disp_seq, Horsepower %in% hp_seq, Transmission %in% input$am) 
        data <- mutate(data, Transmission = ifelse(Transmission == 0, "Automatic", "Manual")) 
        data <- arrange(data, GasExp) 
        data 
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 15)) 
}) 