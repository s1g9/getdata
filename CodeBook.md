-------------------------------------------------------------------------------------------------------------------
Variable used in the script run_analysis.R
---------------------------------------------------------------------------------------------------------------------
path: used for the path between the working directory and the dataset folder (“UCI HAR DATASET”)

features:  used to store which column no in observation vector matches to which feature

mean_features: used  to store the column no and name of mean related features

std_features: used  to store the column no and name of standard deviation related features

mean_std_features: used  to store combined dataset of above variables mean_features and std_features


subject_test: used to store the data of subject performing the activity from test dataset

subject_train: used to store the data of subject performing the activity from train dataset

subject: used to store combined dataset of subject from test and train to a single dataset in order(test then train)


X_test: used to store the data of observations from test dataset

X_train: used to store the data of observations from the train dataset

X: used to store combined dataset of observations from test and train to a single dataset in order(test then train)


Y_test: used to store the data of activity being performed from test dataset

Y_train: used to store the data of activity being performed from the train dataset

Y: used to store combined dataset of activity being performed from test and train to a single dataset in order(test then train)

activities : used to store the data of the names of each activity

together :used to store combined dataset of subject,activity and observations in one dataset


-----------------------------------------------------------------------------------------------------------------------------
Now, lets see the transformations made to the dataset
-----------------------------------------------------------------------------------------------------------------------------
features: tabular data frame form of features.txt

Source: local data frame [561 x 2]

      id          variable
   (int)            (fctr)
   
  1 tBodyAcc-mean()-X

  2 tBodyAcc-mean()-Y

  3 tBodyAcc-mean()-Z

  4  tBodyAcc-std()-X

  5  tBodyAcc-std()-Y

  6  tBodyAcc-std()-Z

  7  tBodyAcc-mad()-X

  8  tBodyAcc-mad()-Y

  9  tBodyAcc-mad()-Z

  10  tBodyAcc-max()-X
...               ...

----------------------------------------

mean_features: Subsetting the features dataset to get features realed to mean

Source: local data frame [33 x 2]

      id              variable
   (int)                (fctr)

    1     tBodyAcc-mean()-X

    2     tBodyAcc-mean()-Y

    3     tBodyAcc-mean()-Z

    41  tGravityAcc-mean()-X

    42  tGravityAcc-mean()-Y

    43  tGravityAcc-mean()-Z

    81 tBodyAccJerk-mean()-X

    82 tBodyAccJerk-mean()-Y

    83 tBodyAccJerk-mean()-Z

    121    tBodyGyro-mean()-X
  ...                   ...
----------------------------------------
std_features: Subsetting the features dataset to get features realed to standard deviation

Source: local data frame [33 x 2]

      id             variable
   (int)               (fctr)

    4     tBodyAcc-std()-X

    5     tBodyAcc-std()-Y

    6     tBodyAcc-std()-Z

    44  tGravityAcc-std()-X

    45  tGravityAcc-std()-Y

    46  tGravityAcc-std()-Z

    84 tBodyAccJerk-std()-X

    85 tBodyAccJerk-std()-Y

    86 tBodyAccJerk-std()-Z

    124    tBodyGyro-std()-X
..   ...                  ...
----------------------------------------
mean_std_features : Combining mean and standard deviation features .Also rearranging by id

Source: local data frame [66 x 2]

      id             variable
   (int)               (fctr)

     1    tBodyAcc-mean()-X

     2    tBodyAcc-mean()-Y

     3    tBodyAcc-mean()-Z

     4     tBodyAcc-std()-X

     5     tBodyAcc-std()-Y

     6     tBodyAcc-std()-Z

     41 tGravityAcc-mean()-X

     42 tGravityAcc-mean()-Y

     43 tGravityAcc-mean()-Z

     44  tGravityAcc-std()-X

..   ...                  ...

----------------------------------------
subject_test : tabular data frame form of subject_test.txt

Source: local data frame [2,947 x 1]

      V1
   (int)

     2

     2

     2

     2

     2

     2

     2

     2

     2

     2
   ...

Also, see table(subject_test)

  2   4   9  10  12  13  18  20  24 

302 317 288 294 320 327 364 354 381 

----------------------------------------

subject_train : tabular data frame form of subject_train.txt

