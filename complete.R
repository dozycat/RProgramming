complete <- function(directory, id = 1:332){
  
  cat = data.frame()
  
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
    temp=temp[!(is.na(temp[,"sulfate"])|is.na(temp[,"nitrate"])),]
    cat = rbind(cat,c(x,length(temp$Date)))
  }
  names(cat) <- c("id","nobs")
  
  cat
}