/*KENYATTA UNIVERSITY
  SCHOOL OF ECONOMICS
  DEPARTMENT OF ECONOMETRICS AND STATISTICS
  ECONOMIC MODELLING AND COMPUTER SIMULATION

  AUTHORS: ANNIE MUKUHI MAINA         K24/3294/2017
           ANN ATIENO OKOTH           K24/3292/2017
		   WARIO .T. TUME             K24/3042/2014

************************************************

*ASSIGNMENT FOR EES 404.
/* some of the commands for this assignment are as follows*/
*/
. rename A wage

. label variable wage "wage"

. rename B age

. label variable age "age"

. rename C experience

. label variable experience "experience"

. rename D gender

. label variable gender "gender"

. rename E rating

. label variable rating "rating"

. rename F degrees

. label variable degrees "degrees"

. rename G units

. label variable units "units"

. save "C:\Users\user\Desktop\DATA FILES\ees data.dta", replace
file C:\Users\user\Desktop\DATA FILES\ees data.dta saved

. histogram wage
string variables not allowed in varlist;
wage is a string variable
r(109);

. recast int units

. destring wage, generate(wage_n)
wage contains nonnumeric characters; no generate

. destring age, generate(age_n)
age contains nonnumeric characters; no generate

. destring experience, generate(experience_n)
experience contains nonnumeric characters; no generate

. destring gender, generate(gender_n)
gender contains nonnumeric characters; no generate

. destring rating, generate(rating_n)
rating contains nonnumeric characters; no generate

. summarize wage_n
variable wage_n not found
r(111);

. describe wage_n
variable wage_n not found
r(111);

. gen wage_n
=exp required
r(100);

. destring wage, generate(wage_n)
wage contains nonnumeric characters; no generate

. replace wage = "" in 1
(1 real change made)

. drop in 1
(1 observation deleted)

. destring wage, generate(wage_n)
wage has all characters numeric; wage_n generated as byte

. histogram wage_n
(bin=9, start=33, width=7.3333333)

. destring experience, generate(YearsofExperience)
experience has all characters numeric; YearsofExperience generated as byte

. histogram YearsofExperience
(bin=9, start=3, width=2.2222222)

. destring degrees, generate(NumberOfDegrees)
degrees has all characters numeric; NumberOfDegrees generated as byte

. histogram NumberOfDegrees
(bin=9, start=1, width=.44444444)


/*a)	Prepare a brief but concise introduction that explains: The background, problem context/subject of inquiry, key research questions that prompted statistical enquiry, methodology and description and measurement of variables (Maximum word 1000 words)

/*What lectures earn in Kenya is a key discussion especially in the labour market. How much lectures should earn has caused a lot of discussion and is an important point to talk about especially with the numerous lectures strikes and the fact that they hold a key role in society as they are in charge of the minds of the future of the country. Its important to examine the criteria in which a lectures pay depends on. 
The subject of inquiry is on salaries earned by lectures. The research wants to establish what factors determine the salary of a lecture. Some of the research questions are:
How much do lectures earned.
What factors affect lecture’s salaries.
How are the factors related to one another. 
What factors negatively affect a teachers salary.
What factors positively affect a lectures salary.
The research randomly selected lectures from different universities in Kenya.Data pertaining theiries were collected. 
Other variables that might have a relationship with salaries were collected
This was the lectures age, their gender, years of experience, ratings by the students, number of degrees they have and the number of units they teach.
All these were collected using Simple Random Sampling. Data on lectures salaries was obtained from their institutions of work and so were their gender’s, their years of experience and the number of units they teach. 
The lectures were also interviewed to get information on various details like the number of years in the instsitution and their various qualifications.
Lastly, data was collected from students through questionnaires passed to the various students who were taught by the lectures.
The questionnaire was mainly intended to rate the lectures from the students point of view. The rank ranged from 1-5, 1 being excellent, 2 very good, 3 good, 4 fair, 5 poor
Data from both the interview and questionnaire was collected and put up for analysis. The statistical variable STATA was used to do this with various tests being conducted on the data.

b.Prepare a descriptive analysis of the data using charts, graphs, and tables and explain any discernible features relevant to your subject inquiry.*/

