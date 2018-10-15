#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(dplyr)
library(shiny)
library(leaflet)

dir<-"C:/HY/Projects/Washington Metro leaflet"
dfConcise<-read.csv(paste(dir, "Concise list of stations.csv", sep="/"),
                    stringsAsFactors = FALSE)
dfConcise<-dfConcise %>% mutate(Opened = as.Date(Opened))

shinyUI(fluidPage(
  sliderInput("histDate", "Date",
              min(dfConcise$Opened), max(dfConcise$Opened),
              value = as.Date("1976-12-31"), step = 1),
  leafletOutput("mymap"),
  p()
))
