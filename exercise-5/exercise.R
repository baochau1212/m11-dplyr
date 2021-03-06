# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
#install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
flights.average <- group_by(flights, month) %>%
              summarise(delay = mean(dep_delay, na.rm = TRUE ))

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
plot(flights.average)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
highest.arr.delay <- flights %>%
                      group_by(dest) %>%
                    summarise(delay = mean(arr_delay, na.rm = TRUE)) %>%
                    arrange(-delay)

### Bonus ###
# Which city was flown to with the highest average speed?
city.by.speed <- flights %>%
  mutate(speed = distance/air_time * 60) %>%
  group_by(dest) %>%
  summarise(avg_speed = mean(speed, na.rm = TRUE)) %>% 
  arrange(-avg_speed) 