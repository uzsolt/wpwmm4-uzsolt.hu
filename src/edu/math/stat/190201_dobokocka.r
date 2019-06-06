# dobások száma
N <- 5000
# dobások generálása
dobasok <- sample(1:6,N,replace=TRUE)

# átlag
mean(dobasok)
# szórás
sd(dobasok)
# melyik számból hány darab van
table(dobasok)

# eredmények számát ábrázoljuk
png("dk1.png")
barplot(table(dobasok))

# 10, 50, 100 elemenként képzünk átlagokat
for (i in c(10,50,100)) {
  csoportatlag <- apply(matrix(dobasok,nrow=N/i),1,mean)
  png(paste("hist_",i,".png",sep=""))
  hist(
    csoportatlag,
    main=paste(i," elemű minta",sep=""),
    col="blue",
    xlim=c(1,6),
    xlab="Minták átlaga",
    ylab="Gyakoriság"
  )
}
