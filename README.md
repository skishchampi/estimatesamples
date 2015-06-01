# estimatesamples
A [Shiny app](http://shiny.rstudio.com/) to estimate number of samples in a proportions test derived from [Casagrande, Pike and Smith (1978) *Biometrics* 34: 483-486](http://www.jstor.org/stable/2530613?seq=1#page_scan_tab_contents) and [Fleiss, Tytun and Ury (1980) *Biometrics* 36: 343-346](http://www.jstor.org/stable/2529990?seq=1#page_scan_tab_contents). 

## Inputs

* *Alpha Value* - Probability for Type I (false positive) error
* *Tails* - One-tailed (e.g., greater than or less than) or two-tailed (e.g., equal or not-equal) test
* *Beta Value* - Probability for Type II (false negative) error
* *p1(%)* - Proportion (expressed as a percentage) of positive outcomes in the first group
* *p2(%)* - Proportion (expressed as a percentage) of positive outcomes in the second group
* *ratio* - Ratio of the sample in the second group to the first group
* *Samples per Week* - Depending on the person hours and business context limitations, set the number of samples that would be collected per week during the course of the experiment

## Outputs
* *N* - Total sample size for both groups
* *W* - Weeks to finish the work
* *D* - Days to finish the work
* *M* - Months to finish the work

## Static Demo
![alt tag](https://cloud.githubusercontent.com/assets/996985/7919346/412c0f78-085d-11e5-96d1-d948d7c99d70.PNG)