Source: local data frame [7,352 x 1]

      V1
   (int)

     1

     1

     1

     1

     1

     1

     1

     1

     1

     1
   ...

Also, see table(subject_train)

  1   3   5   6   7   8  11  14  15  16  17  19  21  22  23  25  26  27  28  29  30 

347 341 302 325 308 281 316 323 328 366 368 360 408 321 372 409 392 376 382 344 383 

----------------------------------------
subject : Combining subject_test and subject_train .Also keeping the order first test dataset and then train dataset

Source: local data frame [10,299 x 1]

      V1
   (int)

    2

    2

    2

    2

    2

    2

    2

    2

    2

    2
  ...

Also, see table(subject)

  1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30 

347 302 341 317 302 325 308 281 288 294 316 320 327 323 328 366 368 364 360 354 408 321 372 381 409 392 376 382 344 383

------------------------------------------------------------------------------------------------------------------------
X_test : Subset of the X_test.txt on the basis of the mean_std_features required for the dataset. Note that as the mean_std_features was arranged in order. So, will be this dataset be ordered.

Source: local data frame [2,947 x 66]

       V1          V2          V3         V4         V5         V6       V41        V42       V43        V44        V45        V46        V81
      (dbl)       (dbl)       (dbl)      (dbl)      (dbl)      (dbl)     (dbl)      (dbl)     (dbl)      (dbl)      (dbl)      (dbl)      (dbl)

 0.2571778 -0.02328523 -0.01465376 -0.9384040 -0.9200908 -0.6676833 0.9364893 -0.2827192 0.1152882 -0.9254273 -0.9370141 -0.5642884 0.07204601

 0.2860267 -0.01316336 -0.11908252 -0.9754147 -0.9674579 -0.9449582 0.9274036 -0.2892151 0.1525683 -0.9890571 -0.9838872 -0.9647811 0.07018069

 0.2754848 -0.02605042 -0.11815167 -0.9938190 -0.9699255 -0.9627480 0.9299150 -0.2875128 0.1460856 -0.9959365 -0.9882505 -0.9815796 0.06936778

 0.2702982 -0.03261387 -0.11752018 -0.9947428 -0.9732676 -0.9670907 0.9288814 -0.2933958 0.1429259 -0.9931392 -0.9704192 -0.9915917 0.07485289

 0.2748330 -0.02784779 -0.12952716 -0.9938525 -0.9674455 -0.9782950 0.9265997 -0.3029609 0.1383067 -0.9955746 -0.9709604 -0.9680853 0.07837679

 0.2792199 -0.01862040 -0.11390197 -0.9944552 -0.9704169 -0.9653163 0.9256632 -0.3089397 0.1305608 -0.9988423 -0.9907387 -0.9712319 0.07598039

 0.2797459 -0.01827103 -0.10399988 -0.9958192 -0.9763536 -0.9777247 0.9261366 -0.3095639 0.1285666 -0.9974362 -0.9965680 -0.9882036 0.07413463

 0.2746005 -0.02503513 -0.11683085 -0.9955944 -0.9820689 -0.9852624 0.9265862 -0.3107735 0.1295801 -0.9973908 -0.9875571 -0.9897986 0.07619445

 0.2725287 -0.02095401 -0.11447249 -0.9967841 -0.9759063 -0.9865970 0.9255553 -0.3157374 0.1264261 -0.9951463 -0.9809775 -0.9812776 0.07917521

 0.2757457 -0.01037199 -0.09977589 -0.9983731 -0.9869329 -0.9910219 0.9241734 -0.3175966 0.1245839 -0.9980017 -0.9893933 -0.9919684 0.07714573

..       ...         ...         ...        ...        ...        ...       ...        ...       ...        ...        ...        ...        ...

Variables not shown: V82 (dbl), V83 (dbl), V84 (dbl), V85 (dbl), V86 (dbl), V121 (dbl), V122 (dbl), V123 (dbl), V124 (dbl), V125 (dbl), V126 (dbl), V161
  (dbl), V162 (dbl), V163 (dbl), V164 (dbl), V165 (dbl), V166 (dbl), V201 (dbl), V202 (dbl), V214 (dbl), V215 (dbl), V227 (dbl), V228 (dbl), V240 (dbl),
  V241 (dbl), V253 (dbl), V254 (dbl), V266 (dbl), V267 (dbl), V268 (dbl), V269 (dbl), V270 (dbl), V271 (dbl), V345 (dbl), V346 (dbl), V347 (dbl), V348
  (dbl), V349 (dbl), V350 (dbl), V424 (dbl), V425 (dbl), V426 (dbl), V427 (dbl), V428 (dbl), V429 (dbl), V503 (dbl), V504 (dbl), V516 (dbl), V517 (dbl),
  V529 (dbl), V530 (dbl), V542 (dbl), V543 (dbl)

