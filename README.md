# estimatesamples
A [Shiny app](http://shiny.rstudio.com/) to estimate number of samples in a proportions test derived from [Casagrande, Pike and Smith (1978) *Biometrics* 34: 483-486](http://www.jstor.org/stable/2530613?seq=1#page_scan_tab_contents) and [Fleiss, Tytun and Ury (1980) *Biometrics* 36: 343-346](http://www.jstor.org/stable/2529990?seq=1#page_scan_tab_contents). 

## Inputs

* *Alpha Value* - Probability for Type I (false positive) error
* *Tails* - One-tailed (e.g., greater than or less than) or two-tailed (e.g., equal or not-equal) test
* *Beta Value* - Probability for Type II (false negative) error
* *p1(%)* - Proportion (expressed as a percentage) of positive outcomes in the first group
* *p2(%)* - Proportion (expressed as a percentage) of positive outcomes in the second group
* *ratio* - Ratio of the sample in the second group to the first group

## Outputs
* *N* - Total sample size for both groups
* *W* - Weeks to finish the work
* *D* - Days to finish the work
