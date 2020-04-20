#James Tweedle
#Fall 2019 CSCI 390
#Lab 9
#11/18/19
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(leaflet)
library(htmltools)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel(img(src="BBBlogo.png",height="30%",width="30%")),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            radioButtons("rb1","Choose a Big Bad Breakfast Location",
                         c("Oxford"="1","Inlet Beach"="2", "Charleston"="3",
                           "Nashville"="4","Birmingham"="5","Homewood"="6",
                           "Florence"="7"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            leafletOutput("BBBMap")
            )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output,session){
    cityData <- reactiveValues()
    output$BBBMap <- renderLeaflet({
        leaflet(options = leafletOptions(zoomsnap=0.1)) %>% 
            addTiles()
        })
    observe({
        cityData$name <- c("Oxford","Inlet Beach","Charleston",
                           "Nashville","Birmingham","Homewood","Florence")
        cityData$address <- c("719 N Lamar","10711 E Hwy 30A","456 Meeting St",
                              "5304 Charlotte Ave","5361 US-280","1926 29th Avenue S",
                              "315 N Court St")
        cityData$state <- c("MS","FL","SC","TN","AL","AL","AL")
        cityData$zip <- c("38655","32461","29403","37209","35242","35209","35630")
        cityData$phone <- c("662.236.2666","850.532.6952","843.459.1800","615.610.3403",
                            "205.490.7568","205.666.7099","256.415.8545")
        cityData$Long <- c("-89.516107","-86.010989","-79.939229","-86.851889","-86.673597",
                           "-86.788178","-87.677771")
        cityData$Lat <- c("34.375572","30.2802131","32.795024","36.152353","33.420757",
                          "33.479881","34.802587")
        if(input$rb1=="1"){
            cityData$LongView=cityData$Long[1]
            cityData$LatView=cityData$Lat[1]
        } else if(input$rb1=="2"){
            cityData$LongView=cityData$Long[2]
            cityData$LatView=cityData$Lat[2]
        } else if(input$rb1=="3"){
            cityData$LongView=cityData$Long[3]
            cityData$LatView=cityData$Lat[3]
        } else if(input$rb1=="4"){
            cityData$LongView=cityData$Long[4]
            cityData$LatView=cityData$Lat[4]
        } else if(input$rb1=="5"){
            cityData$LongView=cityData$Long[5]
            cityData$LatView=cityData$Lat[5]
        } else if(input$rb1=="6"){
            cityData$LongView=cityData$Long[6]
            cityData$LatView=cityData$Lat[6]
        } else if(input$rb1=="7"){
            cityData$LongView=cityData$Long[7]
            cityData$LatView=cityData$Lat[7]
        }
        proxy <-leafletProxy("BBBMap") %>% clearMarkers()
        centrallabel <- sprintf("<b>%s Location</b><br />%s<br />%s,%s %s<br />%s",cityData$name,cityData$address,
                                cityData$name,cityData$state,cityData$zip,cityData$phone) %>% 
            lapply(htmltools::HTML)
        proxy %>% setView(lng=cityData$LongView,lat=cityData$LatView,zoom=15) %>% 
            addMarkers(lng=as.numeric(cityData$Long),lat = as.numeric(cityData$Lat),label = centrallabel,popup = centrallabel)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
