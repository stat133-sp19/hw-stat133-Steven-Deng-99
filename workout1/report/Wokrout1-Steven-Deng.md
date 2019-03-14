Wokrout1
================
Steven Deng
3/10/2019

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

Two Point Effectiveness
-----------------------

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134      63.8
    ## 2 Kevin Durant     643   390      60.7
    ## 3 Stephen Curry    563   304      54.0
    ## 4 Klay Thompson    640   329      51.4
    ## 5 Draymond Green   346   171      49.4

Three Point Effectiveness
-------------------------

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246      42.4
    ## 2 Stephen Curry    687   280      40.8
    ## 3 Kevin Durant     272   105      38.6
    ## 4 Andre Iguodala   161    58      36.0
    ## 5 Draymond Green   232    74      31.9

Point Effectiveness
-------------------

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495      54.1
    ## 2 Andre Iguodala   371   192      51.8
    ## 3 Klay Thompson   1220   575      47.1
    ## 4 Stephen Curry   1250   584      46.7
    ## 5 Draymond Green   578   245      42.4

Introduction
------------

As everyone like NBA, this workout is going to explore the performance of five players from GSW. The purpose is to visualize their shot performance by analyzing 2 point, 3 point and overall point shooting.

Motivation
----------

Curious about how players' scores distribute on the court

Data
----

Five raw data sets of each player were provided through github.

Analysis
--------

By comparing the table of 2 point shot and the table of 3 point shot, one should observe that for each player, the perc\_made is higher in 2 point shot than in 3 point shot. This fact aligns with our common sense as it is more difficult to make a successful shot from a longer distance. Additionally, by either comparing the three tables or the facet plot graph, one can observe that five players excercise different strategies in the game. For example, Stephen Curry tendS to have more 3 point shot than 2 point shot even though the perc\_made of 3 point shot is significantly lower than 2 point shot. Players like Kevin Durant is less aggresive in the game and chooses to make more 2 point shot over 3 point shot. From the data avaible, it seems that making more 2 point shots is more beneficial in overall perc\_made but further more detailed analysis would be required to draw a concrete conclusion.

By comparing the 2 point shot table and 3 point shot table, one should also notice that there is no obvious connection between 2 point perc\_made and 3 point perc\_made. For example, Andre Iguodala ranks the highest in 2 point perc\_made yet ranks second to last in 3 point perc\_made. Also note that Klay ranks the highest in 3 point perc\_made while ranks second to last in 2 point perc\_made. One may wonder what causes a player to be particularly good at shooting at a specific distance while not as good at another. One probable explantion is that shooting from various distance engages different muscle groups and players may have unbalanced development in muscle groups which results in being advantageous in shooting at a particular distance but not at other distances.

From the facet graph, we can also observe that most successful 3 point shots are made along the upper peripheral of the circle while most unsuccesful 3 points are made along the lower peripheral. This is most obvious in the plots of Draymond Green and Stephen Curry and least obvious in plots of Andre Iguodala.
