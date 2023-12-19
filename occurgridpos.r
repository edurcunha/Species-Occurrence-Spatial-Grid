#########
# occurgridpos: Species occurance in grid position
#########

# latitude: A vector containing the latitudes of species occurences.
# longitude: A vector containing the longitudes of species occurences.
# species: A vector containing the species label for each occurrence.
# gridresolution: A value describing the resolution of the output grid in
#                 degrees ().

# P.S.: The resulting matrix is set to fit a map ranging from 
#       Lat: -90 to 90 and Long: -180 to 180. 


occurgridpos <- function(latitude, longitude, gridresolution, species) {

  gridPos <- matrix(NA, 
              nrow = length(latitude),
              ncol = ifelse(is.null(species), 2, 3),
              dimnames = if(is.null(species)) {
                    (list(NULL, c("latPos", "longPos")))
                  } else {
                    (list(NULL, c("species", "latPos", "longPos")))
                  })
  gridPos <- as.data.frame(gridPos)

  gridPos[, "latPos"] <- floor(abs(latitude - 90) /
                            gridresolution ) + 1
  gridPos[, "longPos"] <- floor( (longitude + 180) /
                            gridresolution ) + 1
  if (!is.null(species)) gridPos[, "species"] <- species

  return(gridPos)

}