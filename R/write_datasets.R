maf_all_variants <- function(maf){
  rbind(maf@data |> dplyr::mutate(Silent = FALSE), maf@maf.silent |> dplyr::mutate(Silent = TRUE)) |>
    dplyr::select(
      Sample = Tumor_Sample_Barcode,
      Gene = Hugo_Symbol,
      Chromosome,
      Start_Position,
      Ref = Reference_Allele,
      Alt = Tumor_Seq_Allele2,
      MutationType = Variant_Classification,
      Silent,
      HGVSp_Short
    ) |>
    dplyr::mutate(GeneFirstLetter = substr(Gene, 1, 1))
}

load_all_maf_datasets <- function(){
  maftools::tcgaAvailable() |>
    dplyr::filter(Study_Abbreviation != "Unknown") |>
    dplyr::pull(Study_Abbreviation) |>
    purrr::map(\(abbrev){
      maftools::tcgaLoad(abbrev, source = "MC3") |>
        maf_all_variants() |>
        dplyr::mutate(Disease = abbrev)
      }) |>
    data.table::rbindlist()
}

write_parquet <- function(df){
  p = "inst/tcga_mc3"
  df |>
    dplyr::group_by(Disease, Silent) |>
    arrow::write_dataset(path = p, format = "parquet")

  dplyr::tibble(
    files = list.files(p, recursive = TRUE),
    size_MB = file.size(file.path(p, files)) / 1024^2
  )
}

write_parquet_genefirstletter_included <- function(df){
  p = "inst/tcga_mc3_nogenefirstletter"
  df |>
    dplyr::group_by(Disease, GeneFirstLetter) |>
    arrow::write_dataset(path = p, format = "parquet")

  dplyr::tibble(
    files = list.files(p, recursive = TRUE),
    size_MB = file.size(file.path(p, files)) / 1024^2
  )
}
