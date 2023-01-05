####Data cleaning
###Import libraries

library(readxl)
library(dplyr)
library("tidyr")
data=read.csv("/Users/gurpreetsingh/Desktop/Dashboard/dataset.csv")
str(data)

##Inserting NUll values in dataset

nullIndexes<-sample(3:1291,150,replace = FALSE)
print(colnames(data))
for(i in 1:75){
  data$ranks[nullIndexes[i]]=NA
}
for(i in 76:150){
  data$ratings[nullIndexes[i]]=NA
}

#Adding Book id column 

bookid<-sample(11000:15000,1291,replace = FALSE)
data['book_id']=bookid

#writing to original dataset

write.csv(data,"/Users/gurpreetsingh/Desktop/Dashboard/dataset.csv")
sum(is.na(data))
colSums(is.na(data))

#Removing rows with NA's using drop_na()
data=data %>% drop_na()
sum(is.na(data))

#dropping unnecessary columns

data=data[-c(1,2,9)]
str(data)

#Splitting Dataset 

Bookdetail<-data.frame(select(data,c('book_id','title','author')))
sellingdetail<-data.frame(select(data,c('book_id','no_of_copies_sold','price','year')))
readerviews<-data.frame(select(data,c('book_id','ranks','ratings')))
booktype<-data.frame(select(data,c('book_id','genre')))
head(Bookdetail)
head(sellingdetail)
head(readerviews)
head(booktype)

#Creating csv files from splitted data
write.csv(Bookdetail,"/Users/gurpreetsingh/Desktop/Dashboard/Bookdetail.csv")
write.csv(sellingdetail,"/Users/gurpreetsingh/Desktop/Dashboard/sellingdetail.csv")
write.csv(readerviews,"/Users/gurpreetsingh/Desktop/Dashboard/readerviews.csv")
write.csv(booktype,"/Users/gurpreetsingh/Desktop/Dashboard/booktype.csv")
