myDF <- read.csv("/class/datamine/data/8451/The_Complete_Journey_2_Master/5000_transactions.csv")

myresults <- split(myDF, myDF$STORE_R)
myresults                  

class(myresults)
#1C "list"
length(myresults)
#1C the length is 4
names(myresults)
#1C "Central" "East" "South" "West"
dim(myresults[["CENTRAL"]])
#1D The Dim is 243078,9
#1E
centralresults <- myDF[myDF$STORE_R == "CENTRAL", ]
dim(myresults[["CENTRAL"]])
dim(centralresults)
head(myresults[["CENTRAL"]])
head(centralresults)
#The dim and head of myresults ["CENTRAL"] and central results are identical

#2A
myproducts <- read.csv("/class/datamine/data/8451/The_Complete_Journey_2_Master/5000_transactions.csv")
#2B
mybigDF <- merge(myDF, myproducts, by = "PRODUCT_NUM")

#3A
subset(myDF, PURCHASE_ == "23-DEC-17")
#3B
subset(myDF, PURCHASE_ == "23-DEC-17", SPEND)
#3C
subset(myDF, PURCHASE_ == "23-DEC-17", c(SPEND,PURCHASE_))
#3D
subset(myDF, PURCHASE_ == "23-DEC-17", c(SPEND,PURCHASE_, STORE_R))
#3E
tail(tapply((subset(myDF, PURCHASE_ == "23-DEC-17", c(SPEND,PURCHASE_, STORE_R)))$SPEND, (subset(myDF,PURCHASE_ == "23-DEC-17", c(SPEND,PURCHASE_, STORE_R)))$STORE_R, sum))
#on December 23,2017, EAST has the greatest amount at $3782.67