------------------------------------------------------------------------------------------------------------------------

 X_train: Subset of the X_train.txt on the basis of the mean_std_features required for the dataset. Note that the order of features is same as X_test variable.

Source: local data frame [7,352 x 66]

          V1           V2         V3         V4         V5         V6       V41        V42        V43        V44        V45        V46        V81
       (dbl)        (dbl)      (dbl)      (dbl)      (dbl)      (dbl)     (dbl)      (dbl)      (dbl)      (dbl)      (dbl)      (dbl)      (dbl)

 0.2885845 -0.020294171 -0.1329051 -0.9952786 -0.9831106 -0.9135264 0.9633961 -0.1408397 0.11537494 -0.9852497 -0.9817084 -0.8776250 0.07799634

 0.2784188 -0.016410568 -0.1235202 -0.9982453 -0.9753002 -0.9603220 0.9665611 -0.1415513 0.10937881 -0.9974113 -0.9894474 -0.9316387 0.07400671

 0.2796531 -0.019467156 -0.1134617 -0.9953796 -0.9671870 -0.9789440 0.9668781 -0.1420098 0.10188392 -0.9995740 -0.9928658 -0.9929172 0.07363596

 0.2791739 -0.026200646 -0.1232826 -0.9960915 -0.9834027 -0.9906751 0.9676152 -0.1439765 0.09985014 -0.9966456 -0.9813928 -0.9784764 0.07732061

 0.2766288 -0.016569655 -0.1153619 -0.9981386 -0.9808173 -0.9904816 0.9682244 -0.1487502 0.09448590 -0.9984293 -0.9880982 -0.9787449 0.07344436

 0.2771988 -0.010097850 -0.1051373 -0.9973350 -0.9904868 -0.9954200 0.9679482 -0.1482100 0.09190972 -0.9989793 -0.9867539 -0.9973064 0.07793244

 0.2794539 -0.019640776 -0.1100221 -0.9969210 -0.9671859 -0.9831178 0.9679295 -0.1442821 0.09314463 -0.9993325 -0.9885747 -0.9920159 0.08217077

 0.2774325 -0.030488303 -0.1253604 -0.9965593 -0.9667284 -0.9815853 0.9684915 -0.1467054 0.09170816 -0.9981183 -0.9729600 -0.9765688 0.07236423

 0.2772934 -0.021750698 -0.1207508 -0.9973285 -0.9612453 -0.9836716 0.9684812 -0.1543740 0.08511826 -0.9977894 -0.9756451 -0.9689613 0.07528437

 0.2805857 -0.009960298 -0.1060652 -0.9948034 -0.9727584 -0.9862439 0.9684180 -0.1563020 0.08087447 -0.9973622 -0.9905016 -0.9967423 0.07636932

..       ...          ...        ...        ...        ...        ...       ...        ...        ...        ...        ...        ...        ...

Variables not shown: V82 (dbl), V83 (dbl), V84 (dbl), V85 (dbl), V86 (dbl), V121 (dbl), V122 (dbl), V123 (dbl), V124 (dbl), V125 (dbl), V126 (dbl), V161
  (dbl), V162 (dbl), V163 (dbl), V164 (dbl), V165 (dbl), V166 (dbl), V201 (dbl), V202 (dbl), V214 (dbl), V215 (dbl), V227 (dbl), V228 (dbl), V240 (dbl),
  V241 (dbl), V253 (dbl), V254 (dbl), V266 (dbl), V267 (dbl), V268 (dbl), V269 (dbl), V270 (dbl), V271 (dbl), V345 (dbl), V346 (dbl), V347 (dbl), V348
  (dbl), V349 (dbl), V350 (dbl), V424 (dbl), V425 (dbl), V426 (dbl), V427 (dbl), V428 (dbl), V429 (dbl), V503 (dbl), V504 (dbl), V516 (dbl), V517 (dbl),
  V529 (dbl), V530 (dbl), V542 (dbl), V543 (dbl)

