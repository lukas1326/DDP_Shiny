#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(tidyverse)
vol <- read.csv("data/volcano.csv")
vol <- vol %>% filter(!vol$V_Name=="Unnamed")

ui <- fluidPage(
        titlePanel("Global Volcano Model"),
        HTML("A comprehensive set of information on global volcanic hazard, 
historical events, population exposure, 
vulnerability, and impact has been provided to GAR15 by Global Volcano Model (GVM)
and The International Association of Volcanology and 
Chemistry of the Earth’s Interior (IAVCEI). 
This work is the first of its kind in global coverage and level of contribution 
from a wide network of experts and institutions around the world.
<br>Source:https:\\data.humdata.org/dataset/volcano-population-exposure-index-gvm

             "),
        HTML("<br><br> Instruction: <br> 
                 1. Choose in selection field the country <br> 
                 2. Explore the map zoomed by volcano place <br>
                 3. The purple or red dots are volcano's place. The red one is for highest risk <br>
                 4. The table below shows the subset from the original data by country <br>"),
        selectInput("country",
                    "Countries:",
                choices = unique(sort(vol$Country))),
        leafletOutput("mymap"),
        # Create a new row for the table.
        DT::dataTableOutput("table")
        
)