*/sum


    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
          ID |          0
      salary |          0
         age |        101    51.27723    7.467421         34         63
YearsOfExp~e |        101    13.42574    4.958521          2         23
      gender |          0
-------------+---------------------------------------------------------
StudentRat~g |        101     2.60396     .917379          1          5
NumberOfDe~s |        101     2.49505    .8200459          1          5
NumberOfun~t |        101    2.435644    .7268541          1          4
       gen_m |        101    .5544554    .4995047          0          1
        wage |        101    60.57426    15.84067         33         99
		
																																																																																																																																															
//the above table is a summary of the data collected, showing the mean, standard deviation,minimum and maximum values of data.
//Also a pie chart showing the relationship between males and females was taken, showing that the data had more females than males */

*/ graph pie, over gen_m
graph pie, over YearOfExperience
//A barchart showing the relationship between wage and age was also analysed */

*/ graph bar, over wage age
twoway (bar wage age), ytitle(Wage) xtitle(Age)

//Avplots were also used to on the data which provides us with the marginal importance of the predictor variable.Also box plots were used.

*/ graph box, wage

/*c)Explain the importance of probability distribution theory in statistical analysis in one short paragraph.
																												
Probability distributions are statistical functions that enable to obtain the possible values of given variable. There are two types of probabbility distributions, discrete and continuous.
Probability distribution are important in numerous ways. One such way is that they enable us to model our world, that is make understanding the world easier especially with regards to how they occur. For example, an occurence with a normal distibution tends to linger around a certain values or one that has a bernoulli disrtibution is one that will either happen or will not happen.
Probability distribution are also helpful in obtaining the possibility/probability of an event occuring.
Probability distibution also enable to estimate the variability of an occurence.

d)	 Consider key variables – based on your questions and research inquiry – use relevant graphs to explore the nature of their distribution(s).
 
 A key method of looking at the distribution of a data set is using the histogram.*/
 
 */  histogram wage
(bin=10, start=33, width=6.6)

histogram age
(bin=10, start=34, width=2.9)

histogram YearsofExperience
(bin=9, start=3, width=2.2222222)

histogram NumberOfDegrees
(bin=9, start=1, width=.44444444)

/* Another key measure of distribution is the Kernel Density Plot.*/

*/ kdensity age

kdensity wage

kdensity YearsOfExperience

kdensity NumberOfDegrees

/*e)	Using the key variables, (chosen in c above) conduct hypotheses tests that encompass one sample test, two sample test, more than two sample test, one tailed test and two-tailed tests. */


ttest wage == 60

One-sample t test
------------------------------------------------------------------------------
Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
---------+--------------------------------------------------------------------
    wage |     101    60.57426    1.576206    15.84067    57.44711    63.70141
------------------------------------------------------------------------------
    mean = mean(wage)                                             t =   0.3643
Ho: mean = 60                                    degrees of freedom =      100

    Ha: mean < 60               Ha: mean != 60                 Ha: mean > 60
 Pr(T < t) = 0.6418         Pr(|T| > |t|) = 0.7164          Pr(T > t) = 0.3582
 
 . ttest YearsofExperience == 13

One-sample t test
------------------------------------------------------------------------------
Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
---------+--------------------------------------------------------------------
Yearso~e |      99    13.55556    .4894732    4.870197    12.58421     14.5269
------------------------------------------------------------------------------
    mean = mean(YearsofExperience)                                t =   1.1350
Ho: mean = 13                                    degrees of freedom =       98

    Ha: mean < 13               Ha: mean != 13                 Ha: mean > 13
 Pr(T < t) = 0.8704         Pr(|T| > |t|) = 0.2591          Pr(T > t) = 0.1296


. ttest NumberOfDegrees == 2

One-sample t test
------------------------------------------------------------------------------
Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
---------+--------------------------------------------------------------------
Number~s |      99    2.484848    .0829318    .8251609    2.320273    2.649424
------------------------------------------------------------------------------
    mean = mean(NumberOfDegrees)                                  t =   5.8464
Ho: mean = 2                                     degrees of freedom =       98

    Ha: mean < 2                 Ha: mean != 2                 Ha: mean > 2
 Pr(T < t) = 1.0000         Pr(|T| > |t|) = 0.0000          Pr(T > t) = 0.0000

 
