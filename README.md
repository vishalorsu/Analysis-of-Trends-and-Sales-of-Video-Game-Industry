# Analysis of Trends and Sales in the Video Game Industry

## Overview

This project is an exploratory data analysis of the video game sales dataset, which includes information on game titles, platforms, genres, publishers, release years, and sales data. The dataset contains information on more than 16,000 video games from different regions of the world over the past few decades. 

## Authors
- Vishal Orsu
- Rishik Reddy Ragi
- Sai Manish Reddy Pannala

## Project Objectives

1. To understand the distribution of video game sales across different platforms, genres, and regions.
2. To investigate the relationship between a game's genre, platform, and its sales performance.
3. To provide insights that can be used by video game developers and publishers to understand the video game market and consumer preferences.

## Research Questions

1. Are certain genres of games more popular in specific regions?
2. How has the video game industry evolved over time?
3. Is there any relationship between critic and user scores and sales?

## Methodology

- **Data Source**: The dataset was obtained from [VGChartz](https://www.vgchartz.com/).
- **Tools Used**: RStudio, ggplot2, Random Forest, Multiple Linear Regression
- **Steps**:
  1. Data Cleaning and Preprocessing
  2. Exploratory Data Analysis (EDA)
  3. Visualization Techniques: Bar Charts, Heatmaps, Scatter Plots
  4. Statistical Tests: t-tests
  5. Model Building: Random Forest, Multiple Linear Regression

## Data Visualizations and Analysis

The analysis includes various visualizations to illustrate the trends and patterns in the dataset:
- **Bar Charts**: Distribution of video game sales across platforms, genres, and years.
- **Heatmaps**: Number of games released across platforms and genres.
- **Scatter Plots**: Relationship between sales, critic scores, and user scores.
- **Line Plots**: Video game sales over time.
- **Box Plots**: Relationship between global sales, critic scores, and user scores.

## Models Used

### Random Forest
- **Purpose**: To predict global sales of video games based on factors like the game's name, platform, year of release, genre, and publisher.
- **Performance**: Root Mean Squared Error (RMSE) of 0.09848887, indicating good predictive power.

### Multiple Linear Regression
- **Purpose**: To model the linear relationship between video game sales and various independent variables.
- **Performance**: The model met the assumptions of linear regression but indicated some scope for improvement.

## Conclusion

This analysis provides a comprehensive overview of the video game market from 1980 to 2020. The insights gained from this analysis can help game publishers and developers make data-driven decisions and improve their marketing strategies.

## References

1. [Video Game Sales with Ratings - Kaggle](https://www.kaggle.com/datasets/rush4ratio/video-game-sales-with-ratings)
2. [VGChartz](https://www.vgchartz.com/)
3. [The Console Wars: PS vs Xbox vs Wii - Kaggle](https://www.kaggle.com/code/arthurtok/the-console-wars-ps-vs-xbox-vs-wii)
4. [ggplot2: Create Elegant Data Visualisations Using the Grammar of Graphics](https://ggplot2.tidyverse.org/)
5. [randomForest: Breiman and Cutler's Random Forests for Classification and Regression](https://cran.r-project.org/web/packages/randomForest/index.html)

## How to Run

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/videogame-sales-analysis.git
2. Open the project in RStudio.
3. Run the analysis.R script to see the data cleaning, preprocessing, and visualizations.
4. Run the models.R script to see the Random Forest and Multiple Linear Regression models in action.

## Contact
For any questions or feedback, please reach out to us via email:

Vishal Orsu: vorsu@gmu.edu
Rishik Reddy Ragi: rragi@gmu.edu
Sai Manish Reddy Pannala: Spannala@gmu.edu
