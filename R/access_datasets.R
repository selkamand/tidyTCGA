#' Open arrow connection to TCGA mutation data
#'
#' Opens TCGA MC3 mutation data
#'
#' @return A FileSystemDataset object (can work with it like its any other database connection)
#' @export
#'
#' @examples
#' # Pull All Coding Mutations in TCGA GBM cohort
#' tcga_open_mutation_datasets() |>
#'   dplyr::filter(Disease == "GBM", Silent = FALSE) |>
#'   dplyr::collect()
#'
tcga_open_mutation_datasets <- function(){
  path = system.file(package="tidyTCGA", "tcga_mc3")
  tcga <- arrow::open_dataset(path)
  return(tcga)
}

#' Load all cohort into memory
#'
#' Loads all TCGA MC3 mutation data for a given cohort
#'
#' @param study name of the study to load data from (or keyword 'everything' to get all the data)
#'
#' @return data.frame
#' @export
#'
#' @examples
#' # Pull All Coding Mutations in TCGA GBM cohort
#' tcga_load_cohort_mutations('GBM')
#'
tcga_load_cohort_mutations <- function(study){

  if(study == "everything"){
    df_mutations <- tcga_open_mutation_datasets() |>
      dplyr::collect()
  }
  else {
    df_mutations <- tcga_open_mutation_datasets() |>
      dplyr::filter(Disease == study) |>
      dplyr::collect()
  }

  return(df_mutations)
}


#' See available datasets
#'
#' Opes TCGA MC3 mutation data
#'
#' @return A filesystem
#' @export
#'
#' @examples
#' # Pull All Coding Mutations in TCGA GBM cohort
#' load_tcga_mutations() |>
#'   dplyr::filter(Disease == "GBM", Silent = FALSE) |>
#'
tcga_available <- function(){
  maftools::tcgaAvailable() |>
    dplyr::filter(Study_Abbreviation != "Unknown")
}
