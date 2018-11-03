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
        
        selectInput("country",
                    "Countries:",
                choices = unique(sort(vol$Country))),
        leafletOutput("mymap"),
        # Create a new row for the table.
        DT::dataTableOutput("table")
        
)
