library(lubridate)



# group_by date & country -> count ----------------------------------------
stats <- db$aggregate(
  pipeline = '[
      {
         "$group": {
            "_id": {
               "field1": "$Location_cities_country.author1.country",
               "field2": "$date_accepted"
            },
            "count": { "$sum": 1 }
         }
      },
      {
         "$project": {
            "_id": 0,
            "country": "$_id.field1",
            "date": "$_id.field2",
            "count": 1
         }
      }
   ]'
)


stats$date <- ymd(stats$date, tz = "UTC")
