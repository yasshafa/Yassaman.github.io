options(repos = "https://cloud.r-project.org")
install.packages("tidyverse")
library("tidyverse")




# readr: Used for CSV and Text Files
write_csv(mtcars, "mtcars.csv")
library(readr)
data <- read_csv("mtcars.csv")






# readxl: Used to read Excel (.xls and .xlsx files) 
install.packages("readxl")
library(readxl)
data("iris") # Load built-in iris dataset
head(iris)

install.packages("writexl")
library(writexl)
write_xlsx(iris, "iris.xlsx")  # This creates iris.xlsx in your working directory
data <- read_excel("iris.xlsx") # Read the Excel file using readxl
head(data)





#rio - example 1
install.packages("rio")
library(rio)
library(dplyr)
data <- import("https://vincentarelbundock.github.io/Rdatasets/csv/datasets/mtcars.csv")
data %>% filter(mpg > 25)

#rio - example 2
install.packages("rio")
library(rio)
download.file(
  url = "https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv",
  destfile = "gapminder.csv",
  mode = "wb"
)
data <- import("gapminder.csv")
head(data)




# readODS
install.packages("writeODS")
install.packages("readODS")
library(readODS)
data(iris)
write_ods(iris, "iris.ods")
iris_data <- read_ods("iris.ods", sheet = 1)
head(iris_data)










