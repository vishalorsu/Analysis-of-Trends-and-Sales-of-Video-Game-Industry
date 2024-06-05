
#==================================Global_Sales_Top10================================
library(dplyr)
library(ggplot2)

data <- read.csv("D:/RWorkshop/vgsales.csv")

# get the top 10 publishers by global sales
top_publishers <- data %>%
  group_by(Publisher) %>%
  summarise(Total_Sales = sum(Global_Sales)) %>%
  arrange(desc(Total_Sales)) %>%
  head(10)

# create a named vector of colors for each publisher
publisher_colors <- c("Nintendo" = "#FF7F0E", 
                      "Electronic Arts" = "#1F77B4", 
                      "Activision" = "#FFBB78", 
                      "Sony Computer Entertainment" = "#2CA02C", 
                      "Ubisoft" = "#9467BD", 
                      "Take-Two Interactive" = "#8C564B", 
                      "THQ" = "#E377C2", 
                      "Konami Digital Entertainment" = "#7F7F7F", 
                      "Sega" = "#BCBD22", 
                      "Namco Bandai Games" = "#17BECF")

ggplot(top_publishers, aes(x = Publisher, y = Total_Sales, fill = Publisher)) + 
  geom_bar(stat = "identity") + 
  scale_fill_manual(values = publisher_colors) +
  ggtitle("Global Sales of Games by Top 10 Publishers") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))





#============================================


library(dplyr)
library(ggplot2)
library(png)

data <- read.csv("D:/RWorkshop/vgsales.csv")

# get the top 10 publishers by global sales
top_publishers <- data %>%
  group_by(Publisher) %>%
  summarise(Total_Sales = sum(Global_Sales)) %>%
  arrange(desc(Total_Sales)) %>%
  head(10)

# create a named vector of images for each publisher
publisher_images <- c("Nintendo" = "1.png",
                      "Electronic Arts" = "2.png",
                      "Activision" = "3.png",
                      "Sony Computer Entertainment" = "4.png",
                      "Ubisoft" = "5.png",
                      "Take-Two Interactive" = "6.png",
                      "THQ" = "7.png",
                      "Konami Digital Entertainment" = "8.png",
                      "Sega" = "9.png",
                      "Namco Bandai Games" = "10.png")

# load the images into a list
images <- lapply(publisher_images, readPNG)

# add the images to the plot
ggplot(top_publishers, aes(x = Publisher, y = Total_Sales)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  ggtitle("Global Sales of Games by Top 10 Publishers") +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  coord_cartesian(clip = "off") +
  annotation_custom(
    grob = lapply(images, function(img) rasterGrob(as.raster(img))),
    xmin = seq(1, 10, length.out = 10),
    xmax = seq(1, 10, length.out = 10) + 0.8,
    ymin = -1.5, ymax = -0.5
  )

#=============================HeatMap===========================================



library(ggplot2)
library(reshape2)

# subset the data and calculate total sales by genre
comp_genre <- data[c("Genre", "NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales")]
comp_map <- aggregate(cbind(NA_Sales, EU_Sales, JP_Sales, Other_Sales) ~ Genre, data=comp_genre, FUN=sum)

# reshape data to long format for ggplot
comp_map_long <- melt(comp_map, id.vars="Genre")

# create the heatmap
ggplot(comp_map_long, aes(x=variable, y=Genre, fill=value)) +
  geom_tile() +
  scale_fill_gradient(low="white", high="steelblue", na.value="white") +
  theme_minimal() +
  labs(title="Total Sales by Genre and Region", x="Region", y="Genre", fill="Total Sales (millions)") +
  theme(plot.title = element_text(hjust = 0.5, size=16),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14),
        legend.title = element_text(size=14),
        legend.text = element_text(size=12),
        legend.position = "right")




#======================================TotalSalesByRegionAndGenre==============

library(dplyr)
library(reshape2)
library(ggplot2)

comp_genre <- data[c('Genre', 'NA_Sales', 'EU_Sales', 'JP_Sales', 'Other_Sales')]
comp_map <- comp_genre %>% group_by(Genre) %>% summarise_all(sum)
comp_map_melt <- melt(comp_map, id.vars='Genre')

ggplot(comp_map_melt, aes(x=variable, y=Genre, fill=value)) +
  geom_tile() +
  scale_fill_gradient(low="#FEE5D9", high="#A50F15") +
  geom_text(aes(label=scales::comma(value)), color='black', size=3) +
  labs(title='Total Sales by Region and Genre', x='North America                Europe                Japan                Other_sales', y='Genre') +
  theme_minimal() +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank(),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=14, margin=margin(0,10,0,0))) +
  coord_fixed(ratio=1/4)


#===============================TotalSalesByRegionandGenre==============================

library(ggplot2)
library(tidyr)

# Reshape data
comp_table <- comp_map %>% 
  gather(key = "Sale_Area", value = "Sale_Price", -Genre)

# Create custom color palette
my_palette <- c("#0072c6", "#ffcb05", "#ff7f00", "#808080")

# Create plot
ggplot(comp_table, aes(x = Genre, y = Sale_Price, fill = Sale_Area)) +
  # Add stacked bar chart
  geom_bar(stat = "identity", position = "stack") +
  # Set custom colors
  scale_fill_manual(values = my_palette) +
  # Add labels to bars
  geom_text(aes(label = scales::comma(Sale_Price)), position = position_stack(vjust = 0.5), size = 3) +
  # Add custom title and axis labels
  labs(title = "Total Sales by Region and Genre", x = "", y = "Total Sales") +
  # Set custom theme
  theme_minimal() +
  theme(
    # Remove legend title
    legend.title = element_blank(),
    # Set legend position and font size
    legend.position = "top",
    legend.text = element_text(size = 12),
    # Increase font size for axis labels
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12),
    axis.title.y = element_text(size = 14, margin = margin(0, 10, 0, 0))
  )

#============================
library(ggplot2)


# Create a new data frame with sales data aggregated by year
sales_by_year <- data %>%
  group_by(Year) %>%
  summarise(
    NA_Sales = sum(NA_Sales),
    EU_Sales = sum(EU_Sales),
    JP_Sales = sum(JP_Sales),
    Other_Sales = sum(Other_Sales)
  )

# Melt the data frame to long format
sales_by_year_melted <- melt(sales_by_year, id.vars = "Year", variable.name = "Region", value.name = "Sales")

# Create the line plot
ggplot(sales_by_year_melted, aes(x = Year, y = Sales, color = Region)) +
  geom_line() +
  labs(title = "Video Game Sales by Region Over Time", x = "Year", y = "Sales (millions)") +
  scale_color_manual(values = c("NA_Sales" = "#FFA500", "EU_Sales" = "#4169E1", "JP_Sales" = "#FF69B4", "Other_Sales" = "#808080"))
#===================================R3==========================================