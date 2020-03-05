# BaboonRepro_TeachingModule

This teaching module was developed as a [Data Expedition](https://bigdata.duke.edu/data-expeditions) for Duke University.

This teaching module focuses on teaching undergraduate-level biologists 1) the basics of baboon reproduction and 2) the basics of using R programming for exploratory data analysis. Specifically, the module aims to reproduce Figure 1 from [Gesquire et al. 2007](https://doi.org/10.1016/j.yhbeh.2006.08.010). 

#### Learning objectives
- Learn basics of exploratory data analysis (descriptive statistics, generating plots) in R
- Learn basics of popular R packages `dplyr` and `ggplot2`
- Increase understanding of association between hormones and mating behavior
- Increase science literary skills (e.g. generating predictions, interpreting results)

#### Materials
- [BaboonReproduction_Presentation.pptx](BaboonReproduction_Presentation.pptx) - presentation for instructor to introduce key hypotheses
- [BaboonReproduction_Worksheet.docs](BaboonReproduction_Worksheet.docs) - worksheet for students to fill out throughout teaching module
- [BaboonReproduction.R](BaboonReproduction.R) - R script that reproduces results from [Gesquire et al. 2007](https://doi.org/10.1016/j.yhbeh.2006.08.010)
- [baboon_data.csv](baboon_data.csv) - dataset (see [*the dataset*](#the_dataset) section below)

#### Workflow
The instructor is provided with a brief Powerpoint presentation (BaboonReproduction_Presentation.pptx) that provides basic information on baboon sociality and reproduction. At the end of the Powerpoint, students are introduced to 2 key hypotheses about baboon reproduction that they will explore using R. Students should work together to propose possible predictions to test these hypotheses (and fill out the first section of the provided worksheet, BaboonReproduction_Worksheet.docs) before seeing the provided predictions.

Students can then work through the provided R script (BaboonReproduction.R) and accompanying dataset (baboon_data.csv) to test these predictions. The R script has instructions throughout for more advanced students to skip ahead. The instructor should walk students through most of the script, then let students work independently to complete *Data Visualization Part 2*. Students should fill out the worksheet (BaboonReproduction_Worksheet.docs) as they go along.

At the end of the R script, students will ultimately produce a replica of Figure 1 from [Gesquire et al. 2007](https://doi.org/10.1016/j.yhbeh.2006.08.010). This figure is included as the final slide of BaboonReproduction_Presentation.pptx. The end of the class session should be used to interpret the figure and discuss how it relates to the 2 project hypotheses.

#### Student level
This lesson is designed for undergraduate students who have little to no exposure to R or other programming software. It could be easily adjusted for students who are familiar with R or other programming software. This lesson takes about 75 minutes to complete.

#### Amboseli Baboon Research Project
The dataset for this expedition is a subset of the long-term database of the [Amboseli Baboon Research Project](https://amboselibaboons.nd.edu/), a project co-directed by Drs. Jeanne Altmann, Susan Alberts, Beth Archie, and Jenny Tung. The Amboseli Baboon Research Project has collected demographic, behavioral, genetic, and endocrinological data on a population of wild baboons since 1971 in order to study questions related to animal behavior, life history, behavioral ecology, genetics, and physiology. The project’s database is managed by Jake Gordon at Duke University and Nicki Learn at Princeton University.

#### <a name="the_dataset">The dataset</a>
The unit of analysis for this dataset is a fecal estrogen sample for a cycling<sup>[1](#footnote1)</sup> female. For each fecal sample (n = 843), 6 variables are recorded:
1. *female* - identity of the female baboon
2. *cyle_day* - day of her reproductive cycle
3. *estrogen* - fecal estrogen concentration
4. *swelling_size* - sexual swelling size<sup>[2](#footnote2)</sup>
5. *alpha_consort* - whether or not the female consorted<sup>[3](#footnote3)</sup> with an alpha male<sup>[4](#footnote4)</sup> on that day
6. *nonalpha_consort* - whether or not the female consorted with a non-alpha male on that day

This dataset includes data from 93 female baboons, with approximately 10 fecal estrogen samples per female. Minor differences between this dataset and the the dataset used in [Gesquire et al. 2007](https://doi.org/10.1016/j.yhbeh.2006.08.010) are due to small, incremental changes in the database over time. 

#### Footnotes
<a name="footnote1"><sup>1</sup></a> *cycling*: sexually mature but not pregnant or lactating  
<a name="footnote2"><sup>2</sup></a> female yellow baboons exhibit exaggerated sexual swellings (an enlargement/engorgement of the genital and perineal skin) around ovulation  
<a name="footnote3"><sup>3</sup></a> *consortship*: a period in which a male mate-guards a female. Virtually all matings and conceptions occur during consortships  
<a name="footnote4"><sup>4</sup></a> male yellow baboons have a dominance hierarchy, in which the highest-ranking male (the “alpha”) has the greatest access to females  
