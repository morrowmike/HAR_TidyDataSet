HAR Tidy Data Set
===============

This is a summarized and tidy version of the Human Activity Recognition Using Smartphones Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The original data set was data collected from 30 volunteers carrying a smartphone with an embedded accelerometer and gyroscope.  3-axial linear acceleration and 3-axial angular velocity data was captured and stored. 30% of the data was stored as test data and 70% was stored as training data.

Data was captured while performing six different activities: walking, walking upstairs, walking downstairs, sitting, standing and laying.

This data set combines the test and training data into a single set, summarized by activity. The original data estimated several statistics from the smart phone signals. Only the mean and the standard deviation of each measurement were used for this tidy data set, and the mean of each of these statistics was calculated and summarized by activity. In other words, this data set has six observations based on activity, and several variables for each observation which represent the mean of the mean statistic or the mean of the standard deviation statistic.

This data set meets the standard definition of a “tidy data set” in the following ways:
1. Each variable forms a column.
2. Each observation forms a row.
3. There are descriptive names for each variable and observation
4. The first row of data are variable names
5. The first column of data are observation labels
6. Special Characters have been removed in variable names