------------------------------------------------------------------------------------------------------------------------
 X : Combined the subsets X_test and X_train row-wise. The row-wise bind will give us correct dataset as both the datasets are ordered by mean_std_features$id in horizontal axis and are in order of test then train in vertical axis 
  
  Source: local data frame [10,299 x 66]

          V1          V2          V3         V4         V5         V6       V41        V42       V43        V44        V45        V46        V81
       (dbl)       (dbl)       (dbl)      (dbl)      (dbl)      (dbl)     (dbl)      (dbl)     (dbl)      (dbl)      (dbl)      (dbl)      (dbl)

 0.2571778 -0.02328523 -0.01465376 -0.9384040 -0.9200908 -0.6676833 0.9364893 -0.2827192 0.1152882 -0.9254273 -0.9370141 -0.5642884 0.07204601

 0.2860267 -0.01316336 -0.11908252 -0.9754147 -0.9674579 -0.9449582 0.9274036 -0.2892151 0.1525683 -0.9890571 -0.9838872 -0.9647811 0.07018069

 0.2754848 -0.02605042 -0.11815167 -0.9938190 -0.9699255 -0.9627480 0.9299150 -0.2875128 0.1460856 -0.9959365 -0.9882505 -0.9815796 0.06936778

 0.2702982 -0.03261387 -0.11752018 -0.9947428 -0.9732676 -0.9670907 0.9288814 -0.2933958 0.1429259 -0.9931392 -0.9704192 -0.9915917 0.07485289

 0.2748330 -0.02784779 -0.12952716 -0.9938525 -0.9674455 -0.9782950 0.9265997 -0.3029609 0.1383067 -0.9955746 -0.9709604 -0.9680853 0.07837679

 0.2792199 -0.01862040 -0.11390197 -0.9944552 -0.9704169 -0.9653163 0.9256632 -0.3089397 0.1305608 -0.9988423 -0.9907387 -0.9712319 0.07598039

 0.2797459 -0.01827103 -0.10399988 -0.9958192 -0.9763536 -0.9777247 0.9261366 -0.3095639 0.1285666 -0.9974362 -0.9965680 -0.9882036 0.07413463

 0.2746005 -0.02503513 -0.11683085 -0.9955944 -0.9820689 -0.9852624 0.9265862 -0.3107735 0.1295801 -0.9973908 -0.9875571 -0.9897986 0.07619445

 0.2725287 -0.02095401 -0.11447249 -0.9967841 -0.9759063 -0.9865970 0.9255553 -0.3157374 0.1264261 -0.9951463 -0.9809775 -0.9812776 0.07917521

 0.2757457 -0.01037199 -0.09977589 -0.9983731 -0.9869329 -0.9910219 0.9241734 -0.3175966 0.1245839 -0.9980017 -0.9893933 -0.9919684 0.07714573

..       ...         ...         ...        ...        ...        ...       ...        ...       ...        ...        ...        ...        ...

Variables not shown: V82 (dbl), V83 (dbl), V84 (dbl), V85 (dbl), V86 (dbl), V121 (dbl), V122 (dbl), V123 (dbl), V124 (dbl), V125 (dbl), V126 (dbl), V161
  (dbl), V162 (dbl), V163 (dbl), V164 (dbl), V165 (dbl), V166 (dbl), V201 (dbl), V202 (dbl), V214 (dbl), V215 (dbl), V227 (dbl), V228 (dbl), V240 (dbl),
  V241 (dbl), V253 (dbl), V254 (dbl), V266 (dbl), V267 (dbl), V268 (dbl), V269 (dbl), V270 (dbl), V271 (dbl), V345 (dbl), V346 (dbl), V347 (dbl), V348
  (dbl), V349 (dbl), V350 (dbl), V424 (dbl), V425 (dbl), V426 (dbl), V427 (dbl), V428 (dbl), V429 (dbl), V503 (dbl), V504 (dbl), V516 (dbl), V517 (dbl),
  V529 (dbl), V530 (dbl), V542 (dbl), V543 (dbl)

------------------------------------------------------------------------------------------------------------------------
 Y_test : tabular data frame form of Y_test.txt