. ttest units == 2

One-sample t test
------------------------------------------------------------------------------
Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
---------+--------------------------------------------------------------------
   units |      99    2.444444    .0735223    .7315377    2.298542    2.590347
------------------------------------------------------------------------------
    mean = mean(units)                                            t =   6.0450
Ho: mean = 2                                     degrees of freedom =       98

    Ha: mean < 2                 Ha: mean != 2                 Ha: mean > 2
 Pr(T < t) = 1.0000         Pr(|T| > |t|) = 0.0000          Pr(T > t) = 0.0000

 

. ttest wage, by(gender)

Two-sample t test with equal variances
------------------------------------------------------------------------------
   Group |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
---------+--------------------------------------------------------------------
       f |      45    55.46667    2.052739    13.77019    51.32964    59.60369
       m |      56    64.67857    2.179614    16.31074    60.31053    69.04662
---------+--------------------------------------------------------------------
combined |     101    60.57426    1.576206    15.84067    57.44711    63.70141
---------+--------------------------------------------------------------------
    diff |           -9.211905    3.049822               -15.26341   -3.160396
------------------------------------------------------------------------------
    diff = mean(f) - mean(m)                                      t =  -3.0205
Ho: diff = 0                                     degrees of freedom =       99

    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
 Pr(T < t) = 0.0016         Pr(|T| > |t|) = 0.0032          Pr(T > t) = 0.9984



. tabulate gender StudentRating, cchi2 cell chi2 column exact expected lrchi2 row V

+--------------------+
| Key                |
|--------------------|
|     frequency      |
| expected frequency |
| chi2 contribution  |
|   row percentage   |
| column percentage  |
|  cell percentage   |
+--------------------+

Enumerating sample-space combinations:
stage 5:  enumerations = 1
stage 4:  enumerations = 2
stage 3:  enumerations = 13
stage 2:  enumerations = 86
stage 1:  enumerations = 0

           |                     Student Rating
    Gender |         1          2          3          4          5 |     Total
-----------+-------------------------------------------------------+----------
         f |         2         14         19         10          0 |        45 
           |       4.9       16.0       16.5        7.1        0.4 |      45.0 
           |       1.7        0.3        0.4        1.2        0.4 |       4.0 
           |      4.44      31.11      42.22      22.22       0.00 |    100.00 
           |     18.18      38.89      51.35      62.50       0.00 |     44.55 
           |      1.98      13.86      18.81       9.90       0.00 |     44.55 
-----------+-------------------------------------------------------+----------
         m |         9         22         18          6          1 |        56 
           |       6.1       20.0       20.5        8.9        0.6 |      56.0 
           |       1.4        0.2        0.3        0.9        0.4 |       3.2 
           |     16.07      39.29      32.14      10.71       1.79 |    100.00 
           |     81.82      61.11      48.65      37.50     100.00 |     55.45 
           |      8.91      21.78      17.82       5.94       0.99 |     55.45 
-----------+-------------------------------------------------------+----------
     Total |        11         36         37         16          1 |       101 
           |      11.0       36.0       37.0       16.0        1.0 |     101.0 
           |       3.1        0.5        0.7        2.1        0.8 |       7.1 
           |     10.89      35.64      36.63      15.84       0.99 |    100.00 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 
           |     10.89      35.64      36.63      15.84       0.99 |    100.00 

          Pearson chi2(4) =   7.1461   Pr = 0.128
 likelihood-ratio chi2(4) =   7.8345   Pr = 0.098
               Cramér's V =   0.2660
           Fisher's exact =                 0.110

. 


