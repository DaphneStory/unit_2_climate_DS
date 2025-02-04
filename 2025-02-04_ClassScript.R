#Boolean and Conditional
#DPS


vec = c(1,0,2,1)
vec
vec[c(FALSE, FALSE, TRUE, T)]
!TRUE

1>2
1 > vec
vec >= 1
c(1,2,3) == c(3,2,1)

1 %in% c(1,2,3)
#true

world_oceans = data.frame(ocean = c("Atlantic", "Pacific", "Indian", "Artic", "Southern"),
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
sum (world_oceans$avg_depth_m > 4000)

world_oceans[world_oceans$avg_depth_m > 4000, "ocean"]
#or world_oceans$ocean[world_oceans$avg_depth_m > 4000]


1 + 2 == 3 #T
0.1 +0.2 == 0.3 #F because stored in bits

(0.1 +0.2) - 0.3 #very small error

error_threshold = 0.00001
abs((0.1 + 0.2) - 0.3) > error_threshold


#Boolean Operators

x = 5
x>3 & x<15
x>3 | x<15
x>3 & x >15
x>3 | x>15
x>3 & x %in% c(1,3,5,7,9)
x>3 & x %in% c(1,3,7,9)
x>3 | x %in% c(1,3,7,9)


a = (c(1,2,3))
b = c(1,2,3)
c = c(1,2,4)


a==b
a==c
any(a==c)
all(a==c)
dat = c(1,2,3,NA)
dat == NA
NA == NA

is.na(dat)


#Conditional Statements (if statements)


num = -2
if (num < 0) 
    {
      num = num*-1
    }
num

num = 35
if (num < 0) 
{
  print ("num is negative")
  num = num*-1
  print ("we made it positive")
}
num

num = -35
if (num < 0) 
{
  print ("num is negative")
  num = num*-1
  print ("we made it positive")
}
num

#Exercise 3.1 


fever = 100

if (fever > 98.6) {
  print("You have a fever that is higher than the average fever by:")
  diff = fever - 98.6
  print(diff)
} else if (98.6 > fever) 
  {
  diff = (98.6 - fever)
  print(diff) 
  }
##High fever
if (fever > 101)
{
  print("Woah! Your fever is too high! We suggest you see a doctor.")
}


##Else Statements

grade = 53
if(grade > 60){
  print("You passed")
} else {
  print("you failed")
}

#Try out else if statements

a = 1
b = 0
if (a>b){
  print("A wins!")
} else if(b>a){
  print("B wins!")
} else {
  print("You tied")
}


##ifelse

a = 0
ifelse(test = (a != 0), yes = (1/a), no =NA)


a = 9
ifelse(test = (a != 0), yes = (1/a), no =NA)

vec = c(0,1,2,-4,-5)
reciprocals = ifelse(test = (vec !=0), yes = 1/vec, no= NA)
reciprocals

cbind(vec, reciprocals)


#Exercise 3.3

data = c(1,3,5,-999,2,-999,8) #original data set
#replace missing with NA
dataNew = ifelse(test = (data!=-999), yes = data*1, no =NA)
dataNew      
                 