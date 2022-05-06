1 # will return [1] 1 where [1] keeps track of dimensions
x# will give an error since there is no variable defined as x
x&lt;-1# will create a variable x (a numeric vector), R calls it object and stores a value of 1 in it.
&lt;- is assignment operator, similar to =
x# now will return variable x and it’s value
y&lt;-1:10# will store 1 to 10 in y
z&lt;-1,3,6# will give an error, the right way is to use c(), concatenate function
z&lt;-c(1,3,6)
# both x and y are also numeric vectors
v&lt;-c (&#39;a&#39;, &#39;b&#39;, &#39;c&#39;) # will treat a as a character
dir()# will tell what files and directories/folders you have in your current folder
library() # will tell you what libraries you have already installed

ls() # will tell what variables you have so far, variable is anything that can store value/s, type
of a variable will be specified by the value it stores.
#### Check the current working directory, which is where R reads from and writes to unless
full path names are given. Change the working directory to the one where the data is.
getwd() ### will tell you where exactly you are right now
setwd(&quot;path_to_folder&quot;) # will change to where we want
# Need help? want to know about what any command does, just type
help() # will open help server for you, you can specify your question also as help(anything)
e.g
help(&quot;ls&quot;)
help(&quot;objects&quot;)
help(&quot;class&quot;) # or
?class# will help if it’s parent package is already loaded
??class# will search for wherever packages it exists
class(v)
rm() # you can remove any variable
rm(list=ls()) # you can remove all variables
length(v) # will return you how many items are there in a vector
unique(v) # will return a non redundant list
w&lt;-matrix(1:10, nrow=2, ncol=5, byrow=T)# will create a matrix type object &amp; fill it row-
wise try byrow=F also. Matrix stores numeric vectors
dim(w) # will tell how many rows and columns we have in w
data.frame(1,10,c(&#39;a&#39;, &#39;b&#39;)) # will create a dataframe that can have different types of vectors
like integer, character etc
factor() # will create a factor class object that have different levels
z&lt;-c(1,2,2,3,3,5)
factor(z)
as.factor()
as.numeric() # will change the data type to as what specified
is.factor(), is.numeric# will check whether the data type
apply() # will apply any function on any data
ls()#### Show the objects in workspace; if there are any, remove them.
rm(list=ls())
###################### Data Analysis in Jamovi/R ###########################
#Jamovi stores data file as object name as “data”.
ls()
class(data) # Tells us that it&#39;s a data frame object
dim(data) # how many rows and columns we have
head(data) # Look at the first few (6) rows of the data
data[1:5,] # Look at the first 5 rows of the data
data[1:5,2:7] # Look at the first 5 rows and 2nd to 7th columns of the data
tail(data) # Look at the last few lines of the data
data$newColumn # will print this column or create a new one if it doesn’t exist
##########################Data Exploration############################
#### It&#39;s a good idea to do some basic exploration of the data. Let&#39;s start by looking summary
statistics per column:
table(data$Gender) # gives a frequency table for that column
table(data$Age)
plot(data$Age) # will plot all data points in given order
plot(table(data$Age)) # will plot the frequency table

barplot(table(data$Age)) # better one
barplot(table(data$Age), col=&#39;pink&#39;) # much better one
breaks = seq(15.5, 75.5, by=10) # We can make our own bins
age.cut = cut(data$Age, breaks)
table(age.cut)
barplot(table(age.cut), col=&#39;pink&#39;) # much much better one
barplot(table(age.cut), col=&#39;pink&#39;, ylim = c(0, 50)) # awesome
pie(table(data$Age)) # can make a pie chart
pie(sort(table(data$Age))) # a better way
summary(data) # function from affy package, summary for all
summary(data, maxsum = 10) # will print more classes (upto 10)
summary(data, maxsum = 20) # will print all classes in this data
boxplot(data$Height) # from graphics package, boxplots here are dry
boxplot(data$Height, col=”green&quot;, xlab= &quot;Heights&quot;, ylab=&quot;Height in CMs&quot;)
## Boxplot does not show means in R. We might ask R to show the means
points(mean(data$Height, na.rm = TRUE), col=&quot;blue&quot;, pch=18)
intersect(search(), objects())
##All graphics can be saved using the menu File -&gt; Save as
plot(density(data$Height))# density plot
# We can add a legend as;
#legend(12,0.1, legend=colnames(data[,3:5]), lty=1:6,col=1:6)
###################### Data Analysis in R###########################
R accepts data in different formats like, text (.txt), Comma Separated Value (.CSV) and
Excel (.xlx) etc. CSV is R’s and My favorite.
Let’s input the file “ClassData” as csv using the function read.csv
data&lt;- read.csv (&quot;ClassData.csv&quot;, stringsAsFactors = T)
# will read a .csv file
# We can read also a text file (.txt) as under
#data &lt;- read.delim (&quot;ClassData.txt&quot;, stringsAsFactors=F)
# default T, takes numeric values as factors. Once the prompt returns, verify that you have
created a new object in the workspace, and see it’s kind.
attach(data)
tapply(Weight, Gender, mean)
tapply(Weight, Gender, sd)
means&lt;-tapply(Weight, Gender, mean)
stdevs&lt;-tapply(Weight, Gender, sd)
cbind(means, stdevs)
table(Gender)
table(Gender,Smoke)
Gender
Gender&lt;-factor(Gender, levels=c(&#39;FEMALE&#39;, &#39;MALE&#39;))
Gender
Weight[Gender==&quot;MALE&quot;] # will extract MALE&#39;s weights
MaleWeights&lt;-Weight[Gender==&quot;MALE&quot;]
Weight[Gender==&quot;FEMALE&quot;] # will extract FEMALE&#39;s weights
FemaleWeights&lt;-Weight[Gender==&quot;FEMALE&quot;]
summary(MaleWeights)
hist(MaleWeights)

breaks = seq(0, 120, by=10)
boys.cut = cut(MaleWeights, breaks)
plot(boys.cut)
girls.cut = cut(FemaleWeights, breaks)
plot(girls.cut)
boxplot(Weight~Gender)
## Boxplot does not show means in R. We might ask R to show the means
points(tapply(Weight, Gender, mean), col=&quot;blue&quot;, pch=18)
summary(FemaleWeights)
###################### Equal Variance test###########################
varMales&lt;-var(MaleWeights)
varMales
varFeMales&lt;-var(FemaleWeights)
varFeMales
var.test()
var.test(FemaleWeights,MaleWeights)
library(EnvStats) # need ggplot2 to be installed
# The easiest way to get ggplot2 is to install the whole tidyverse:
install.packages(&quot;tidyverse&quot;)
library(&quot;EnvStats&quot;)
#Ex 15.1 Timers
timer&lt;-c(29.2, 29.5, 30.2, 30, 30, 30.3, 28.6, 30, 29.8, 29.7, 30.2)
varTest(timer, alternative = &quot;greater&quot;, sigma.squared = 0.25) # right tailed =&gt; p value 0.41
varTest(timer, alternative = &quot;two.sided&quot;, sigma.squared = 0.25) # two tailed =&gt; p value 0.82
#Ex 15.3 Knotty Problem
A&lt;-c(90, 95, 100, 100, 105, 105, 110)
B&lt;-c(75, 80, 90, 100, 110, 120, 125)
?var.test
var.test(B,A, alternative = &quot;greater&quot;) # right tailed P-value: 0.01054
var.test(B,A ) # two tailed P-value: 0.0211
###################### Normality Check###########################

http://seankross.com/notes/dpqr/

rnorm () # will generate random normal numbers (normally distributed with mean=0 and
sd=1 by default)
dnorm() # same as Norm.Dist with argument False, it&#39;s PDF Probability Density Function)
pnorm() # same as Norm.Dist with argument TRUE, it&#39;s CDF Cumulative Distribution
Function)
qnorm() # same as Norm.S.Inv, returns Z for a p value)
qqnorm(MaleWeights)
qqline(MaleWeights)
shapiro.test(MaleWeights)
qqnorm(FemaleWeights)
qqline(FemaleWeights)
shapiro.test(FemaleWeights)

###################### T test ###########################

t.test(MaleWeights, mu=60, alternative=&quot;greater&quot;) # One sample t test,mu boys &gt; 60
t.test(FemaleWeights, mu=60, alternative=&quot;less&quot;) # One sample t test,mu girls &lt; 60
t.test(Weight~Gender, alternative=&quot;greater&quot;, var.equal=T) # one tail to the right MALE
FEMALE
t.test(MaleWeights,FemaleWeights, alternative=&quot;greater&quot;, var.equal=T) # alternatively
t.test(Weight~Gender, alternative=&quot;two.sided&quot;, var.equal=T) # two tailed
t.test(Weight~Gender, alternative=&quot;less&quot;, var.equal=T) # wrong, still do MALE-FEMALE
and look for wrong tail
t.test(FemaleWeights, MaleWeights, alternative=&quot;less&quot;, var.equal=T) # rightway
###################### ANOVA test ###########################
#Ex 15.8 Rain in Spain
A &lt;- c(12, 12, 13, 13, 12, 13)
B &lt;- c(10, 11, 10, 12, 12, 10)
C &lt;- c(8, 10, 11, 12, 10, 10)
rain&lt;-data.frame(A,B,C) #std form
rain
# Wide format
boxplot(rain)
means&lt;-colMeans(rain)
points(1:3, means, pch = 23, cex = 0.75, bg = &quot;red&quot;)
lapply(rain, shapiro.test)
stack(rain)
#unstack(rain) #will convert back to wide format
rain&lt;-stack(rain) #for long format
rain
colnames(rain)&lt;-c(&quot;Rain&quot;,&quot;Method&quot;)
rain
attach(rain) # we can access the columns (variables) directly
boxplot(rain) # not apropriate for long format
boxplot(Rain~Method)
means&lt;-tapply(Rain, Method,mean) #or using by() as below
means &lt;- by(Rain, Method, mean)
points(1:3, means, pch = 23, cex = 0.75, bg = &quot;red&quot;)
fit&lt;-aov(Rain ~ Method)
summary(fit)
TukeyHSD(fit)
plot(TukeyHSD(fit))

#---------------------------------#
# Big Data Analysis in R #
#---------------------------------#

#means comments
# After installing R from internet, get the full latest version of bioconductor using following
commands or Load the bioconductor (www.bioconductor.org) packages for working with
Biological data.
#Bioconductor provides tools for the analysis and comprehension of high-throughput
genomic data.
#Bioconductor uses the R statistical programming language, and is open source and open
development.
#It has two releases each year, 1024 software packages, and an active user community.
Have the latest release of R, then get the latest version of Bioconductor†by starting R and
entering the commands
install.packages(&quot;BiocManager&quot;)
library(affy) # if not loading, use BiocManager as
BiocManager::install(&quot;affy&quot;)
library(affy) # Now Fine
library(affycoretools) # # if not loading, use BiocManager as above
BiocManager::install(&quot;affycoretools&quot;) # will take really long
library(limma) # plotDensities
# during installation if it asks for go with yes or all or yes to all
dir()# will tell what files and directories/folders you have in your current folder
library() # will tell you what libraries you have already installed
ls() # will tell what variables you have so far, variable is anything that can store value/s, type
of a variable will be specified by the value it stores.
#### Check the current working directory, which is where R reads from and writes to unless
full path names are given. Change the working directory to the one where the data is.
getwd() ### will tell you where exactly you are right now
setwd(&quot;path_to_folder&quot;) # will change to where we want
# Need help? want to know about what any command does, just type
help() # will open help server for you, you can specify your question also as help(anything)
help(&quot;ls&quot;)
help(&quot;objects&quot;)
help(&quot;class&quot;) # or
?class # will help if it ís parent package is already loaded
??class # will search for what package it exists in R
x# will give an error since there is no variable defined as x
x&lt;-1# will create a variable x (a numeric vector) and stores a value of 1 in it. &lt;- is assignment
operator, similar to =
x# now will return var x and its value
y&lt;-1:10# will store 1 to 10 in y
y
z&lt;-1,3,4# will give an error, the right way is to use c(), concatenate function
z&lt;-c(1,2,3,3)
z
# both x and y are also numeric vectors
v&lt;-c (&#39;a&#39;, &#39;b&#39;, &#39;c&#39;) # we can store characters in v. V will become a character vector. Let&#39;s check
it&#39;s class
class(v)

rm() # you can remove any variable
rm(list=ls()) # you can remove all variables
length(z) # will return you how many items are there in a vector
unique(z) # will return a non-redundant list
w&lt;-matrix(1:10, nrow=2, ncol=5, byrow=T)# will create a matrix type object &amp; fill it row-
wise try byrow=F also. Matrix stores numeric vectors
dim(w) # will tell how many rows and columns we have in w
data.frame(1,10,c(&#39;a&#39;, &#39;b&#39;)) # will create a dataframe that can have different types of vectors
like integer, character etc
factor() # will create a factor class object that have different levels
z&lt;-c(1,2,2,3,3,5)
factor(z)
as.factor() # &#39;as&#39; will change the data type to as what specified
as.numeric() # will change the data type to numeric
is.factor() # will check whether the data type is factor
is.numeric # will check whether the data type is numeric
apply() # will apply any function on any data
rep(1,3) # will print 1 three times
rep(c(&quot;A&quot;,&quot;B&quot;), 3) # will print A,B three times alternatively
rep(c(&quot;A&quot;,&quot;B&quot;),each=3) # will print A, 3 times and then B, 3 times
ls() #### Show the objects in workspace; if there are any, remove them.
rm(list=ls())
###################### Data Analysis in R studio###########################
Lets input the data file as csv
rawdata&lt;- read.csv(&quot;income.csv&quot;) # will read a .csv file, will take categorical variables as
character data type
rawdata&lt;- read.csv(&quot;income.csv&quot;, stringsAsFactors=T) # will take categorical variables as
factor data type
# We can read also a text file (.txt) as under
#rawdata &lt;- read.delim (&quot;income.txt&quot;, stringsAsFactors=F)
# default T, takes numeric values as factors. Once the prompt returns, verify that you have
created a new object in the workspace, and see itís kind.
ls()
class(rawdata)# Because it&#39;s a data frame, we can ask what the dimensions are:
dim(rawdata) # how many rows and columns we have
head(rawdata) # Look at the first few (6) rows of the data
rawdata[1:5,] # Look at the first 5 rows of the data
rawdata[1:5,1:3] # Look at the first 5 rows and 1st to 3 rd columns of the data
tail(rawdata) # Look at the last few lines of the data
rawdata$R1 # will print this column or create a new one if it does not exist
#### We need to tell R the overall experimental design, i.e what treatments are there in
which column/s, how many total treatments are there and their replicates etc. This
experimental design is simple, we tell R as:
expt&lt;-rep(c(&quot;IBD&quot;,&quot;RWP&quot;), each=3)
expt
expt&lt;- factor (expt) # ensure the order
expt
expt&lt;-factor (expt, levels=c (&quot;IBD&quot;, &quot;RWP&quot;))
expt

#### Let’s take a break, save the workspace and history, then practicequitting R and
restarting your analysis
save.image(&quot;DataAnalysis.RData&quot;)
savehistory(&quot;DataAnalysis.Rhistory&quot;)
q() #say no; if say yes, will save files with default names of &quot;.RData&quot; and &quot;.Rhistory&quot;
#### Start R again, change working directory, load .RData and .Rhistory
setwd(&quot;C:/Myworkshop&quot;)
load(&quot;DataAnalysis.RData&quot;)
loadhistory(&quot;DataAnalysis.Rhistory&quot;)
ls() #see that objects have been loaded
#### Use up and down arrows to see through history (.Rhistory)
#### Must load libraries again, every time you start R!
library(limma)
library(affy)
library(affycoretools)
##########################Data Exploration################################
#It is a good idea to do some basic exploration of the data. Let&#39;s start by looking at the range
of counts per sample:
summary(rawdata) # function from affy package
summary(rawdata)
boxplot(rawdata) # from default graphics package, boxplots here are weird because of much
variation in the data. We might transform data
boxplot(log2(rawdata))
# Give warnings as log0 is -Inf, small constant may be added to avoid 0s,
boxplot(log2(rawdata+0.01)) # lets make it colorful
boxplot(log2(rawdata+0.01), col=rep(c(&quot;green&quot;,&quot;pink&quot;), each=3), xlab= &quot;Samples&quot;,
ylab=&quot;Data in log2 scale&quot;)
## Boxplot does not show means in R. We might ask R to show the means
points(log2(colMeans(rawdata+0.01)), col=&quot;blue&quot;, pch=18)
#### We can also examine the overall distributions of counts to see if any of the samples are
different. Because of the extreme range in the data, converting to log2 scale helps in plotting;
however, you can&#39;t take the log of 0, so we need to add a small constant before taking the
logs and plotting the distributions. Since the smallest possible value is 1, pick a constant
smaller than that, like 0.01
##All graphics can be saved using the Export -&gt; Save as PDF
plot(density(as.matrix(rawdata)))
plot(density(as.matrix(log2(rawdata))))
# or Use plotDensities function from limma
plotDensities(rawdata)
plotDensities (log2(rawdata)) # Warnings
plotDensities (log2(rawdata+0.01), legend=&quot;topright&quot;) # add constant if don&#39;t like to be
warned
#### The shapes are similar, except mu3 is slightly different. It has many more low values
(likely zeros), so maybe it has a smaller number of total counts. Let&#39;s check the library size
for each sample by summing all the counts:
totalworth&lt;- colSums(rawdata) # total income in each sample
totalworth
WIN&lt;-totalworth/1000000 # Worth in Million
WIN

barplot(WIN)
#x11() #This will open a new graphing window; without it, previous graph will be replaced.
But it slows the system.
barplot(WIN, col=rep(c(&quot;red&quot;, &quot;blue&quot;), each=3), xlab= &quot;Samples&quot;, ylab=&quot;Worth in Millions&quot;,
width=1000000, ylim=c(0, 12))
plot(WIN, col=rep(c(&quot;red&quot;, &quot;blue&quot;), each=3), xlab= &quot;Samples&quot;, ylab=&quot; Worth in Millions&quot;,
width=1000000, ylim=c(0, 12))
plot(totalworth, col=rep(c(&quot;red&quot;, &quot;blue&quot;), each=3), xlab= &quot;Samples&quot;, ylab=&quot; Worth in
Millions &quot;)
heatmap(as.matrix(rawdata[1:10,])) # Heat map of counts of first 10 persons
heatmap(as.matrix(rawdata[1:10,]),col = cm.colors(256)) # better colors
heatmap(as.matrix(rawdata[1:10,]), Rowv=NA, Colv=NA) # Heat map without clutering
heatmap(as.matrix(rawdata[1:10,]), Colv=NA) # Heat map without sample clutering
###################### Worth Per Million (WPM) Normalization ##################
##We can calculate Worth Per Million (WPM) by dividing each data point by total amount of
the sample converted in million (we call it Worth Per Million (WPM)). We need to do this
separately for each sample; there are many ways this can be done, but here is one. First, set
up a matrix with the appropriate number of rows and columns to hold the data:
# At first we create and empty object like this:
WPM &lt;-
matrix(NA,nrow=nrow(rawdata),ncol=6,dimnames=list(row.names(rawdata),colnames(rawd
ata)))
# look at what you created:
WPM[1:5,]
for (i in 1:6) {
WPM[,i] &lt;- rawdata[,i] / WIN[i]
}
WPM[1:5,]
write.csv(WPM, &quot;WPM.csv&quot;)
#### WPM values appear to be continuous, but they are actually based on count data.
Examine the range of values per sample:
summary(WPM)
#you can also save the graph as graphics
pdf(&quot;boxplotsWPM.pdf&quot;)
boxplot(log2(WPM+0.01), col=rep(c(&quot;green&quot;,&quot;pink&quot;), each=3), xlab= &quot;Samples&quot;,
ylab=&quot;Worth Per Million&quot;)
## Boxplot does not show means in R. We might ask R to show the means
points(log2(colMeans(WPM+0.01)),col=&quot;blue&quot;,pch=18)
dev.off()
barplot(colSums(WPM), col=rep(c(&quot;green&quot;,&quot;pink&quot;), each=3), xlab= &quot;Samples&quot;, ylab=&quot; Worth
Per Million&quot;)
heatmap(WPM[1:50,])
########################Clustering and Separation######################
#### Do a quick-and-dirty cluster analysis to see how similar the samples are. We will use a
fast hierarchical clustering from the WGCNA package, which is useful for seeing outliers and
if there are any major groupings of samples. will use some of WGCNA functions must load
the WGCNA package. We will do the clustering on the WPM values, but again they need to
have a small constant added and the log2 taken. Then, since we want to cluster the samples,

the data matrix must be transposed so that the rows X column are samples X Genes. Finally,
we calculate a distance metric between the samples and perform the
#hierarchical cluster. All this can be done in:
hc.WPM &lt;- hclust(dist(t(log2(WPM+0.01))),method=&quot;average&quot;)
# Now plot it, and change the size of the graphing window:
#sizeGrWindow(10,6)
plot(hc.WPM,hang = -1, main = &quot;Hierarchical Clustering&quot;, sub = &quot;&quot;, xlab = &quot;&quot;,cex=0.9)
#### PCA plot. This will do a principle components analysis, which compresses the the
information into just a few &#39;principle components&#39;, and plots the deg. The plot can either be a
scree plot (which shows how much variation each principle component explains) or a plot of
2 PCs.First, check the screeplot to see how many of the PCs explain much variation. By
definition, PC1 &gt; PC2 &gt; PC3, etc.
plotPCA(log2(WPM+0.01), screeplot=T) # Affycoretools
plotPCA(log2(WPM+0.01))
# Adding names on the sample
plotPCA(log2(WPM+0.01),addtext=colnames(rawdata), legend=F)
# You can see that even using WPM values, the mu3 sample is very different. To output
WPM data to use in other programs:
write.csv(WPM,file=&quot;WPM_values.csv&quot;)
save.image(&quot;RNASeq.RData&quot;) #don&#39;t forget to save often!!
savehistory(&quot;RNASeqDemo.Rhistory&quot;)
gc() #this helps to reclaim used memory