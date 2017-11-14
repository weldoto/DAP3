library(RSQLite)

conSQLite <- dbConnect(RSQLite::SQLite(), dbname="athletes.sqlite")

resultsHandle <-dbSendQuery(conSQLite,"select Ht from athletes_table;")

getChunkAverageHeight <- function(rows){
d <- fetch(resultsHandle, n=rows)
mean(d$Ht)

}

avgHeight <- mean(sapply(rep(20,10), FUN=getChunkAverageHeight))

print(avgHeight)
