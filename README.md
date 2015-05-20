# estimatesamples
A [Shiny app](http://shiny.rstudio.com/) to estimate number of samples in a proportions test derived from Casagrande, Pike and Smith (1978) *Biometrics* 34: 483-486 and Fleiss, Tytun and Ury (1980) *Biometrics* 36: 343-346. 

## Inputs

* *Alpha Value* - Probability for Type I (false positive) error
* *Tails* - One-tailed (e.g., greater than or less than) or two-tailed (e.g., equal or not-equal) test
* *Beta Value* - Probability for Type II (false negative) error
* *p1(%)* - Proportion (expressed as a percentage) of positive outcomes in the first group
* *p2(%)* - Proportion (expressed as a percentage) of positive outcomes in the second group
* *ratio* - Ratio of the sample in the second group to the first group

## Outputs
* *N* - Total sample size for both groups
* *V1*
* *V3*
