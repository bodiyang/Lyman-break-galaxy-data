# Lyman-break galaxy data analysis

In this data analysis, I adopted the "Eclidean method" to compare difference, the flux of galaxies, between object galaxies and targeted lyman galaxy.

summary:

• Given a target spectrum cB58, used R to do data cleaning and compare the least square error and correlation of distance between the target spectrum and a new spectrum

• Wrote Shell script to run 2500 parallel jobs with High Throughput Computing to do data cleaning and to find 100 most similar spectra to cB58 from 2.5 million spectra

• Visualized 100 patterns of spectra using R




**The Euclidean method**
I'm using the Euclidean method to complete this study. Briefly, the x-coordinates of wavelenth is thought to be irrelevant because of redshift, and we will compare the similiarity of cB_58 and each spectrum based on the Euclidean distances of y-coordinates of flux. The spectrum with smallest Euclidean distance will the ones we are looking for.

To be noticed, y-coordinates will be substracted the mean value of elements in each vector and divided by the standard deviation of elements in each vector. This is to align specta of different brightness and distances.



Please refer to hw2.R for code; hw2.html for a detailed analysis report


