library(data.table)
library(tidyverse)
library(RSQLite)

con <- dbConnect(SQLite(), dbname="data/database.sqlite")

tables <- dbListTables(con)

## exclude sqlite_sequence (contains table information)
tables <- tables[tables != "sqlite_sequence"]

lDataFrames <- vector("list", length=length(tables))

## create a data.frame for each table
for (i in seq(along=tables)) {
  lDataFrames[[i]] <- dbGetQuery(conn=con, statement=paste("SELECT * FROM '", tables[[i]], "'", sep=""))
}

match <- lDataFrames[[3]]
