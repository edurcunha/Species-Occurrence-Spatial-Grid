#########
# occurtogrid: Species occurance in grid position
#########

# latitude: A vector containing the latitudes of species occurences.
# longitude: A vector containing the longitudes of species occurences.
# species: A vector containing the species label for each occurrence.
# gridresolution: A value describing the resolution of the output grid in degrees ().


occurtogrid <- function(latitude, longitude, gridresolution, ...) {

  if (!is.numeric(latitude)) {
    stop("Latitude is not numeric!")
  }

  if (!is.numeric(longitude)) {
    stop("Longitude is not numeric!")
  }

  if (!length(latitude) == length(longitude)) {
    stop("The length of latitude and longitude differ")
  }

  if (!(is.vector(gridresolution) &
       is.numeric(gridresolution) & 
       length(gridresolution) == 1 )) {
    stop("The grid resolution must be a single numeric value")
  }

  if (90 %% gridresolution) {
    stop("Invalid grid resolution")
  }

  ellipsis <- list(...)
  if (is.null(ellipsis[["species"]])) {
    species <- NULL
  } else {
    if (any(names(ellipsis) %in% "species")) {
      species <- ellipsis[["species"]]
      if (!length(species) == length(longitude)) {
        stop("The length of species lables and coordinates differ")
      }
      if (sum(names(ellipsis) %in% "species") > 1) {
        warning("More than one 'species' argument was provided.
        \nOnly the first one was used")
      }
    } else {
      warning("'species' is the only additional argument that is allowed!
      \nAnalysis will proceed as all occurences belong to a single species")
    }
  }

  source("occurgridpos.r")
  gridPos <- occurgridpos(latitude = latitude, longitude = longitude,
            gridresolution = gridresolution, species = species)

  uniqueGridPos <- unique(gridPos)

  source("gridocurrences.r")
  ocurrencesonthegrid <- gridocurrences(uniqueGridPos, gridresolution)

  return(ocurrencesonthegrid)

}
