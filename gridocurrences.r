#########
# gridocurrences: 
#########

# uniqueGridPos: 
# gridresolution: A value describing the resolution of the output grid in degrees ().

gridocurrences <- function(uniqueGridPos, gridresolution) {

  if ("species" %in% colnames(uniqueGridPos)) {
    spp <- unique(uniqueGridPos[, "species"])
  } else {
    spp <- NULL
  }

  nrows <- 180 / gridresolution
  ncols <- 360 / gridresolution

  if (is.null(spp)) {
    occurrenceGrid <- matrix(0, 0, nrows * ncols)
    occurrenceGridTmp <- matrix(0, nrows, ncols)
    for (i in 1:nrow(uniqueGridPos)) {
      occurrenceGridTmp[uniqueGridPos[i, "latPos"], uniqueGridPos[i, "longPos"]] <- 1
    }
    occurrenceGridTmp <- c(occurrenceGridTmp)
    occurrenceGrid <- rbind(occurrenceGrid, occurrenceGridTmp)
  } else {
    occurrenceGrid <- matrix(0, 0, nrows * ncols)
    for (sp in spp) {
      uniqueGridPosTmp <- uniqueGridPos[uniqueGridPos[, "species"] == sp, , drop = F]
      occurrenceGridTmp <- matrix(0, nrows, ncols)
      for (i in 1:nrow(uniqueGridPosTmp)) {
        occurrenceGridTmp[uniqueGridPosTmp[i, "latPos"], uniqueGridPosTmp[i, "longPos"]] <- 1
      }
      occurrenceGridTmp <- c(occurrenceGridTmp)
      occurrenceGrid <- rbind(occurrenceGrid, occurrenceGridTmp)
    }

  }

  rownames(occurrenceGrid) <- spp

  source("spatialcellnames.r")
  cellnames <- spatialcellnames(nrows = nrows, ncols = ncols, 
                                gridresolution = gridresolution)
  colnames(occurrenceGrid) <- cellnames

  return(occurrenceGrid)

}