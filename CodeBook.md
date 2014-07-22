Code Book for GCD Course Project
==================
<i>by: Mario Gamboa</i>

## Introduction

This solution implements a process to download, transform and clenup data collected from the accelerometers on the Samsung Galaxy S smartphone. The original dataset comes from the [UC Irvine Machine
Learning Repository](http://archive.ics.uci.edu/ml/), a popular repository for machine learning
datasets. In particular, it uses the "Human Activity Recognition Using Smartphones Data Set". The datasource can be found at the [Samsung Galaxy S accelerometer data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) [60Mb]

This file describes the datasets and the procedured followed to get to the resulting datasets.


## Description of variables and data

The raw data represnts experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Variables in the original dataset and the resulting "tidy datasets" from this process are grouped by the time and frequency domains.


## Transformations applied

All transformations to the data are executed by running the script:

      run_analysis.R

The script takes the following steps in order to transform the original dataset:

<ol>
<li><b>Load Information</b></li>

* <b>Download the original file</b>: The script checks if the `/data` directory is present, otherwise it creates it. Then verifies if the original, zipped, raw datafile exists inside that directory, if it doesn't, it proceeds to download the file.<br>

* <b>Unzip file</b>: The script verifies if the raw data files exist by verifying if the `/UCI HAR Dataset` directory exists, otherwise it unzips the file that creates the folder and the necessary data.


<li><b>Merge the training and the test sets to create one data set</b></li>

* <b>Load Datasets</b>: Check in memory to see if the datasets have already been uploaded, if not, proceed to upload the different datasets from the original files. Given these are large datasetns, it is important to check memory for them so that they don't need to be loaded again.<br>
* <b>Merge the Datasets</b>: The test and train data are combined to create single datasets for the X, Y and Subject tables.</li>


<li><b>Extract only the measurements on the mean and standard deviation for each measurement</b></li>

* <b>Select correct columns</b>: Using `grep` over the list of variables, locate those where `mean()` and `std()` are used since those are the only ones required for the final dataset.<br>
* <b>Extract variables</b>: Reduce the original large dataset by selecting only the variables found on the prior step. <br>
* <b>Clean memory</b>: Because these are large datasets, cleanup as much memory as possible by removing all variables that are not needed.<br>


<li><b>Uses descriptive activity names to name the activities in the data set</b></li>

* <b>Convert Activity Column to Factors</b>: First convert the existing Activity column on the dataset to factors in order to replace it with descriptive names.<br>
* <b>Change the Factor names with descriptive Activity Names</b>: Using the Descriptive Activity Lables from the `activity_labels.txt` file, replace teh current factor.<br>


<li><b>Appropriately label the data set with descriptive variable names</b></li>
* <b>Extend Accronyms on variable names</b>: Replace accronyms on the variable names with full words using "camel-case" naming stlye.<br>
* <b>Remove special characters</b>: To improve readibility and usability, remove all special characters from the names.


<li><b>Write first dataset to file</b>: At this point the first dataset is complete and can be written to disk. The dataset is saved to the file `./data/tidySet.csv`</li>

<li><b>Create a second dataset with means</b>: A second, independent tidy data is calculated with the average of each variable for each activity and subject. This is accomplished by using the `aggregate()` function.</li>

<li><b>Write second dataset to file</b>: The second dataset is complete and can be written to disk. The dataset is saved to the file `./data/tidySet2.csv`</li>

</ol>

## Resulting Datasets

# tidySet1.csv

# tidySet2.csv


The following describes descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>
