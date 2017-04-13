# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library('fueleconomy')

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicle.1997 <- vehicles[vehicles$year==1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicle.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
wheel.20 <- vehicles[vehicles$cty>20,]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy <- wheel.20$id[wheel.20$hwy == min(wheel.20$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MostHwy <- function(year, make) {
  my.vehicle <- vehicles[vehicles$year == year & vehicles$make == make,]
  return(my.vehicle[my.vehicle$hwy == max(my.vehicle$hwy),])
}

# What was the most efficient honda model of 1995?
MostHwy('1995', 'Honda')
## ??vehicles
## dim(vehicles)
## C(TRUE, FALSE) odd # of rows
