ecomm.df <- read.csv("https://goo.gl/hzRyFd")

summary(ecomm.df)

# How many observations and variables are in the e-commerce data set?
dim(ecomm.df)

# Compute a frequency table for the country of origin for site visits. After the United States, which country had the most visitors?
table(ecomm.df$country)

# Compute a two-way frequency table for the intent to purchase (intentWasPlanningToBuy), broken out by user profile.
table(ecomm.df$intentWasPlanningToBuy, ecomm.df$profile)

# What are the proportions of parents who intended to purchase? the proportions of teachers who did? For each one, omit observations for whom the intent is unknown (blank).
intent.tab <- table(ecomm.df$intentWasPlanningToBuy, ecomm.df$profile)
intent.tab[2:4, 5] / sum(intent.tab[2:4, 5]) # parents
intent.tab[2:4, 8] / sum(intent.tab[2:4, 8]) # parents

# Among US states (recorded in the variable region), which state had the most visitors and how many?
table(ecomm.df$region)

# Solve the previous problem for the state with the most visitors, using the which.max function (or repeat the same answer, if you already used it).
state.tab <- table(ecomm.df$region)
state.tab[which.max(state.tab)]

# Draw a histogram for the number of visits to the site (behavNumVisits). Adjust it for more detail in the lower values. Color the bars and add a density line.
hist(ecomm.df$behavNumVisits, breaks = 200, col="lightgreen")
lines(density(ecomm.df$behavNumVisits), col="red")

# Draw a horizontal boxplot for the number of site visits.
boxplot(ecomm.df$behavNumVisits, horizontal = TRUE,
        main="Number of Visits to the Site")

# Which chart from the previous two exercises, a histogram or a boxplot, is more useful to you, and why?

# Draw a boxplot for site visits broken out with a unique row for each profile type. (Note: if the chart margins make it unreadable, try the following command before plotting: . After plotting, you can use the command par(mar=c(5, 4, 4, 2) + 0.1) to reset the chart margins.
par(mar=c(3, 12, 2, 2))
boxplot(ecomm.df$behavNumVisits ~ ecomm.df$profile, las=1, horizontal = TRUE)

# *Write a function called MeanMedDiff that returns the absolute difference between the mean and the median of a vector. 
MeanMedDiff <- function(x) {
  return(abs(mean(x) - median(x)))
}

# *What is the mean-median difference for number of site visits?
MeanMedDiff(ecomm.df$behavNumVisits)

# *What is the mean-median difference for site visits, after excluding the person who had the most visits?
MeanMedDiff(ecomm.df[-which.max(ecomm.df$behavNumVisits), "behavNumVisits"]) 

# *Use the apply() command to find the mean-median difference for the 1/0 coded behavioral variables for onsite behaviors?
apply(ecomm.df[ , 38:45], 2, MeanMedDiff)

# *Write the previous command using an anonymous function (see Section **) instead of MeanMedDiff.
apply(ecomm.df[ , 38:45], 2, function(x) abs(mean(x) - median(x)))

# *Do you prefer the named functional solution for mean-median difference (MeanMaxDiff()), or the anonymous function? Why? What is a situation for each in which it might be preferable?

