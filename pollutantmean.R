pollutantmean <- function(directory, pollutant, id = 1:332) {
  # this function is to cal mean of the values..
  dat <- data.frame()
  for (x in id){
    str = ""
    if (x < 10){
      str = paste(0,0,x,sep="")
    }else if (x < 100){
      str = paste(0,x,sep="")
    }else{
      str = paste(x)
    }
    temp = read.csv(paste(directory,"/",str,".csv",sep=""))
    dat <-rbind(dat,temp)
  }
  pmean=c(0)
  if (pollutant=="sulfate"){
    pmean  = mean(dat$sulfate,na.rm=TRUE)
  }
  if (pollutant=="nitrate"){
    pmean  = mean(dat$nitrate,na.rm=TRUE)
  }
  pmean
}