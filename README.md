# Species-Occurrence-Spatial-Grid
## A tool to convert species geographical records into spatial matrices of presence/absence

This tool transforms species geographical occurrences into a flexible spatial matrix of presence/absence, a fundamental data structure in biogeography analysis. The tool automates the construction of spatial matrices, allowing handling geographical coordinates of multiple species at a time, and it offers an option of adjustable spatial resolutions to meet specific user needs. Currently supporting decimal degrees, the matrix structure aligns latitude values with row positions and longitude values with column positions, spanning from 90° to -90° for latitude and -180° to 180° for longitude. This tool output includes a vectorized spatial matrix (columns concatenated to form a unidimensional vector) with values of species presence/absece. For multiple species, the tool intelligently groups vectorized matrices as matrix rows, providing an efficient data structure for multiple species analyses.


## Package usage

The files and functions required for this example are available for download from the repository. Ensure all files are copied to your current working directory and proceed to compile the code using the 'source()' command.

```{r, echo=FALSE}
source('occurtogrid.r')
```

To illustrate, I constructed a synthetic dataset ('RandomOccurrences.csv') containing geographical occurrences of a fictional species, with data organized in two columns for latitude and longitude (in decimal degrees). This dataset, saved as a .csv file, can be loaded using the 'read.csv()' function.

```{r, echo=FALSE}
data1 <- read.csv("RandomOccurrences.csv", sep=',')
data1
```

Once loaded, utilize the 'occurtogrid()' function to generate a spatial presence/absence matrix. Specify the numerical vectors for latitude and longitude, and adjust the spatial resolution with the 'gridresolution' argument. The resulting matrix is then assigned to the reference object as a vectorized spatial matrix, where columns are concatenated into a unidimensional vector.

```{r, echo=FALSE}
gridOneSpecies <- occurtogrid(latitude = data1$Latitude, 
                    longitude = data1$Longitude, 
                    gridresolution = 10)
gridOneSpecies
```


 Additionally, a second artificial dataset ('RandomOccurrences2.csv') includes occurrences of two fictional species, with an extra column indicating the species label for each coordinate.

```{r, echo=FALSE}
data2  <- read.csv("RandomOccurrences2.csv", sep=',')
data2
```

For datasets with multiple species, use the 'occurtogrid()' function with the 'species' argument, assigning each species label to the corresponding geographical coordinates. The output comprises a series of vectorized spatial matrices, forming a two-dimensional object with geographical positions in columns and species in rows.

```{r, echo=FALSE}
gridTwoSpecies <- occurtogrid(latitude = data2$Latitude, 
                    longitude = data2$Longitude, 
                    gridresolution = 10, 
                    species = data2$Species)
gridTwoSpecies
```