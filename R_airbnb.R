airbnb <- read_csv("C:/Users/fahad/Downloads/tomslee_airbnb_belgium_1454_2017-07-14.csv")
print(airbnb, n = 25, width = 100)

head(airbnb$overall_satisfaction)

airbnb$overall_satisfaction_100 <- airbnb$overall_satisfaction * 20

#transform variables with the mutate function:
airbnb <- mutate(airbnb, room_id = factor(room_id), host_id = factor(host_id), overall_satisfaction_100 = overall_satisfaction * 20)

airbnb <- select(airbnb, -country, -survey_id)
# Tell R to drop country & survey_id from the airbnb data frame by including a
# minus sign before these variables.  Re-assign this new data frame to the
# airbnb object.
airbnb  # You'll now see that country & survey_id are gone.

airbnb <- rename(airbnb, country = city, city = borough)
# Tell R to rename some variables from the airbnb data frame

topten <- c("Brussel", "Antwerpen", "Gent", "Charleroi", "Liege", "Brugge", "Namur",
            "Leuven", "Mons", "Aalst")  # Create a vector with the top ten largest cities.
topten  # Show the vector.

install.packages("Hmisc")
library(Hmisc)

#We can now use the filter function to instruct R to retain the data from only the top ten largest cities:
airbnb.topten <- filter(airbnb, city %in% topten)