Source: local data frame [2,947 x 1]

      V1
   (int)

     5

     5

     5

     5

     5

     5

     5

     5

     5

     5

   ...

------------------------------------------------------------------------------------------------------------------------
Y_train : tabular data frame form of Y_train.txt

Source: local data frame [7,352 x 1]

      V1
   (int)

     5

     5

     5

     5

     5

     5

     5

     5

     5

     5

   ..
------------------------------------------------------------------------------------------------------------------------
activities : the data frame of acitivies labels from activity_labels.txt

Source: local data frame [6 x 2]

     V1                 V2
  (int)             (fctr)

    1            WALKING

    2   WALKING_UPSTAIRS

    3 WALKING_DOWNSTAIRS

    4            SITTING

    5           STANDING

    6             LAYING

------------------------------------------------------------------------------------------------------------------------
Y : the combined data frame of Y_test and Y_train in respective order. Also the activity no's are replaced by acitivity names

Source: local data frame [10,299 x 1]

         V2
     (fctr)

 STANDING

 STANDING

 STANDING

 STANDING

 STANDING

 STANDING

 STANDING

 STANDING

 STANDING

 STANDING

      ...

------------------------------------------------------------------------------------------------------------------------
together : combined dataset of subject,Y,X with appropriate variable names.

Source: local data frame [10,299 x 68]

   subject activity tBodyAcc mean   X tBodyAcc mean   Y tBodyAcc mean   Z tBodyAcc std   X tBodyAcc std   Y tBodyAcc std   Z tGravityAcc mean   X
     (int)   (fctr)             (dbl)             (dbl)             (dbl)            (dbl)            (dbl)            (dbl)                (dbl)

       2 STANDING         0.2571778       -0.02328523       -0.01465376       -0.9384040       -0.9200908       -0.6676833            0.9364893

       2 STANDING         0.2860267       -0.01316336       -0.11908252       -0.9754147       -0.9674579       -0.9449582            0.9274036

       2 STANDING         0.2754848       -0.02605042       -0.11815167       -0.9938190       -0.9699255       -0.9627480            0.9299150

       2 STANDING         0.2702982       -0.03261387       -0.11752018       -0.9947428       -0.9732676       -0.9670907            0.9288814

       2 STANDING         0.2748330       -0.02784779       -0.12952716       -0.9938525       -0.9674455       -0.9782950            0.9265997

       2 STANDING         0.2792199       -0.01862040       -0.11390197       -0.9944552       -0.9704169       -0.9653163            0.9256632

       2 STANDING         0.2797459       -0.01827103       -0.10399988       -0.9958192       -0.9763536       -0.9777247            0.9261366

       2 STANDING         0.2746005       -0.02503513       -0.11683085       -0.9955944       -0.9820689       -0.9852624            0.9265862

       2 STANDING         0.2725287       -0.02095401       -0.11447249       -0.9967841       -0.9759063       -0.9865970            0.9255553

       2 STANDING         0.2757457       -0.01037199       -0.09977589       -0.9983731       -0.9869329       -0.9910219            0.9241734

     ...      ...               ...               ...               ...              ...              ...              ...                  ...

