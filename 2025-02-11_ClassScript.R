2025-02-11

#while loops

x = 5
while(nx>0){
  nx = x-1
  print(nx)
}


#fishing game with while loop

rnorm(n=1, mean=2, sd=1) #random normal

n_fish = 0
total_catch_lbs = 0
while(total_catch_lbs < 50){
 new_fish_weight_lbs = rnorm(n=1, mean=5, sd=1)
 n_fish = n_fish+1
 total_catch_lbs = total_catch_lbs + new_fish_weight_lbs
 print(total_catch_lbs)
}

print(n_fish)
print(total_catch_lbs)






###Artic Sea Ice


url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
artic_ice = read.delim(file=url, skip=2, sep=",", header=FALSE, 
                       col.names=c("Year", "Month", "Day", "Extent", "Missing", "Source"))
head(artic_ice)
tail(artic_ice)

library(lubridate)

artic_ice$date = make_date(year=artic_ice$Year, month=artic_ice$Month, day = artic_ice$Day)
head(artic_ice)
class(artic_ice$date)

plot(Extent ~ date, data=artic_ice, type = "l", ylab="Artic Sea Ice Extent (million km^2)")

first_year = min(artic_ice$Year)+1
last_year = max(artic_ice$Year)-1
artic_ice_averages = data.frame(Year = seq(from=first_year, to=last_year),
                                extent_annual_avg = NA,
                                extent_5yr_avt = NA)


artic_ice_averages$extent_annual_avg[1] = mean(artic_ice$Extent[artic_ice$Year == artic_ice_averages$Year[1]])
head(artic_ice_averages)

dim(artic_ice_averages)[1]
for(i in seq(dim(artic_ice_averages)[1])){
  artic_ice_averages$extent_annual_avg[i] =
    mean(artic_ice$Extent[artic_ice$Year == artic_ice_averages$Year[i]])
  print(i)
  print(artic_ice_averages$extent_annual_avg[i])
}

head(artic_ice_averages)
tail(artic_ice_averages)

plot(extent_annual_avg ~ Year, data=artic_ice_averages, type="l")

#five year average is two years prior and two years after the focal year, thus 1981 is first year with enough data to calculate
##Code 5yr average

i=3
for(i in seq(from=3, to=dim(artic_ice_averages)[1]-2)){
  years = c((artic_ice_averages$Year[i]-2) : (artic_ice_averages$Year[i]+2)) ##instead of c() can also use seq()
  artic_ice_averages$extent_5yr_avt[i] = mean(artic_ice$Extent[artic_ice$Year %in% years])
  print(paste(i,":", years))
}

head(artic_ice_averages)
tail(artic_ice_averages)

#plot
plot(Extent ~ date, data=artic_ice, type="l")
lines(extent_annual_avg ~ date, data=artic_ice_averages, type="l", col="blue")
lines(extent_5yr_avt ~ date, data = artic_ice_averages, type="l", col ="red")

artic_ice_averages$date = make_date(year = artic_ice_averages$Year, month=7, day =1)
head(artic_ice_averages)

#calculate rate
 first_extent = artic_ice_averages$extent_annual_avg[1]
 last_extent = artic_ice_averages$extent_annual_avg[dim(artic_ice_averages)[1]]
total_change_million_km2 =last_extent - first_extent 
total_change_million_km2

first_year = artic_ice_averages$Year[1]
last_year = artic_ice_averages$Year[dim(artic_ice_averages)[1]]
num_years = last_year-first_year

rate = total_change_million_km2 / num_years
rate

##DO EXCERISE 6.1 for HW & DO EXCERSISE 6.2 