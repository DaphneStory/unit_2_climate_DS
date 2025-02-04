#2025-01-30

#DPS

ant_ice_loss = read.table(file="C:/Users/daphn/Downloads/antarctica_mass_200204_202408.txt", skip=31, sep="", header=FALSE,
           col.names=c("decimal_date", "mass_Gt", "sigma_Gt"))
head(ant_ice_loss)
tail(ant_ice_loss)
dim(ant_ice_loss)

grn_ice_loss = read.table(file="C:/Users/daphn/Downloads/greenland_mass_200204_202408.txt", skip=31, sep="", header=FALSE,
                          col.names=c("decimal_date", "mass_Gt", "sigma_Gt"))
head(grn_ice_loss)
tail(grn_ice_loss)
dim(grn_ice_loss)
summary(grn_ice_loss)


##Plot functions

#formula style
# greenland melting faster so use the limits of greenland to avoid hard coding
plot(mass_Gt ~ decimal_date, data=ant_ice_loss, type="l",
     ylim=range(grn_ice_loss$mass_Gt),
     ylab="Mass loss (Gt)",
     xlab ="Year")

#OR
#plot(x=ant_ice_loss$decimal_date, y=ant_ice_loss$mass_Gt)

#plot(mass_Gt ~ decimal_date, data=grn_ice_loss, type="l")
lines(mass_Gt ~ decimal_date, data=grn_ice_loss, type="l", col="red")

range(grn_ice_loss$mass_Gt)


#adding the year break in graph

data_break = data.frame(decimal_date=2018.0, mass_Gt=NA, sigma_Gt=NA)
data_break
#rbind - row bind, row names must exactly match
ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break)
head(ant_ice_loss_with_NA)
tail(ant_ice_loss_with_NA)

grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break)
head(ant_ice_loss_with_NA)
tail(ant_ice_loss_with_NA)

ordered_rows = order(ant_ice_loss_with_NA$decimal_date)
ant_ice_loss_with_NA = ant_ice_loss_with_NA[ordered_rows, ] # include comma and space to tell r all columns

grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date), ] 


#replotting
plot(mass_Gt ~ decimal_date, data=ant_ice_loss_with_NA, type="l",
     ylim=range(grn_ice_loss$mass_Gt),
     ylab="Mass loss (Gt)",
     xlab ="Year")
lines(mass_Gt ~ decimal_date, data=grn_ice_loss_with_NA, type="l", col="red")


## adding uncertainty
head(ant_ice_loss)

pdf('figures/melting_ice_figure.pdf', width=7, height=5) ##opens device
plot(mass_Gt ~ decimal_date, data=ant_ice_loss_with_NA, type="l",
     ylim=range(grn_ice_loss$mass_Gt),
     ylab="Mass loss (Gt)",
     xlab ="Year", lwd =2) #lwd - line width

lines((mass_Gt + 2*sigma_Gt) ~ decimal_date, data = ant_ice_loss_with_NA, lty = "dashed")
lines((mass_Gt - 2*sigma_Gt) ~ decimal_date, data = ant_ice_loss_with_NA, lty = "dashed")
lines((mass_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, lwd =2, col="red")
lines((mass_Gt + 2*sigma_Gt) ~ decimal_date, data = grn_ice_loss_with_NA, lty = "dashed")
lines((mass_Gt - 2*sigma_Gt) ~ decimal_date, data = grn_ice_loss_with_NA, lty = "dashed")
dev.off() #closes pdf


### Exercise 1.1

min(ant_ice_loss$mass_Gt)


# Barplot of largest observed ice loss in Antarctica and Greenland
barplot(height=c(min(ant_ice_loss$mass_Gt)*(-1), min(grn_ice_loss$mass_Gt)*(-1)), names.arg = c("Antartica", "Greenland"), ylim=c(0,6000), ylab="Ice loss in Gt")


### Exercise 1.2

avg_ice_loss_ant=((ant_ice_loss_with_NA$mass_Gt[1]-ant_ice_loss_with_NA$mass_Gt[237])/max(ant_ice_loss_with_NA$decimal_date))
avg_ice_loss_ant

avg_ice_loss_grn=((grn_ice_loss_with_NA$mass_Gt[1]-grn_ice_loss_with_NA$mass_Gt[237])/max(grn_ice_loss_with_NA$decimal_date))
avg_ice_loss_grn
## barplot
barplot(height=c(avg_ice_loss_ant, avg_ice_loss_grn), names.arg = c("Antartica", "Greenland"), ylim = c(0,4), ylab="Average Ice loss in Gt")

pdf('figures/melting_ice_barplot.pdf')
barplot(height=c(avg_ice_loss_ant, avg_ice_loss_grn), names.arg = c("Antartica", "Greenland"), ylim = c(0,4), ylab="Average Ice loss in Gt")
dev.off()
      