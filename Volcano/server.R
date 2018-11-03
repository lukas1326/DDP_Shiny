#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

server <- function(input, output, session) {
        #url <- "https://data.humdata.org/dataset/a60ac839-920d-435a-bf7d-25855602699d/resource/e3b1ecf0-ec47-49f7-9011-6bbb7403ef6d/download/volcano.csv"
        #download.file(url, dest="data/volcano.csv") 
        
        vol <- read.csv("data/volcano.csv")
        vol <- vol %>% filter(!vol$V_Name=="Unnamed")
        vol$content <- paste(
                "<b>",vol$V_Name,"</b>","<br>",
                "Country:",vol$Country
        )
     
        
        output$mymap <- renderLeaflet({
               
                vol <- vol[vol$Country == input$country,]
             
                leaflet() %>%
                        addProviderTiles(providers$Stamen.TonerLite,
                                         options = providerTileOptions(noWrap = TRUE)
                        ) %>%
                        addCircleMarkers(lng=vol$Longitude,lat=vol$Latitude,label = lapply(vol$content,HTML
                        ),
                        stroke = FALSE,fillOpacity = .8,fillColor = "purple",radius = 5
                        )
        })
       
       
}