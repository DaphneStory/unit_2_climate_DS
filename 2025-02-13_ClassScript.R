##DPS
#2/13/25

##Defining Functions


##my_function = function(VARIABLE_NAME){
#Preform function
#}

#Create function that calculates mean

avg = function(x){
  s = sum(x)
  n = length(x)
  return(s/n)
}

temp = c(1,2,3,4,5)
avg(temp)

## another parameter
##%h3 function avgs returns arithmetic mean of x by default;
# if arithmetic is set to false, function returns the geometric mean instead
avgs = function(x, arithmetic = TRUE){
  if(!is.numeric(x)) {stop("Stop! X is not numeric")}
  n = length(x)
  answer = ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
  return(answer)
}

avgs(T, temp)
##or avgs(arithmetic = T, x= temp)

## Exercise 7.1 
grade = function(x){
  if (x >= 90){
    print("A")
  }
  B = ifelse (89>=x>=80, print ("B"))
  C = ifelse (79 >= x >= 70, print ("C"))
  D = ifelse (69 >= x >= 60, print ("D"))
  Fa = ifelse (59 >= x <= 0, print ("F"))
}

g = 90

grade(g)


############################
####Global Temperature
###########################
url = "https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt"
temp_anomaly = read.delim(file=url, skip=5, sep="", header=F, col.names = c("Year", "No_Smoothing", "Lowess_5"))
head(temp_anomaly)
tail(temp_anomaly)
summary(temp_anomaly)

temp_1998 = temp_anomaly$No_Smoothing[temp_anomaly$Year==1998]
temp_2012 = temp_anomaly$No_Smoothing[temp_anomaly$Year==2012]


#plot 

plot(No_Smoothing ~ Year, data=temp_anomaly, type="l", lwd = 2)
  lines(Lowess_5 ~ Year, data= temp_anomaly, col="red", lwd = 3)
  abline(v = 1998, lty="dashed")
  abline (v =2013, lty = "dashed")
  lines(c(temp_1998, temp_2012) ~ c(1998, 2012), col="blue", lwd=3)

  
# make my own function to calculate rolling averages
5-5+1
5-5
  
calc_rolling_avg = function(data, moving_window=5){
  result = rep(NA, length(data))
  for(i in seq(from= moving_window, to = length(data))){
    result[i] = mean(data[seq(from=i-moving_window+1, to=i) ])
  }
  return(result)
}

calc_rolling_avg(data=seq(100))
i=3

head(temp_anomaly)
temp_anomaly$avg_5_yr = calc_rolling_avg(data=temp_anomaly$No_Smoothing)
temp_anomaly$avg_10_yr = calc_rolling_avg(data=temp_anomaly$No_Smoothing, moving_window = 10)
temp_anomaly$avg_20_yr = calc_rolling_avg(data=temp_anomaly$No_Smoothing, moving_window = 20)
tail(temp_anomaly)

plot(No_Smoothing ~ Year, data=temp_anomaly, type="l", lwd = 2)
lines(avg_5_yr ~ Year, data= temp_anomaly, col="red", lwd = 3)
lines(avg_10_yr ~ Year, data= temp_anomaly, col="orange", lwd = 3)
lines(avg_20_yr ~ Year, data= temp_anomaly, col="pink", lwd = 3)
abline(v = 1998, lty="dashed")
abline (v =2013, lty = "dashed")
lines(c(temp_1998, temp_2012) ~ c(1998, 2012), col="blue", lwd=3)
