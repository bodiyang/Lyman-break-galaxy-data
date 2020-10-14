##Bodi Yang; byang89@wisc.edu
rm(list=ls())
require("FITSio")
library(dplyr)

##read the data file of cB_5b 
data_cB58 <- readFrameFromFITS("cB58_Lyman_break.fit")


##for target cB_58:calculate the mean and standard deviation of y coordinated and then let it substracted by the mean and devided by the standard deviation
logld=data_cB58$LOGLAM
xd=10^logld
yd=data_cB58$FLUX

lengthd=length(yd)

yd_sum=0
yd_mean=0
yd_dev=0

for(i in 1:lengthd){
    yd_sum=yd_sum+yd[i]
}
yd_mean=yd_sum/lengthd

for(i in 1:lengthd){
    yd_dev=(yd_mean-yd[i])^2 + yd_dev
}
yd_dev=sqrt(yd_dev/lengthd)

yd=yd-yd_mean
yd=yd/yd_dev


##read the 100 data files
lf <- list.files(path = "./data/" )
N.files = length(lf)

distances = numeric (N.files)


for (k in 1:N.files){
    ##cat(sep="", "k=", k, ", lf[k]=", lf[k] , "\n")
    df = readFrameFromFITS(paste(sep = "", "data/", lf[k]))
    ##print(head(df))
    loglamw = df$loglam
    x = 10^loglamw
    y = df$flux
    lengthw=length(y)
    
    ##calculate the mean: y_mean and standard deviation: y_dev
    y_sum=0
    y_mean=0
    y_dev=0
    
    for(i in 1:lengthw){
        y_sum=y_sum+y[i]
    }
    y_mean=y_sum/lengthw
    
    for(i in 1:lengthw){
        y_dev=(y_mean-y[i])^2 + y_dev
    }
    y_dev=sqrt(y_dev/lengthw)

    ## each y is sustracted the mean and divided by the standard deviation
    y=y-y_mean
    y=y/y_dev

    ##calculate the Euclidean distances m
    m=0
    if(lengthw>=lengthd){
        for(i in 1:lengthd){
            m=m + (y[i]-yd[i])^2
        }
        for(i in lengthd:lengthw){
            m=m + (y[i]-0)^2
        }
    }
    else{
         for(i in 1:lengthw){
            m=m + (y[i]-yd[i])^2
        }
        for(i in lengthw:lengthd){
            m=m + (yd[di])^2
        }
    }   
    m=sqrt(m)
    distances[k]= m
}

##print(distances) to check the distances


##create the data frame of distances, spectrumID; sorted by the distances
##Please note: I did not include "i" in the data frame, because I'm using the Eucledean distance of y-coordinates only, irrelvant of x. 
dfs <-data.frame(distances,lf)
names(dfs)<- c("distances", "spectrumID")
dfs = dfs[order(dfs$distances),]

write.csv(dfs,"hw2.csv", row.names = FALSE)

