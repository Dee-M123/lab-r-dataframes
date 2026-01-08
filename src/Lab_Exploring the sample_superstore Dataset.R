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


#Step 4: Filtering Data
#Filter the dataframe to show only rows where the Profit is greater than 100.

profit_over_100 <- superstore[superstore$Profit > 100, ]
View(profit_over_100)

# Filter the dataframe to show only rows where the Category is "Furniture" and the Sales are greater than 500.

furniture_sales <- superstore[
  superstore$Category == "Furniture" & superstore$Sales > 500,
]

View(furniture_sales)

# Filter the dataframe to show only rows where the Region is "West" and the Quantity is greater than 5.

west_larger_5 <- superstore[
  superstore$Region == "West" & superstore$Quantity > 5,
]

View(west_larger_5)

# Step 5: Adding and Modifying Columns
# Add a new column called Profit Margin that calculates the profit margin as (Profit / Sales) * 100.

superstore$Profit.Margin <- (superstore$Profit / superstore$Sales) * 100
View(head(superstore[, c("Sales", "Profit", "Profit.Margin")]))

# Modify the Sales column by rounding the values to 2 decimal places.

superstore$Sales <- round(superstore$Sales, 2)
View(head(superstore$Sales))

# Remove the Postal Code column from the dataframe using the subset() or select() function.
superstore <- subset(superstore, select = -`Postal.Code`)
colnames(superstore)

# Step 6: Handling Missing Data
# Check for missing values in the dataframe using the is.na() function. Are there any missing values?

sum(is.na(superstore))

# Step 7: Advanced Analysis (Optional)
# Group the dataframe by Region and calculate the total Sales and Profit for each region.

region_summary <- aggregate(cbind(Sales, Profit) ~ Region, data = superstore, sum)
View(region_summary)

# Create a new column called Discount Level that categorizes the Discount column into:
# "Low" (0-0.2)
# "Medium" (0.2-0.5)
# "High" (0.5-1)

superstore$Discount.Level <- ifelse(
  superstore$Discount <= 0.2, "Low",
  ifelse(superstore$Discount <= 0.5, "Medium", "High")
)
table(superstore$Discount.Level)
head(superstore[, c("Discount", "Discount.Level")])

# Sort the dataframe by Sales in descending order.

superstore <- superstore[order(superstore$Sales, decreasing = TRUE), ]
View(head(superstore[, c("Order.ID", "Sales")]))
