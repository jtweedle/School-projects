#James Tweedle
#Activity 12
#Shiny
#Partners:Diego Reyes, Maggie Green, Adam Whitten

#load libraries
library(shiny)
library(htmltools)
library(leaflet)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Central BBQ"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            radioButtons("rb1","Choose a Central BBQ Location",c("Downtown"="1","Poplar"="2"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           leafletOutput("CentralMap")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output){
    CentralData <- reactiveValues()
    output$CentralMap <- renderLeaflet({
        leaflet(options=leafletOptions(zoomsnap=0.1))%>% 
            addTiles()
})
observe({
    CentralData$name <- c("Downtown","Poplar")
    CentralData$address <- c("147 E Butler Ave 38102","6201 Poplar Ave 38119")
    CentralData$phone <- c("901.672.7760","901.417.7962")
    CentralData$long <- c("-90.057134","-89.856992")
    CentralData$lat <- c("35.134117","35.101341")
    if(input$rb1=="1"){
        CentralData$LongView=CentralData$long[1]
        CentralData$LatView=CentralData$lat[1]
    } else{
        CentralData$LongView=CentralData$long[2]
        CentralData$LatView=CentralData$lat[2]
    }
    proxy <-leafletProxy("CentralMap") %>% clearMarkers()

    centrallabel <- sprintf("<b>%s</b><br />%s<br />%s",CentralData$name,CentralData$address,CentralData$phone) %>% 
        lapply(htmltools::HTML)
    proxy %>% setView(lng = CentralData$LongView,lat=CentralData$LatView,zoom=15) %>% 
        addMarkers(lng=as.numeric(CentralData$long),lat=as.numeric(CentralData$lat),label = centrallabel,popup = centrallabel)

    
    
    })
}
    
    

# Run the application 
shinyApp(ui = ui, server = server)
