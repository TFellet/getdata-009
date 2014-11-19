# CodeBook 

## Dataset explanation

This dataset contains sensor signals (accelerometer and gyroscope) from a phone while the subjects were doing multiple activities.

The script uses the following fles of the dataset : 

* test/subject_test.txt - [2947 x 1] - the data indicating which subject is doing the experiment (test dataset)
* test/X_test.txt - [2947 x 561] - the data from the sensors (test dataset)
* test/y_test.txt - [2947 x 1] - the data indicating which activity the subject is doing (test dataset)
* train/subject_train.txt - [7352 x 1] - the data indicating which subject is doing the experiment (train dataset)
* train/X_train.txt - [7352 x 561] - the data from the sensors (train dataset)
* train/y_train.txt - [7352 x 1] - the data indicating which activity the subject is doing (train dataset)
* activity_labels.txt - [6 x 2] - the labels for the differents activities
* features.txt - [561 x 2] - the list of all the features collected by the sensors

## Code explanation

* First of all the script bind by column the data from the 3 files from the test dataset and do the same with the train dataset. Then it appends by row the test data at the end of the train dataset.

* In the second step, the script only keeps the data for the mean or the standard deviation for each mesurement. I chose to keep the mesurement like meanFreq() because it's still a mean mesurement, but i removed the mesurement like "angle(X,gravityMean)" because it's an angle mesurement.

* In the third step, the script collects the data from the activity_labels.txt file and replace the id of the activities in the original dataset

* In the fourth step, the script collects the data from features.txt and replace the names of the columns by the name of the mesurement.

* In the fifth step, the script creates a second, independent tidy data set with the average of each variable for each activity and each subject with the help of the plyr library

* In the last step, the script export this newly created dataset in a text file, inside the dataset folder.

## Variables in the tidy dataset

"tidy.txt" is a comma-separated-values file with a header, containing 180 observations of 81 variables.

The 180 observations comes from the combinaisons of the 6 possibles activities for each of the 30 differents subjects.

* tidy$subject (1st column) contains the ID of the subject (from 1 to 30)
* tidy$activity (2nd column) contains the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* the last 79 columns contains the mean of each mesurement about the mean or the standard deviation selected from the original dataset.

The list of all the mesurement about the mean or the standard deviation is available just below:

1. "tBodyAcc-mean()-X"
2. "tBodyAcc-mean()-Y"
3. "tBodyAcc-mean()-Z"
4. "tBodyAcc-std()-X"
5. "tBodyAcc-std()-Y"
6. "tBodyAcc-std()-Z"
7. "tGravityAcc-mean()-X"
8. "tGravityAcc-mean()-Y"
9. "tGravityAcc-mean()-Z"
10. "tGravityAcc-std()-X"
11. "tGravityAcc-std()-Y"
12. "tGravityAcc-std()-Z"
13. "tBodyAccJerk-mean()-X"
14. "tBodyAccJerk-mean()-Y"
15. "tBodyAccJerk-mean()-Z"
16. "tBodyAccJerk-std()-X"
17. "tBodyAccJerk-std()-Y"
18. "tBodyAccJerk-std()-Z"
19. "tBodyGyro-mean()-X"
20. "tBodyGyro-mean()-Y"
21. "tBodyGyro-mean()-Z"
22. "tBodyGyro-std()-X"
23. "tBodyGyro-std()-Y"
24. "tBodyGyro-std()-Z"
25. "tBodyGyroJerk-mean()-X"
26. "tBodyGyroJerk-mean()-Y"
27. "tBodyGyroJerk-mean()-Z"
28. "tBodyGyroJerk-std()-X"
29. "tBodyGyroJerk-std()-Y"
30. "tBodyGyroJerk-std()-Z"
31. "tBodyAccMag-mean()"
32. "tBodyAccMag-std()"
33. "tGravityAccMag-mean()"
34. "tGravityAccMag-std()"
35. "tBodyAccJerkMag-mean()"
36. "tBodyAccJerkMag-std()"
37. "tBodyGyroMag-mean()"
38. "tBodyGyroMag-std()"
39. "tBodyGyroJerkMag-mean()"
40. "tBodyGyroJerkMag-std()"
41. "fBodyAcc-mean()-X"
42. "fBodyAcc-mean()-Y"
43. "fBodyAcc-mean()-Z"
44. "fBodyAcc-std()-X"
45. "fBodyAcc-std()-Y"
46. "fBodyAcc-std()-Z"
47. "fBodyAcc-meanFreq()-X"
48. "fBodyAcc-meanFreq()-Y"
49. "fBodyAcc-meanFreq()-Z"
50. "fBodyAccJerk-mean()-X"
51. "fBodyAccJerk-mean()-Y"
52. "fBodyAccJerk-mean()-Z"
53. "fBodyAccJerk-std()-X"
54. "fBodyAccJerk-std()-Y"
55. "fBodyAccJerk-std()-Z"
56. "fBodyAccJerk-meanFreq()-X"
57. "fBodyAccJerk-meanFreq()-Y"
58. "fBodyAccJerk-meanFreq()-Z"
59. "fBodyGyro-mean()-X"
60. "fBodyGyro-mean()-Y"
61. "fBodyGyro-mean()-Z"
62. "fBodyGyro-std()-X"
63. "fBodyGyro-std()-Y"
64. "fBodyGyro-std()-Z"
65. "fBodyGyro-meanFreq()-X"
66. "fBodyGyro-meanFreq()-Y"
67. "fBodyGyro-meanFreq()-Z"
68. "fBodyAccMag-mean()"
69. "fBodyAccMag-std()"
70. "fBodyAccMag-meanFreq()"
71. "fBodyBodyAccJerkMag-mean()"
72. "fBodyBodyAccJerkMag-std()"
73. "fBodyBodyAccJerkMag-meanFreq
74. "fBodyBodyGyroMag-mean()"
75. "fBodyBodyGyroMag-std()"
76. "fBodyBodyGyroMag-meanFreq()"
77. "fBodyBodyGyroJerkMag-mean()"
78. "fBodyBodyGyroJerkMag-std()"
79. "fBodyBodyGyroJerkMag-meanFreq()"