GCD Course Project
==================
<i>by: Mario Gamboa</i>

## Introduction

The current project uses data collected from the accelerometers from the Samsung Galaxy S smartphone. This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, it uses the "Human Activity Recognition Using Smartphones Data Set". The datasource can be found at:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Samsung Galaxy S accelerometer data</a> [60Mb]

* <b>Description</b>: Measurements of accelerometer data on Samsung Galaxy S smartphones taken to 30 volunteers within an age bracket of 19-48 years. Subjects performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`). The data captured includes information of the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. Additional information can be obtained <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here</a>.



## Scripts and files for this solution

The following scripts are included with this solution: 

* <b>README.md</b>: This file. General explanation of files in the solution and how the scripts work.

* <b>CodeBook.md</b>: Description of the transformation and cleanup process to convert the original datasets into a tidy dataset. It also includes a general description of the resulting variables on the dataset. 

* <b>run_analysis.R</b>: Script that performs the retrieval, clean-up, transformation, merge and rename of the data in order to create the resulting tidy datasets.

* <b>data</b>: Directory in which the original .zip dataset is downloaded and were the resulting tidy datasets are created. <b>tidySet1.csv</b> corresonds to the initial dataset showing only variables related to the 'mean' and 'std' columns from the original set. <b>tidySet2.csv</b> corresponds to the final dataset where only mean values are included by Subject and Activity. 



## Additional Notes

A few additional considerations: 

* The <b>run_analysis.R</b> script downolds the original dataset and unzips it if it is not found on the specified `/data` directory. The file is large so please exercise caution if running the script.

* Both the original dataset [60MB] and the first of the two resulting datasets [10MB] are rather large, so you need to have space and enough RAM to run the script without problems.

* The code in the <b>run_analysis.R</b> script is documented to make it easier to read and follow, besides the <b>CodeBook.md</b> file, it is recommended to review the code on that file for additional details.