Variables not shown: tGravityAcc mean Y (dbl), tGravityAcc mean Z (dbl), tGravityAcc std X (dbl), tGravityAcc std Y (dbl), tGravityAcc std Z (dbl),
  tBodyAccJerk mean X (dbl), tBodyAccJerk mean Y (dbl), tBodyAccJerk mean Z (dbl), tBodyAccJerk std X (dbl), tBodyAccJerk std Y (dbl), tBodyAccJerk std Z
  (dbl), tBodyGyro mean X (dbl), tBodyGyro mean Y (dbl), tBodyGyro mean Z (dbl), tBodyGyro std X (dbl), tBodyGyro std Y (dbl), tBodyGyro std Z (dbl),
  tBodyGyroJerk mean X (dbl), tBodyGyroJerk mean Y (dbl), tBodyGyroJerk mean Z (dbl), tBodyGyroJerk std X (dbl), tBodyGyroJerk std Y (dbl), tBodyGyroJerk
  std Z (dbl), tBodyAccMag mean (dbl), tBodyAccMag std (dbl), tGravityAccMag mean (dbl), tGravityAccMag std (dbl), tBodyAccJerkMag mean (dbl),
  tBodyAccJerkMag std (dbl), tBodyGyroMag mean (dbl), tBodyGyroMag std (dbl), tBodyGyroJerkMag mean (dbl), tBodyGyroJerkMag std (dbl), fBodyAcc mean X
  (dbl), fBodyAcc mean Y (dbl), fBodyAcc mean Z (dbl), fBodyAcc std X (dbl), fBodyAcc std Y (dbl), fBodyAcc std Z (dbl), fBodyAccJerk mean X (dbl),
  fBodyAccJerk mean Y (dbl), fBodyAccJerk mean Z (dbl), fBodyAccJerk std X (dbl), fBodyAccJerk std Y (dbl), fBodyAccJerk std Z (dbl), fBodyGyro mean X
  (dbl), fBodyGyro mean Y (dbl), fBodyGyro mean Z (dbl), fBodyGyro std X (dbl), fBodyGyro std Y (dbl), fBodyGyro std Z (dbl), fBodyAccMag mean (dbl),
  fBodyAccMag std (dbl), fBodyBodyAccJerkMag mean (dbl), fBodyBodyAccJerkMag std (dbl), fBodyBodyGyroMag mean (dbl), fBodyBodyGyroMag std (dbl),
  fBodyBodyGyroJerkMag mean (dbl), fBodyBodyGyroJerkMag std (dbl)
  
------------------------------------------------------------------------------------------------------------------------
Results.txt: dataframe of output

Source: local data frame [180 x 68]

   subject           activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X tBodyAcc.std...Y tBodyAcc.std...Z tGravityAcc.mean...X
     (int)             (fctr)             (dbl)             (dbl)             (dbl)            (dbl)            (dbl)            (dbl)                (dbl)

       1             LAYING         0.2215982      -0.040513953        -0.1132036      -0.92805647     -0.836827406      -0.82606140           -0.2488818

       1            SITTING         0.2612376      -0.001308288        -0.1045442      -0.97722901     -0.922618642      -0.93958629            0.8315099

       1           STANDING         0.2789176      -0.016137590        -0.1106018      -0.99575990     -0.973190056      -0.97977588            0.9429520

       1            WALKING         0.2773308      -0.017383819        -0.1111481      -0.28374026      0.114461337      -0.26002790            0.9352232

       1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662       0.03003534     -0.031935943      -0.23043421            0.9318744

       1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020      -0.35470803     -0.002320265      -0.01947924            0.8933511

       2             LAYING         0.2813734      -0.018158740        -0.1072456      -0.97405946     -0.980277399      -0.98423330           -0.5097542

       2            SITTING         0.2770874      -0.015687994        -0.1092183      -0.98682228     -0.950704499      -0.95982817            0.9404773

       2           STANDING         0.2779115      -0.018420827        -0.1059085      -0.98727189     -0.957304989      -0.94974185            0.8969286

       2            WALKING         0.2764266      -0.018594920        -0.1055004      -0.42364284     -0.078091253      -0.42525752            0.9130173

     ...                ...               ...               ...               ...              ...              ...              ...                  ...

