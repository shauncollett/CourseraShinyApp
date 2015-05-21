library(shiny)

shinyUI(fluidPage(
    # Application Title
    title = "Predicting Automotive Miles Per Gallon",
    titlePanel(h2("Predicting Automotive Miles Per Gallon")),
    p("Cylinders and weight have proven to be highly predictive  of a car's fuel 
        performance - specifically miles per gallon.  Adjust the number of cylinders 
        and weight below to see how MPG is affected.  No submit button is required - 
        the app will automatically update as you change cylinders
      and weight."),
    sidebarLayout(
        sidebarPanel(
            radioButtons("cyl", "Cylinders",
                               c("4" = "4",
                                 "6" = "6",
                                 "8" = "8")),
            sliderInput("wt", "Weight (in pounds)", 1000, 8000, 3000, step = 100, 
                        round = TRUE)
        ),
        mainPanel(
            h3("Predictive Weight"),
            #h4("Cylinders: "), verbatimTextOutput("ocyl"),
            #h4("Weight (pounds): "), verbatimTextOutput("owt"),
            h4("Fuel Efficiency (mpg): "), verbatimTextOutput("ompg"),
            h4("95% MPG Confidence Interval: "), verbatimTextOutput("ompg95")
        )
    )
))

# setwd("~/Box Sync/Play/datasciencecoursera/Developing Data Products/CourseProject/")
# runApp()