/* f)	Write a short report that summarizes the hypothesis test and indicate what conclusion you have arrived at from your data set.

ONE TAILED TEST 
For the first one sample test for wage, with regards to mean comparision, it is shown that the critical value (0.7164) is greater than the p value 0.05, meaning that there is no statistical significance, and fail to  reject the null hypothesis that H0=60.
For the 2nd one, with regards to years of experience, the critical value, 0.2591, is greater than our p value, 0.05, hence fail to reject the null hypothesis indicating no statistical significance in the model. 
For the 3rd one, with regards to number of degrees, the critical value is 0.0000 which is less the p value 0.05, meaning reject the null hypothesis, indicating statistical significance in the model.
For the 4th one, the units taught, the critical value, 0.0000, is less than the p value 0.05, meaning rejecting the null hypothesis, indicating that it is statistically signiificant.
For gender,which is a two sample test, the critical value, 0.0032, is less than the p value 0.05, meaning rejecting the null hypothesis, indicating that it is statistically significant in the model.
The last one, which is a more than two sample test, the chisquare is 0.128, which is greater than the 0.05, meaning that fail to reject the null hypothesis, hence no statistical signficance.

TWO TAILED TEST
For the first one with regard sto wage, the critical values are both greater than the p value, 0.05, hence fail to reject th null hypothesis.
Simillarly for the years of experience, the critical values, greater amd less than are greater than the p value 0.05, hence fail to reject the null hypothesis.
However, for number of degrees, the critical value for less than the emean 2, is less than p value hence failing to reject the null hypothesis, but the less than mean 2 is less than the p value hence rejecting the null hypothesis.
This is similar to the number of units, where the less than critical value is greater than the pvalue hence failing to reject the null hypothesis but rejecting the null hypothesis with regards to greater than meaning that the mean is not greater than two.
For the two sampled test, the critical value for gender is less than the pvalue, hence we reject the null hypothesis, but also the for greater than the mean, the critical value is less than the pvalue so we fail to reject null hypothesis.

//g) g)	Choose two variables of interest to you from the data set and plot a scatter plot. Comment on the nature of the relationship 																												

//Scatter plot of Wage against Years of Experience
*/ twoway(scatter wage age YearsOfExperience NumberOfDegrees)

/*The following is a scatter plot of Wage against Years of Experience of the teachers.
As seen from the graph, there is a positive linear relationship between Wage and Years of Experience. 
An increase in the years of experience leads to an increase in the Wage. Though there are a few outliers, 
the concentration of the data concludes the relationship between the independent and dependent variable.

h)Select a dependent and more than three independent variables and fit a linear regression equation to the data.																												
We regressed Wage (Dependent Variable) on Age, Years of Experience and Number of degrees (Independent Variables).
We used the following code and obtained the adjacent results.
Formulate a linear regression between Wage as the dependent variable and
age,years of experience and number of degrees as the independent variables.
*/ regress wage age YearsOfExperience NumberOfDegrees
										

      Source |       SS           df       MS      Number of obs   =       101
-------------+----------------------------------   F(3, 97)        =    193.12
       Model |  21494.0345         3  7164.67817   Prob > F        =    0.0000
    Residual |  3598.65857        97  37.0995729   R-squared       =    0.8566
-------------+----------------------------------   Adj R-squared   =    0.8521
       Total |  25092.6931       100  250.926931   Root MSE        =    6.0909

-----------------------------------------------------------------------------------
             wage |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
------------------+----------------------------------------------------------------
              age |   .9213489   .1581772     5.82   0.000     .6074111    1.235287
YearsOfExperience |   1.129645   .2424793     4.66   0.000     .6483907    1.610899
  NumberOfDegrees |   5.023401   .8841885     5.68   0.000     3.268532    6.778271
            _cons |  -14.36992   5.644462    -2.55   0.012    -25.57261   -3.167223
			
/* i)	Conduct the following regression diagnostics: linearity, normality, heteroskedasticity, multicollinearity, 
endogeneity and specification tests and comment on the results

The following regression diagnostics were conducted
        LINEARITY
We conduct this test to check for outliers.
We also check for the spread and concentration of data
 */ avplots
 
/*In the graph wage against age, there is concentration of data between -10 and 10 and this clearly shows that the data is normally distributed. Though there are a few outliers.
In the graph wage against years of experience, the data is concentrated between =5 and 5 and hence the data is normally distributed. Though there are a few outliers.
In the graph wage against number of degrees, the data is vastly spread and the distribution can be hardly identified.

        NORMALITY
We obtained the residuals of the data using the following code (predict r), and generate the residuals on the data editor and therefore proceed do the Shapiro Wilk test to test for normality of the data. 
Before doing the test, we standardized the residuals using the pnorm function and standardized the tails using the qnorm function.
The following graphs will be obtained as a result of the codes.

*/predict r// Obtain results
pnorm r// Standardize residuals
qnorm r// Standardize tails
swilk r// Test hypothesis for normality in distribution

