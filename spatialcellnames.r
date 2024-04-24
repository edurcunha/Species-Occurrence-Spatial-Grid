#########
# spatialcellnames: Creates the labels containing lat and long information for the output grid.
#########

# nrows: A value indicating the number of rows of the output grid.
# ncols: A value indicating the number of cols of the output grid.
# gridresolution: A value describing the resolution of the output grid in degrees ().

spatialcellnames <- function(nrows, ncols, gridresolution) {

  latNum <- seq(-90+gridresolution, 90, gridresolution)
  latNum <- sprintf("%.2f", latNum)
  #latNum <- formatC(latNum, digits = 5, flag = 0)
  latLab <- paste('Lat:', latNum, sep = '')


  lonNum <- seq(-180+gridresolution, 180, gridresolution)
  lonNum <- sprintf("%.2f", lonNum)
  #lonNum <- formatC(lonNum, digits = 5, flag = 0)
  lonLab <- paste('Lon:', lonNum, sep = '')

  coords <- expand.grid(latLab, lonLab)
  coordLabs <- apply(coords, 1, paste, collapse = '_')

  return(coordLabs)

}