Variables not shown: tGravityAcc.mean...Y (dbl), tGravityAcc.mean...Z (dbl), tGravityAcc.std...X (dbl), tGravityAcc.std...Y (dbl), tGravityAcc.std...Z
  (dbl), tBodyAccJerk.mean...X (dbl), tBodyAccJerk.mean...Y (dbl), tBodyAccJerk.mean...Z (dbl), tBodyAccJerk.std...X (dbl), tBodyAccJerk.std...Y (dbl),
  tBodyAccJerk.std...Z (dbl), tBodyGyro.mean...X (dbl), tBodyGyro.mean...Y (dbl), tBodyGyro.mean...Z (dbl), tBodyGyro.std...X (dbl), tBodyGyro.std...Y
  (dbl), tBodyGyro.std...Z (dbl), tBodyGyroJerk.mean...X (dbl), tBodyGyroJerk.mean...Y (dbl), tBodyGyroJerk.mean...Z (dbl), tBodyGyroJerk.std...X (dbl),
  tBodyGyroJerk.std...Y (dbl), tBodyGyroJerk.std...Z (dbl), tBodyAccMag.mean.. (dbl), tBodyAccMag.std.. (dbl), tGravityAccMag.mean.. (dbl),
  tGravityAccMag.std.. (dbl), tBodyAccJerkMag.mean.. (dbl), tBodyAccJerkMag.std.. (dbl), tBodyGyroMag.mean.. (dbl), tBodyGyroMag.std.. (dbl),
  tBodyGyroJerkMag.mean.. (dbl), tBodyGyroJerkMag.std.. (dbl), fBodyAcc.mean...X (dbl), fBodyAcc.mean...Y (dbl), fBodyAcc.mean...Z (dbl), fBodyAcc.std...X
  (dbl), fBodyAcc.std...Y (dbl), fBodyAcc.std...Z (dbl), fBodyAccJerk.mean...X (dbl), fBodyAccJerk.mean...Y (dbl), fBodyAccJerk.mean...Z (dbl),
  fBodyAccJerk.std...X (dbl), fBodyAccJerk.std...Y (dbl), fBodyAccJerk.std...Z (dbl), fBodyGyro.mean...X (dbl), fBodyGyro.mean...Y (dbl),
  fBodyGyro.mean...Z (dbl), fBodyGyro.std...X (dbl), fBodyGyro.std...Y (dbl), fBodyGyro.std...Z (dbl), fBodyAccMag.mean.. (dbl), fBodyAccMag.std.. (dbl),
  fBodyBodyAccJerkMag.mean.. (dbl), fBodyBodyAccJerkMag.std.. (dbl), fBodyBodyGyroMag.mean.. (dbl), fBodyBodyGyroMag.std.. (dbl),
  fBodyBodyGyroJerkMag.mean.. (dbl), fBodyBodyGyroJerkMag.std.. (dbl)

------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------------
Hidden transformations were done from together dataframe to final result. Below we show how the data was transformed. Note that in the real code, chain was used to perform the same tast to save memory allocation.
----------------------------------------------------------------------------------------------------------------------------------
>     gathered<-gather(together,variable,observation,-c(subject,activity))
>     grouped<-group_by(gathered,subject,activity,variable) 
>     summarized<-summarize(grouped,variablemeans=mean(observation)) 
>     spreaded<-spread(summarized,variable,variablemeans) 
----------------------------------------------------------------------------------------------------------------------------------
Using "gather function" on together to form a dataframe like below:

gathered

Source: local data frame [679,734 x 4]

   subject activity          variable observation
     (int)   (fctr)            (fctr)       (dbl)

       2 STANDING tBodyAcc mean   X   0.2571778

       2 STANDING tBodyAcc mean   X   0.2860267

       2 STANDING tBodyAcc mean   X   0.2754848

       2 STANDING tBodyAcc mean   X   0.2702982

       2 STANDING tBodyAcc mean   X   0.2748330

       2 STANDING tBodyAcc mean   X   0.2792199

       2 STANDING tBodyAcc mean   X   0.2797459

       2 STANDING tBodyAcc mean   X   0.2746005

       2 STANDING tBodyAcc mean   X   0.2725287

       2 STANDING tBodyAcc mean   X   0.2757457

     ...      ...               ...         ...

--------------------------------------------------------------------------------
Using "group_by function" to group the gathered data on the basis of subject, activity and variable.

groups(grouped)

[[1]]
subject

[[2]]
activity

[[3]]
variable
--------------------------------------------------------------------------------
Using "summarize function" to find mean on the grouped data

summarized

Source: local data frame [11,880 x 4]

Groups: subject, activity [?]

   subject activity             variable variablemeans
     (int)   (fctr)               (fctr)         (dbl)
       1   LAYING    tBodyAcc mean   X    0.22159824

       1   LAYING    tBodyAcc mean   Y   -0.04051395

       1   LAYING    tBodyAcc mean   Z   -0.11320355

       1   LAYING     tBodyAcc std   X   -0.92805647

       1   LAYING     tBodyAcc std   Y   -0.83682741

       1   LAYING     tBodyAcc std   Z   -0.82606140

       1   LAYING tGravityAcc mean   X   -0.24888180

       1   LAYING tGravityAcc mean   Y    0.70554977

       1   LAYING tGravityAcc mean   Z    0.44581772

       1   LAYING  tGravityAcc std   X   -0.89683002

     ...      ...                  ...           ...

--------------------------------------------------------------------------------
Using "spread function" to spread the data back to normal

spreaded

