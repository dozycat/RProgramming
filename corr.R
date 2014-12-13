corr <- function(directory, threshold = 0) {
  dat <- data.frame()
  id=1:332
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
    if (length(temp$Date)>threshold){
       p = cor(temp$sulfate,temp$nitrate,method = "pearson")
       dat = rbind(dat,p)
    }
  }

  cr = as.vector(dat,mode="any")
  if (length(cr)==0){
    cr = numeric()
  }else{
    cr = cr[,1]}
}