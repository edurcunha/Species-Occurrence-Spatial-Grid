# Species-Occurrence-Spatial-Grid
## A tool to convert species geographical records into spatial matrices of presence/absence

This tool transforms species geographical occurrences into a flexible spatial matrix of presence/absence, a fundamental data structure in biogeography analysis. The tool automates the construction of spatial matrices, allowing handling geographical coordinates of multiple species at a time, and it offers an option of adjustable spatial resolutions to meet specific user needs. Currently supporting decimal degrees, the matrix structure aligns latitude values with row positions and longitude values with column positions, spanning from 90° to -90° for latitude and -180° to 180° for longitude. This tool output includes a vectorized spatial matrix (columns concatenated to form a unidimensional vector) with values of species presence/absece. For multiple species, the tool intelligently groups vectorized matrices as matrix rows, providing an efficient data structure for multiple species analyses.


## Package usage

Compile the code

```{r, echo=FALSE}
source('GermanCredit/read_SouthGermanCredit.R')
```

Load a fictional dataset containing a single species

```{r, echo=FALSE}
data1 <- read.csv("RandomOccurrences.csv", sep=',')
data1
```

Load a fictional dataset containing two species


```{r, echo=FALSE}
data2
data2  <- read.csv("RandomOccurrences2.csv", sep=',')
```

Here is an example for occurrences of a single species 

```{r, echo=FALSE}
gridOneSpecies <- occurtogrid(latitude = data1$Latitude, 
                    longitude = data1$Longitude, 
                    gridresolution = 10)
gridOneSpecies
```

For two or more species, you can add the argument 'species' contining the species lables to the function

```{r, echo=FALSE}
gridTwoSpecies <- occurtogrid(latitude = data2$Latitude, 
                    longitude = data2$Longitude, 
                    gridresolution = 10, 
                    species = data2$Species)
gridTwoSpecies
```