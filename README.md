# Lyman-break galaxy data analysis
---

output: html_document
---


In this data analysis, I adopted the "Eclidean method" to compare difference, the flux of galaxies, between 100 object galaxies and targeted lyman galaxy.

**The Euclidean method**
I'm using the Euclidean method to complete this study. Briefly, the x-coordinates of wavelenth is thought to be irrelevant because of redshift, and we will compare the similiarity of cB_58 and each spectrum based on the Euclidean distances of y-coordinates of flux. The spectrum with smallest Euclidean distance will the ones we are looking for.

To be noticed, y-coordinates will be substracted the mean value of elements in each vector and divided by the standard deviation of elements in each vector. This is to align specta of different brightness and distances.



