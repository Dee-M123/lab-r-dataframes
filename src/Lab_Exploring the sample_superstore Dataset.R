install.packages("tidyverse")
library(tidyverse)
#Step 1: Importing the Dataset
# Save the dataframe as superstore.

superstore <- read.csv("C:/Users/makwe/Downloads/Sample - Superstore.csv")
View(superstore)

# Display the first 10 rows of the dataframe using the head() function.

View(head(superstore, 10))

# Use the str() function to inspect the structure of the dataframe. What are the data types of the columns?

str(superstore)# most columns ar chr, with some being int and num


# Use the summary() function to get a summary of the dataframe. What insights can you gather from the summary?

summary(superstore)# The mean is much larger than the median, indicating a right-skewed distribution
# profit are low, owing to maybe high discounts and small sales


#Extract the Sales column as a vector using the $ operator.
vec_sales <- superstore$Sales
head(vec_sales)

# Subset the first 15 rows and the columns Order ID, Customer Name, and Sales.

subset <- superstore[1:15, c("Order.ID", "Customer.Name", "Sales")]
View(subset)

# Use the nrow() and ncol() functions to determine the number of rows and columns in the dataframe.
#nrow
n_rows <- nrow(superstore)
n_rows
#ncol()
n_cols <- ncol(superstore)
n_cols


