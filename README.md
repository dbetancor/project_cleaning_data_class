DATA:

The data that we have comes in two sets: a training set with 30% of subjects and a test with 70%. The training set has 2947 observations and the test set 7352.

For each set there is 3 files with data we need:
  1. a subject file with values from 1 to 30 indicating the person that took the test. They are factors for our analysis.
  2. an activity that is named y_.txt. The activites go from 1 to 6 and they are factors. These are:
     1 WALKING
     2 WALKING_UPSTAIRS
     3 WALKING_DOWNSTAIRS
     4 SITTING
     5 STANDING
     6 LAYING
  3. A test file with a 561-feature vector with time and frequency domain variables. This variables are described in 

There are 9 more files in under the Inertial Signals folder. They are the angular velocities from the gyro around the x,y,z axis in rad/seg, the acceleration in the x,y,z axis in g units, and the acceleration in these axis after passing a lowband filter to take out the gravity. There are 128 readings/row at intervals of 2.56 sec and 50% overlap.


At the end we want to have a tidy dataset with the merge of both sets and the folowing information: subjects, activity, mean and std of the angular velocities and body accelerations.

The script run_analysis.R is self commented. It will read and merge all the datasets, printing information as it does it. Rename the activities and names to more proper ones. Save it with the name tidy_vector.txt and create and save a summary with name tidy_summary.csv



 