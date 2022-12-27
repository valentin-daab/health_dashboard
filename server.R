
server <- function(input, output) {
  
  output$worldMap <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addTimelines(data = stats, layerId = "timeline", timelineOptions = timelineOptions())
  })
  
}
