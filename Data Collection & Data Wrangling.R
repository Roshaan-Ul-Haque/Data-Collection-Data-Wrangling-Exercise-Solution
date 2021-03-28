# Data Collection & Data Wrangling

#To check the current directory

getwd()

# Creating a directory

dir.create("Data")

# Checking for a directory

file.exists("Data")

# Checking for a "data" directory and creating it if it doesn't exist

if (!file.exists("Data1"))
{
  dir.create("Data1")
}

# Enter in a directory

setwd("./Data")

# One step exit from a current directory

setwd("../")

# Download data from internet

websiteurl <- "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2017-financial-year-provisional/Download-data/annual-enterprise-survey-2017-financial-year-provisional-csv.csv"

# if you aren't in Data directory

download.file(websiteurl, destfile = "./Data/Annual-enterprise-survey.csv")
list.files("./Data")
setwd("./Data")

# For reading data

readdata = read.csv('Annual-enterprise-survey.csv')

# For structuring Data

str(readdata)

# If you are in Data directory

download.file(websiteurl, destfile = "Annual-enterprise-survey.csv")
list.files("./Data")

# For reading data

readdata = read.csv('Annual-enterprise-survey.csv')

# For structuring Data

str(readdata)

# Downloading file date

date()

# Using read.table()

readingdata = read.table('Annual-enterprise-survey.csv', sep = ',', header = TRUE)
head(readingdata)

View(readingdata)

library(data.table)
?fread

# Examples

fread("A,B\n1,2\n3,4")

fread("A,B\n1,2\n3,4\n5,6\n")

fread("A,B,C,D\n1,2,3,4\n5,6,7,8")