Source: local data frame [180 x 68]

   subject           activity tBodyAcc mean   X tBodyAcc mean   Y tBodyAcc mean   Z tBodyAcc std   X tBodyAcc std   Y tBodyAcc std   Z tGravityAcc mean   X
     (int)             (fctr)             (dbl)             (dbl)             (dbl)            (dbl)            (dbl)            (dbl)                (dbl)

       1             LAYING         0.2215982      -0.040513953        -0.1132036      -0.92805647     -0.836827406      -0.82606140           -0.2488818

       1            SITTING         0.2612376      -0.001308288        -0.1045442      -0.97722901     -0.922618642      -0.93958629            0.8315099

       1           STANDING         0.2789176      -0.016137590        -0.1106018      -0.99575990     -0.973190056      -0.97977588            0.9429520

       1            WALKING         0.2773308      -0.017383819        -0.1111481      -0.28374026      0.114461337      -0.26002790            0.9352232

       1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662       0.03003534     -0.031935943      -0.23043421            0.9318744

       1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020      -0.35470803     -0.002320265      -0.01947924            0.8933511

       2             LAYING         0.2813734      -0.018158740        -0.1072456      -0.97405946     -0.980277399      -0.98423330           -0.5097542

       2            SITTING         0.2770874      -0.015687994        -0.1092183      -0.98682228     -0.950704499      -0.95982817            0.9404773

       2           STANDING         0.2779115      -0.018420827        -0.1059085      -0.98727189     -0.957304989      -0.94974185            0.8969286

       2            WALKING         0.2764266      -0.018594920        -0.1055004      -0.42364284     -0.078091253      -0.42525752            0.9130173

     ...                ...               ...               ...               ...              ...              ...              ...                  ...

Variables not shown: tGravityAcc mean Y (dbl), tGravityAcc mean Z (dbl), tGravityAcc std X (dbl), tGravityAcc std Y (dbl), tGravityAcc std Z (dbl),
  tBodyAccJerk mean X (dbl), tBodyAccJerk mean Y (dbl), tBodyAccJerk mean Z (dbl), tBodyAccJerk std X (dbl), tBodyAccJerk std Y (dbl), tBodyAccJerk std Z
  (dbl), tBodyGyro mean X (dbl), tBodyGyro mean Y (dbl), tBodyGyro mean Z (dbl), tBodyGyro std X (dbl), tBodyGyro std Y (dbl), tBodyGyro std Z (dbl),
  tBodyGyroJerk mean X (dbl), tBodyGyroJerk mean Y (dbl), tBodyGyroJerk mean Z (dbl), tBodyGyroJerk std X (dbl), tBodyGyroJerk std Y (dbl), tBodyGyroJerk
  std Z (dbl), tBodyAccMag mean (dbl), tBodyAccMag std (dbl), tGravityAccMag mean (dbl), tGravityAccMag std (dbl), tBodyAccJerkMag mean (dbl),
  tBodyAccJerkMag std (dbl), tBodyGyroMag mean (dbl), tBodyGyroMag std (dbl), tBodyGyroJerkMag mean (dbl), tBodyGyroJerkMag std (dbl), fBodyAcc mean X
  (dbl), fBodyAcc mean Y (dbl), fBodyAcc mean Z (dbl), fBodyAcc std X (dbl), fBodyAcc std Y (dbl), fBodyAcc std Z (dbl), fBodyAccJerk mean X (dbl),
  fBodyAccJerk mean Y (dbl), fBodyAccJerk mean Z (dbl), fBodyAccJerk std X (dbl), fBodyAccJerk std Y (dbl), fBodyAccJerk std Z (dbl), fBodyGyro mean X
  (dbl), fBodyGyro mean Y (dbl), fBodyGyro mean Z (dbl), fBodyGyro std X (dbl), fBodyGyro std Y (dbl), fBodyGyro std Z (dbl), fBodyAccMag mean (dbl),
  fBodyAccMag std (dbl), fBodyBodyAccJerkMag mean (dbl), fBodyBodyAccJerkMag std (dbl), fBodyBodyGyroMag mean (dbl), fBodyBodyGyroMag std (dbl),
  fBodyBodyGyroJerkMag mean (dbl), fBodyBodyGyroJerkMag std (dbl)

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

******************************** THE END ***************************************************************************************
