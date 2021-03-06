#--- Clear workspace
rm(list=ls())

#========================================================#
#---------------------USER INPUT-------------------------#
#========================================================#

#---Assign Path & Working Directory
dir <- "P:/Temp/NEWYORK/Bankfull/Analysis"
#---Specify the data set
filename <- "bankfullinputfull.txt"
outputname <- "bankfulloutputfullalt.txt"

#========================================================#
#------------------END USER INPUT------------------------#
#========================================================#

setwd(dir)
file <- read.table(filename,header=TRUE,sep="\t")


#-----------BEGIN BANKFULL FUNCTIONS---------------#


#Bankfull Functions using Hydrologic Regions from Lumia 1991

#BANKFULL DISCHARGE
#a = drainage area in sq mi
#Output is bankfull discharge in cubic feet per second (cfs)

cfs_1_2 <- function(a)
{49.6*a^0.849}

cfs_3 <- function(a)
{83.8*a^0.679}

cfs_4 <- function(a)
{117.2*a^0.780}

cfs_4a <- function(a)
{30.3*a^0.980}

cfs_5 <- function(a)
{45.3*a^0.856}

cfs_6 <- function(a)
{48.0*a^0.842}

cfs_7 <- function(a)
{37.1*a^0.765}

#BANKFULL WIDTH
#a = drainage area in sq mi
#Output is bankfull width in feet (ft)

w_1_2 <- function(a)
{21.5*a^0.362}

w_3 <- function(a)
{24.0*a^0.292}

w_4 <- function(a)
{17.1*a^0.460}

w_4a <- function(a)
{9.1*a^0.545}

w_5 <- function(a)
{13.5*a^0.449}

w_6 <- function(a)
{16.9*a^0.419}

w_7 <- function(a)
{10.8*a^0.458}

#BANKFULL DEPTH
#a = drainage area in sq mi
#Output is bankfull depth in feet (ft)

d_1_2 <- function(a)
{1.06*a^0.329}

d_3 <- function(a)
{1.66*a^0.210}

d_4 <- function(a)
{1.07*a^0.314}

d_4a <- function(a)
{.79*a^0.350}

d_5 <- function(a)
{.82*a^0.373}

d_6 <- function(a)
{1.04*a^0.244}

d_7 <- function(a)
{1.47*a^0.199}

#BANKFULL AREA
#a = drainage area in sq mi
#Output is bankfull cross-sectional area in square feet (ft^2 or sq ft)

a_1_2 <- function(a)
{22.3*a^0.694}

a_3 <- function(a)
{39.8*a^0.503}

a_4 <- function(a)
{17.9*a^0.777}

a_4a <- function(a)
{7.2*a^0.894}

a_5 <- function(a)
{10.8*a^0.82}

a_6 <- function(a)
{17.6*a^0.662}

a_7 <- function(a)
{15.9*a^0.656}

#BANKFULL VELOCITY
#a = drainage area in sq mi
#Output is bankfull velocity in feet per second (ft/s)

v_1_2 <- function(a)
{cfs_1_2(a)/a_1_2(a)}

v_3 <- function(a)
{cfs_3(a)/a_3(a)}

v_4 <- function(a)
{cfs_4(a)/a_4(a)}

v_4a <- function(a)
{cfs_4a(a)/a_4a(a)}

v_5 <- function(a)
{cfs_5(a)/a_5(a)}

v_6 <- function(a)
{cfs_6(a)/a_6(a)}

v_7 <- function(a)
{cfs_7(a)/a_7(a)}

#-----------END BANKFULL FUNCTIONS---------------#

#Making new columns
file$Discharge <- 0
file$Width <- 0
file$Depth <- 0
file$Area <- 0
file$Velocity <- 0

#Ordering the columns for easier indexing
file[order(file$REGION),]
head(file)

#Making subsets according to Hydrologic Region
sub1_2 <- file[file$REGION == '1' | file$REGION == '2', ]
sub3 <- file[file$REGION == '3', ]
sub4 <- file[file$REGION == '4', ]
sub4a <- file[file$REGION == '4A', ]
sub5 <- file[file$REGION == '5', ]
sub6 <- file[file$REGION == '6', ]
sub7 <- file[file$REGION == '7', ]

sub1_2$Discharge <- cfs_1_2(sub1_2$DRNAREA)
sub1_2$Width <- w_1_2(sub1_2$DRNAREA)
sub1_2$Depth <- d_1_2(sub1_2$DRNAREA)
sub1_2$Area <- a_1_2(sub1_2$DRNAREA)
sub1_2$Velocity <- v_1_2(sub1_2$DRNAREA)

sub3$Discharge <- cfs_3(sub3$DRNAREA)
sub3$Width <- w_3(sub3$DRNAREA)
sub3$Depth <- d_3(sub3$DRNAREA)
sub3$Area <- a_3(sub3$DRNAREA)
sub3$Velocity <- v_3(sub3$DRNAREA)

sub4$Discharge <- cfs_4(sub4$DRNAREA)
sub4$Width <- w_4(sub4$DRNAREA)
sub4$Depth <- d_4(sub4$DRNAREA)
sub4$Area <- a_4(sub4$DRNAREA)
sub4$Velocity <- v_4(sub4$DRNAREA)

sub4a$Discharge <- cfs_4a(sub4a$DRNAREA)
sub4a$Width <- w_4a(sub4a$DRNAREA)
sub4a$Depth <- d_4a(sub4a$DRNAREA)
sub4a$Area <- a_4a(sub4a$DRNAREA)
sub4a$Velocity <- v_4a(sub4a$DRNAREA)

sub5$Discharge <- cfs_5(sub5$DRNAREA)
sub5$Width <- w_5(sub5$DRNAREA)
sub5$Depth <- d_5(sub5$DRNAREA)
sub5$Area <- a_5(sub5$DRNAREA)
sub5$Velocity <- v_5(sub5$DRNAREA)

sub6$Discharge <- cfs_6(sub6$DRNAREA)
sub6$Width <- w_6(sub6$DRNAREA)
sub6$Depth <- d_6(sub6$DRNAREA)
sub6$Area <- a_6(sub6$DRNAREA)
sub6$Velocity <- v_6(sub6$DRNAREA)

sub7$Discharge <- cfs_7(sub7$DRNAREA)
sub7$Width <- w_7(sub7$DRNAREA)
sub7$Depth <- d_7(sub7$DRNAREA)
sub7$Area <- a_7(sub7$DRNAREA)
sub7$Velocity <- v_7(sub7$DRNAREA)

bankfull <- rbind(sub1_2,sub3,sub4,sub4a,sub5,sub6,sub7)
class(bankfull)
head(bankfull)

write.table(bankfull,file=outputname,col.names=TRUE,row.names=FALSE)
