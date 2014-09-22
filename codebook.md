Background
==========

A cellphone equipped with an accelerometer was given to a number of participants ('Subject's) in a study on movement, related to health. Various measurements were taken by the accelerometer and recorded as a function of time and frequency.
Participants were also asked to engage in a number of activities, such as walking or climbing stairs.

Raw data
========

Raw data is the output from the accelerometer, together with an identifier associated with each participant, and a code together with a key indicating the activity engaged in. The raw data contains 563 variables (including those for Activity and the Subject code), arranged in columns, with 10299 records arranged in rows, from the 30 participants. Only 81 of these variables were required for the final clean dataset.

Code book
========= 
- Participants in the study are given numbers from 1-30.
- Activities recorded were: laying, sitting, standing, walking, walking downstairs and walking upstairs.
- Raw data was initially separated into two datasets: a smaller, test set and larger training set. These two sets were joined into a large set by assembling the two tables of raw data measurements (they share common column names).
- Subject and activity codes were added to this data frame as columns.
- Column names were also added, using the original measurement labels from the raw data.
- Using these column names, only the data pertaining to means or standard deviations were extracted, maintaining the original order, and the remaining accelerometer data was discarded.
- Activity codes were replaced with descriptive strings
- Column names were made more readable by removing punctuation; replacing f and t with 'freq' and 'time' to make the basis on which the data were sampled more clear; and capitalising new words in variable names.
- At this point, the data was deemed 'clean'.
- To aid understanding of the data, the mean of all columns was calculated, as a function of activity and subject.
- These means were written to a text file, ordered to show means grouped by activity (walking, laying, etc.), to facilitate a comparison between individual participants in the study.
- Full explanations of variable names (which still bear reasonable resemblance to the originals) and the measurements to which they relate can be found in the raw data description found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
