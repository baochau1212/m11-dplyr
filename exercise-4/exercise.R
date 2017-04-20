# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
install.packages("nycflights13")
library(dplyr)
library(nycflights13)


# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)
dim(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, gain = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, desc(gain))

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- flights %>%
            mutate(flights, gain = arr_delay - dep_delay) %>%
            arrange(gain)
  
# Make a histogram of the amount of gain using the `hist` command
hist(flights$gain)

# On average, did flights gain or lose time?
mean(flights$gain, na.rm = TRUE)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
to.sea <- flights %>% select(gain, dest) %>% filter(dest == 'SEA') 

# On average, did flights to seatac gain or loose time?
mean(to.sea$gain, na.rm = TRUE)

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
<<<<<<< HEAD
## Hint: see chapter 11 section on standard evaluation
=======
## Hint: see slides on standard evaluation
OriginDestInterest <- function(my_origin, my_dest, interest) {
  ret <- flights %>% filter(origin == my_origin, dest == my_dest) %>% select_(interest)
  return(ret)
}
>>>>>>> 4bbc07dfe2d8fec8556b76ad55306984bd5643b8


# Retireve the air_time column for flights from JFK to SEA
jfk.to.sea <- OriginDestInterest('JFK', 'SEA', 'air_time')

# What was the average air time of those flights (in hours)?  


# What was the min/max average air time for the JFK to SEA flights?
mean(jfk.to.sea$air_time, na.rm = TRUE)/60
min(jfk.to.sea$air_time, na.rm = TRUE)/60
max(jfk.to.sea$air_time, na.rm = TRUE)/60