//The Shapiro wilk test was done to obtain the following results.
                   Shapiro-Wilk W test for normal data

    Variable |        Obs       W           V         z       Prob>z
-------------+------------------------------------------------------
           r |        101    0.98152      1.538     0.956    0.16956
		   
/*The null hypothesis is that the distribution is normal. P>0.05 hence we fail to reject the null hypothesis and conclude that the distribution is normal.

        HETEROSKEDASTICITY
This test is carried out to test whether the variance is homoscedastic (has a constant variance) and also check its pictorial presentation.
*/ rvfplot/* Find out if there is constant variance in the data

After calculating for homoscedasticity, the P<0.05 hence we reject the null hypothesis and conclude that there is no constant variance (variance is heteroskedastic). 
Even the pictorial presentation displays that the variance is heteroskedastic.

*/imtest// Focus on the spread of the data

Cameron & Trivedi's decomposition of IM-test

---------------------------------------------------
              Source |       chi2     df      p
---------------------+-----------------------------
  Heteroskedasticity |      31.52      9    0.0002
            Skewness |       3.13      3    0.3717
            Kurtosis |       0.35      1    0.5548
---------------------+-----------------------------
               Total |      35.00     13    0.0008
---------------------------------------------------

        /*MULTICOLLINEARITY
We test to see the presence of multicollinearity (which is if predictor variable in a multiple regression model can be linearly predicted from the others with a substantial degree of accuracy).
*/vif// Confirm the prescence of multicollinearity in the data

    Variable |       VIF       1/VIF  
-------------+----------------------
YearsOfExp~e |      3.90    0.256635
         age |      3.76    0.265913
NumberOfDe~s |      1.42    0.705672
-------------+----------------------
    Mean VIF |      3.02 
	
/*VIF<10 therefore presence of multicollinearity is not established in the data.

          SPECIFICATION
We test whether the model is specified in that there is no omitted variables.
We will carry out the Ramsey test to find out the same and the null hypothesis being that the model is well specified.

*/ovtest //This test is used to find out if there are omitted variables in the data.

Ramsey RESET test using powers of the fitted values of wage
       Ho:  model has no omitted variables
                  F(3, 94) =      4.75
                  Prob > F =      0.0039 

/*The P<0.05 hence we reject the null hypothesis and conclude that the model is not specified since there are omitted variables.

j) Explain how the results of the linear regression equation could be used to predict the values of the variables.

*/ regress wage age YearsOfExperience NumberOfDegrees
										

      Source |       SS           df       MS      Number of obs   =       101
-------------+----------------------------------   F(3, 97)        =    193.12
       Model |  21494.0345         3  7164.67817   Prob > F        =    0.0000
    Residual |  3598.65857        97  37.0995729   R-squared       =    0.8566
-------------+----------------------------------   Adj R-squared   =    0.8521
       Total |  25092.6931       100  250.926931   Root MSE        =    6.0909

-----------------------------------------------------------------------------------
             wage |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
------------------+----------------------------------------------------------------
              age |   .9213489   .1581772     5.82   0.000     .6074111    1.235287
YearsOfExperience |   1.129645   .2424793     4.66   0.000     .6483907    1.610899
  NumberOfDegrees |   5.023401   .8841885     5.68   0.000     3.268532    6.778271
            _cons |  -14.36992   5.644462    -2.55   0.012    -25.57261   -3.167223
			
/*Holding all factors constant, wage of the teachers is -14.36992.
An increase in one unit of age leads to an increase in 0.9213489 units of Wage holding all other factors constant.
An increase in one unit of Years of experience leads to an increase in 1.129645 units of wage holding all other factors constant.
An increase in one unit of Number of degrees leads to an increase in 5.023401 units of Wage holding all other factors constant.
R-squared = 0.8566 therefore age, years of experience and number of degrees account for 85.66% of the total variations in wage leaving 14.34% to be explained by other factors.
The F statistic is less than 0.05 therefore we reject the null hypothesis and conclude that the model is significant.

***************************************************************************************************************************************************************************************************************************************


 
        

          
        
		   




									
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
		