fread("A,B
      1,2
      3,4")

fread("A,B
      1,2
      3,4
      5,6")

fread("A,B,C,D
      1,2,3,4
      5,6,7,8")

fread("
      This is perhaps a banner line or two or ten
      A,B
      1,2
      3,4")

fread("
      This is perhaps a banner line or two or ten
      A,B
      1,2
      3,4
      5,6")

fread("
      This is perhaps a banner line or two or ten
      A,B,C,D
      1,2,3,4
      5,6,7,8")

fread("
      1,2
      3,4")

fread("
      1,2
      3,4
      5,6")

fread("
      1,2,3,4
      5,6,7,8")

fread("
      This is perhaps a banner line or two or ten
      A,B,C,D
      1,2,3,4
      5,6,7,8")

fread("A\n1.010203040506070809010203040506\n")

fread("A\n1.46761e-313\n")

data = "A,B,C,D\n1,3,5,7\n2,4,6,8\n"
fread(data, colClasses=c(B="character",C="character",D="character"))  # as read.csv
fread(data, colClasses=list(character=c("B","C","D")))    # saves typing
fread(data, colClasses=list(character=2:4))

fread(data, colClasses=c("B"="NULL","C"="NULL"))   # as read.csv
fread(data, colClasses=list(NULL=c("B","C")))      #
fread(data, drop=c("B","C"))      # same but less typing, easier to read
fread(data, drop=2:3)             # same using column numbers

fread(data, select=c("A","D"))    # less typing, easier to read
fread(data, select=c(1,4))        # same using column numbers

fread(data, select=c(A="numeric", D="character"))
fread(data, select=list(numeric="A", character="D"))

fread("a,b\n1,a\n2,b\n\n\n3,c\n", blank.lines.skip=TRUE)
# fill
fread("a,b\n1,a\n2\n3,c\n", fill=TRUE)
fread("a,b\n\n1,a\n2\n\n3,c\n\n", fill=TRUE)

# fill with skip blank lines
fread("a,b\n\n1,a\n2\n\n3,c\n\n", fill=TRUE, blank.lines.skip=TRUE)

fread("a b,a b\n1,2\n")
fread("a b,a b\n1,2\n", check.names=TRUE) # no duplicates + syntactically valid names

# Reading excel files

install.packages("xlsx")

library("xlsx")

read.xlsx()

setwd("./Data")

readingdata = read.xlsx("Annual-enterprise-survey1.xlsx", sheetIndex = 1, header = TRUE)
head(readingdata)

# Reading specific rows and columns

colIndex = 2:3
rowIndex = 1:4
readingdatasunbset = read.xlsx("Annual-enterprise-survey1.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
head(readingdatasunbset)

install.packages("readxl")

library('readxl')

?read_excel

readxl_example()

reading_excel_file = readxl_example("clippy.xlsx")
read_excel(reading_excel_file)

head(reading_excel_file)

read_excel("Annual-enterprise-survey1.xlsx")

setwd("./Data")

install.packages("devtools")

# Writing excel files

devtools::install_github("ropensci/writexl")

install.packages("writexl")

library(writexl)

?write_xlsx

write_xlsx(readingdata, "Annual-enterprise-survey.xlsx")

install.packages('openxlsx')

library(openxlsx)

?openxlsx

# Reading webpage and relevant data

#. Read data from a webpage
#. Read specific section or paragraph
#. Read required table only

install.packages('rvest')

# Read HTML webpage
library(rvest)

theurl <- "http://en.wikipedia.org/wiki/Brazil_national_football_team"
file <- read_html(theurl)

# Read table from webpage
mytable <- html_nodes(file, "table")
mytable1 <- html_table(mytable[4], fill = TRUE)
mytable2 <- html_table(mytable[1], fill = TRUE)
mytable3 <- html_table(mytable[3], fill = TRUE)
mytable4 <- html_table(mytable[2], fill = TRUE)

print(mytable1)
print(mytable2)
print(mytable3)
print(mytable4)


lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

rating <- lego_movie %>% 
  html_nodes("strong span") %>%
  html_text() %>%
  as.numeric()
rating

# OR

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
rating <- lego_movie 
  
myrating <- html_nodes(rating, "strong span")
myrating1 <-html_text(myrating)
as.numeric(myrating1)

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
cast <- lego_movie %>%
  html_nodes("#titleCast .primary_photo img") %>%
  html_attr("alt")
cast

# OR

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
cast <- lego_movie
cast1 <- html_nodes(cast, "#titleCast .primary_photo img")
cast2 <- html_attr(cast1, "alt")
cast2

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
poster <- lego_movie %>%
  html_nodes(".poster img") %>%
  html_attr("src")
poster

# OR

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
poster <- lego_movie
poster1 <- html_nodes(poster, ".poster img")
poster2 <-  html_attr(poster1, "src")
poster2

# Reading from SQLite

install.packages("RSQLite")
install.packages("RMySQL")

library("RSQLite")
library("RMySQL")

# Load the mtcars as an R data frame put the row names as a column, and print the header

data("mtcars")
mtcars$car_names <- rownames(mtcars)
rownames(mtcars) <- c()
head(mtcars)

# Create a connection to our new database, carsDB.db
# You can check that the .db file has been created on your working directory
setwd("./data")

# Creating Database and Tables

# Create or connect to database
conn <- dbConnect(RSQLite::SQLite(), "carsDB.db")

# Write the mtcars dataset into a table names mtcars_data
dbWriteTable(conn, "cars_data", mtcars)

# List all the tables available in the database
dbListTables(conn)

# Quick access functions
dbListFields(conn, "cars_data")
dbReadTable(conn, "cars_data")

# TODD: Insert following data into DB Tables
# datasets::AirPassengers
# datasets::LobTolly

# Executing SQL Queries

dbGetQuery(conn,"SELECT * FROM cars_data LIMIT 5 ")

# Get the car names and horsepower starting with M that have 6 or 8 cylinders
dbGetQuery(conn,"SELECT car_names, hp, cyl FROM cars_data
                 WHERE car_names LIKE 'M%' AND cyl IN (6,8)")


# Get the average horsepower and mpg by number of cylinder groups
dbGetQuery(conn,"SELECT cyl, AVG(hp) AS 'average_hp', AVG(mpg) AS 'average_mpg' FROM cars_data
                 GROUP BY cyl
                 ORDER BY average_hp")


avg_HpCyl <- dbGetQuery(conn,"SELECT cyl, AVG(hp) AS 'average_hp'FROM cars_data
                 GROUP BY cyl
                 ORDER BY average_hp")
avg_HpCyl
class(avg_HpCyl)

# Insert Variables into Queries (Parameterised Queries)

# User is looking for cars that have over 18 miles per gallon (mpg) and more than 6 cylinders
mpg <-  18
cyl <- 4
Result <- dbGetQuery(conn, 'SELECT car_names, mpg, cyl FROM cars_data WHERE mpg >= ? AND cyl >= ?', 
                     params = c(mpg,cyl))
Result

# Statements That Do Not Return Tabular Results

# Visualize the table before deletion
dbGetQuery(conn, "SELECT * FROM cars_data LIMIT 10")

# Delete the column belonging to the Mazda RX4. You will see a 1 as the output.
dbExecute(conn, "DELETE FROM cars_data WHERE car_names = 'Mazda RX4'")

# Visualize the new table after deletion
dbGetQuery(conn, "SELECT * FROM cars_data LIMIT 10")

# Insert the data for the Mazda RX4. This will also ouput a 1
dbExecute(conn, "INSERT INTO cars_data VALUES (21.0,6,160.0,110,3.90,2.620,16.46,0,1,4,4,'Mazda RX4')")

# See that we re-introduced the Mazda RX4 succesfully at the end
dbGetQuery(conn, "SELECT * FROM cars_data")

# https://db.rstudio.com/databases/sqlite/

# You can fetch all results:
res <- dbSendQuery(conn, "SELECT * FROM cars_data WHERE cyl = 6")
dbFetch(res)

# Clear the result
dbClearResult(res)

# Or a chunk at a time
res <- dbSendQuery(conn, "SELECT * FROM cars_data WHERE cyl = 8")
while(!dbHasCompleted(res)){
  chunk <- dbFetch(res, n = 5)
  print(nrow(chunk))
}

# Clear the result
dbClearResult(res)


# Disconnect from the database
dbDisconnect(conn)

# Using MySQL

ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")

result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb)

result

# Using data.table

library(data.table) #This command is not working
DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9)) #This command is not working
head(DF, 3) #This command is not working

library(data.table) #This command is not working
DF = data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9)) #This command is not working
head(DF, 3) #This command is not working

DT[,list(mean(x)), sum(z)] #This command is not working

DT[,w:=z^2] #This command is not working

DT[,a:=x>0] #This command is not working

# Merge data.table
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1,x); setkey(DT2,x)
merge(DT1,DT2)

# Sub-setting 
set.seed(13435)
x <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x <- x[sample(1:5),]; x$var2[c(1,3)] = NA
x

x[,1]

x[,"var1"]

x[1:2,"var2"]

x[(x$var1 <= 3 & x$var3 > 11),]

x[(x$var1 <= 3 | x$var3 > 15),]

# Sorting

sort(x$var1)

sort(x$var1, decreasing = TRUE)

sort(x$var2, na.last = TRUE)

x[order(x$var1),]

x[order(x$var1,x$var3),]

# Dealing with Missing/Null Values

# Test for Missing Values

x <- c(1:4, NA, 6:7, NA)
is.na(x)

df <- data.frame(col1 <-  c(1:3, NA), col2 <- c("this", NA, "is ", "text"), col3 <- c(TRUE, FALSE, TRUE, TRUE),  col4 <- c(2.5, 4.2, 3.2, NA), stringsAsFactors <- FALSE)  
# identify NAs in full data frame
is.na(df)

# identify NAs in specific data frame column
is.na(df$col4)

# To identify the location or the number of NAs we can leverage the which() and sum() functions:

# identify location of NAs in vector
which(is.na(x))

# identify count of NAs in data frame
sum(is.na(df))

# For data frames, a convenient shortcut to compute the total missing values in each column is to use colSums:

colSums(is.na(df))

# Recode/Impute Missing Values

x <- c(1:4, NA, 6:7, NA)
x[is.na(x)] <- mean(x, na.rm = TRUE)
round(x,2)

# Data frame that codes missing values as 99

df <- data.frame(col1 = c(1:3,99), col2 = c(2.5, 4.2, 99,3.2))
df[df == 99] <- NA # change 99s to NAs
df

# data.frame with missing data

df <- data.frame(col1 <-  c(1:3, NA), col2 <- c("this", NA, "is ", "text"), col3 <- c(TRUE, FALSE, TRUE, TRUE),  col4 <- c(2.5, 4.2, 3.2, NA), stringsAsFactors <- FALSE)  
df$col4[is.na(df$col4)] <- mean(df$col4, na.rm = TRUE)
df

# Exclude Missing Values

# A vector with missing values
x <- c(1:4, NA, 6:7, NA)
# including NA values will produce an NA output
mean(x)

# excluding NA values will calculate the mathematical operation for all non-missing values
mean(x, na.rm = TRUE)

complete.cases(df)

# subset with complete.cases to get complete cases
df[complete.cases(df),]

# or subset with '!' operators to get incomplete cases
df[!complete.cases(df),]

# or use na.omit() to get same as above
na.omit(df)

# Split and Apply Functions

# Sum/Mean by Categorical values

head(InsectSprays)

tapply(InsectSprays$count, InsectSprays$spray, sum)

# Split Data into Vectors Given a Variable

spins = split(InsectSprays$count, InsectSprays$spray)
spins

# Another Way to Apply Sum
sprCount = lapply(spins, sum)
sprCount

unlist(sprCount)

sapply(spins,sum)

# Merge/Join Data frames

# Combine two Data frames by Columns or Rows

# cbind in r - data for example

activity <- data.frame(opid = c("Op01", "Op02", "Op03", 
                                "Op04", "Op05", "Op06", "Op07"), 
                       units = c(23,43,21,32,13,12,32))
names <- data.frame(operator=c("Larry", "Curly", "Moe", 
                               "Jack", "Jill", "Kim", "Perry"))
blended <- cbind(activity, names)
blended
                  
# Combine two Data frames by Columns or Rows  

rblended <- rbind(blended, blended)
rblended

# Merge/Join Datasets

names(reviews)

names(solutions)

mergedData = merge(reviews, solutions, by.x = "solution_id", by.y="id", all = TRUE)
head(mergedData)

# Need some data to play with
df1 <- data.frame (LETTERS, dfindex = 1:26) 
df2 <- data.frame (letters, dfindex = c(1:10,15,20,22: 35))
# INNER JOIN: returns rows when there is a match in both tables.
merge(df1, df2)
# FULL (outer) JOIN: all records from both the tables and fill in NULLs for missing matches on either side.
merge(df1,df2, all=TRUE)

# what if column names don't match?
names(df1) <- c("alpha", "lotsaNumbers")

merge(df1, df2, by.x = "lotsaNumbers", by.y = "dfindex")

# Tidyverse

install.packages('tidyverse')

install.packages('tidyr')

install.packages('dplyr')

library(tidyr)

library(dplyr)

library('ggplot2')      # Load ggplot2 package
data(msleep)            # Make msleep data available

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
download.file(url, destfile = "msleep_ggplot2.csv")

msleep <- read.csv("msleep_ggplot2.csv") # in working directory

list.files("./data")

head(msleep)

sleeptime <- select(msleep, name, sleep_total)
head(sleeptime)

filter(msleep, order == 'carnivora')

groups <- group_by(msleep, genus)
levels(groups$genus)

# mutate()

mtcars_n <- mtcars
head(mtcars_n)

mtcars_n <- mutate(mtcars, mpg_cyl = mpg*cyl)
head(mtcars_n)

# Pipeline function %>%

library(datasets)
head(mtcars)

mtcars %>% 
  group_by(cyl) %>%
      summarise(mean=mean(disp), n=n())

sub_m <- mtcars %>% select(mpg, cyl, disp, hp, gear, carb) %>% mutate(dispxhp = disp^hp)
names(sub_m)

table(mtcars$carb)

sub_m <- mtcars %>% select(mpg, cyl, disp, hp, gear, carb) %>% filter(carb %in% c(4,2,1))
table(sub_m$carb)

mtcars %>%
  select(mpg, cyl, disp, hp, gear, carb) %>%
  filter(carb %in% c(4,2,1)) %>%
  group_by(cyl) %>%
  summarise(hp_mean=mean(hp), disp_mean=mean(disp), n=n())

# Separate

df <- data.frame(x = c("a:1", "b:2", "c:3", "d:4"))
df

df %>% separate(x, c("key", "value"), ":") %>% str

# Spread()

data <- data.frame(variable1 = rep(LETTERS[1:3], each = 3), 
                   variable2 = rep(paste0("factor", c(1,2,3)), 3),
                   num = 1:9)
head(data)

spread(data, variable2, num)

# Gather()

head(iris)

mini_iris <- 
  iris %>% 
  group_by(Species) %>%
  slice(1)
mini_iris

mini_iris %>% gather(key = "flower_att", value = "measurement", -Species)

merged <- unite(mtcars, "vs_am", c("vs", "am"))
head(merged)

# Tolower()

if(!file.exists("./data"))(dir.create("./data"))
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile =  "./data/cameras.csv")
cameraData <- read.csv("cameras.csv")
names(cameraData)

tolower(names(cameraData))

# Strsplit()

splitNames = strsplit(names(cameraData), "\\.")
splitNames[[5]]

splitNames[[6]]

# Sapply

splitNames[[6]][1]
firstElement <- function(x)(x[1])
sapply(splitNames, firstElement)

# tm (Text Mining) Library

# Text Data Cleaning

install.packages('tm')

library(tm)

sentence = c('this is my lst try example.','A person is nice', 'we can divide 10 with 2', 'Ahmed is a Gentle man')

txt <- Corpus(VectorSource(sentence))
txt_data <- tm_map(txt,stripWhitespace)
txt_data <- tm_map(txt_data,tolower)
txt_data <- tm_map(txt_data,removeNumbers)
txt_data <- tm_map(txt_data,removePunctuation)
txt_data <- tm_map(txt_data, removeWords, stopwords("english"))

txt_data <- tm_map(txt_data, removeWords, c("and", "the", "our", "that", "for", "are", "also", "more", "has", "must", "have", "should", "this", "wish"))

df <- data.frame(cln_text=unlist(tex_data), stringsAsFactors = F)
df$cln_text

library(wordcloud)
wordcloud(txt_data)

# WordCloud Function

if(!file.exists("./data"))(dir.create("./data"))
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile =  "./data/cameras.csv")
cameraData <- read.csv("cameras.csv")
names(cameraData)

# Create a Word Cloud Visual

install.packages('wordcloud')

library(wordcloud)

wd <- d$street
wordcloud(cameraData,
          scale = c(5,0.5), random.order=FALSE,
          rot.per=0.35, use.r.layour=FALSE,
          colors=brewer.pal(8, "Dark2"))