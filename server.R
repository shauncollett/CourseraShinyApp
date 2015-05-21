# Shiny Server Component

# Global variables
library(shiny)
data(mtcars)
fit <- lm(mpg ~ cyl + wt, mtcars)

shinyServer(
    function(input, output) {
        # Reactive function, used to streamline the creation of the prediction
        # variable, since it's results are used in multiple outputs.
        prediction <- reactive({
            ncyl <- as.numeric(input$cyl)
            nwt <- as.numeric(input$wt)/1000
            predict(fit, 
                  newdata = data.frame(cyl = ncyl, wt = nwt), 
                  interval = "confidence")})
        
        # Format and assign output variables.
        #output$ocyl <- renderPrint({input$cyl})
        #output$owt <- renderPrint({input$wt})
        output$ompg <- renderPrint({round(prediction()[1], 2)})
        output$ompg95 <- renderPrint({
            paste(round(prediction()[2],2), round(prediction()[3],2), sep = " - ")
        })
    }
)