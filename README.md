
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidyTCGA

> :warning: **Warning**: This project is in early development and is not
> ready for use. Please use with caution as major changes might occur.

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/tidyTCGA)](https://CRAN.R-project.org/package=tidyTCGA)
<!-- badges: end -->

tidyTCGA provides tidy interfaces to TCGA data

## Installation

You can install the development version of tidyTCGA like so:

``` r
remotes::install_github('selkamand/tidyTCGA')
```

## Quick Start

``` r
library(tidyTCGA)

# List Available Datasets
tcga_available()
#>     Study_Abbreviation
#>  1:                ACC
#>  2:               BLCA
#>  3:               BRCA
#>  4:               CESC
#>  5:               CHOL
#>  6:               COAD
#>  7:               DLBC
#>  8:               ESCA
#>  9:                GBM
#> 10:               HNSC
#> 11:               KICH
#> 12:               KIRC
#> 13:               KIRP
#> 14:               LAML
#> 15:                LGG
#> 16:               LIHC
#> 17:               LUAD
#> 18:               LUSC
#> 19:               MESO
#> 20:                 OV
#> 21:               PAAD
#> 22:               PCPG
#> 23:               PRAD
#> 24:               READ
#> 25:               SARC
#> 26:               SKCM
#> 27:               STAD
#> 28:               TGCT
#> 29:               THCA
#> 30:               THYM
#> 31:               UCEC
#> 32:                UCS
#> 33:                UVM
#>     Study_Abbreviation
#>                                                           Study_Name  MC3
#>  1:                                         Adrenocortical_carcinoma   92
#>  2:                                     Bladder_Urothelial_Carcinoma  411
#>  3:                                        Breast_invasive_carcinoma 1020
#>  4: Cervical_squamous_cell_carcinoma_and_endocervical_adenocarcinoma  289
#>  5:                                               Cholangiocarcinoma   36
#>  6:                                             Colon_adenocarcinoma  404
#>  7:                  Lymphoid_Neoplasm_Diffuse_Large_B-cell_Lymphoma   37
#>  8:                                             Esophageal_carcinoma  184
#>  9:                                          Glioblastoma_multiforme  390
#> 10:                            Head_and_Neck_squamous_cell_carcinoma  507
#> 11:                                               Kidney_Chromophobe   66
#> 12:                                Kidney_renal_clear_cell_carcinoma  369
#> 13:                            Kidney_renal_papillary_cell_carcinoma  281
#> 14:                                           Acute_Myeloid_Leukemia  140
#> 15:                                         Brain_Lower_Grade_Glioma  511
#> 16:                                   Liver_hepatocellular_carcinoma  363
#> 17:                                              Lung_adenocarcinoma  515
#> 18:                                     Lung_squamous_cell_carcinoma  485
#> 19:                                                     Mesothelioma   82
#> 20:                                Ovarian_serous_cystadenocarcinoma  411
#> 21:                                        Pancreatic_adenocarcinoma  177
#> 22:                               Pheochromocytoma_and_Paraganglioma  179
#> 23:                                          Prostate_adenocarcinoma  497
#> 24:                                            Rectum_adenocarcinoma  149
#> 25:                                                          Sarcoma  236
#> 26:                                          Skin_Cutaneous_Melanoma  466
#> 27:                                           Stomach_adenocarcinoma  439
#> 28:                                      Testicular_Germ_Cell_Tumors  129
#> 29:                                                Thyroid_carcinoma  492
#> 30:                                                          Thymoma  123
#> 31:                             Uterine_Corpus_Endometrial_Carcinoma  530
#> 32:                                           Uterine_Carcinosarcoma   57
#> 33:                                                   Uveal_Melanoma   80
#>                                                           Study_Name  MC3
#>                              Firehose
#>  1:  62 [dx.doi.org/10.7908/C1610ZNC]
#>  2: 395 [dx.doi.org/10.7908/C1MW2GGF]
#>  3: 978 [dx.doi.org/10.7908/C1TB167Z]
#>  4: 194 [dx.doi.org/10.7908/C1MG7NV6]
#>  5:  35 [dx.doi.org/10.7908/C1K936V8]
#>  6: 367 [dx.doi.org/10.7908/C1DF6QJD]
#>  7:  48 [dx.doi.org/10.7908/C1X066DK]
#>  8: 185 [dx.doi.org/10.7908/C1BV7FZC]
#>  9: 283 [dx.doi.org/10.7908/C1XG9QGN]
#> 10: 511 [dx.doi.org/10.7908/C18C9VM5]
#> 11:  66 [dx.doi.org/10.7908/C1765DQK]
#> 12: 476 [dx.doi.org/10.7908/C10864RM]
#> 13: 282 [dx.doi.org/10.7908/C19C6WTF]
#> 14: 193 [dx.doi.org/10.7908/C1D21X2X]
#> 15: 516 [dx.doi.org/10.7908/C1MC8ZDF]
#> 16: 373 [dx.doi.org/10.7908/C128070B]
#> 17: 533 [dx.doi.org/10.7908/C17P8XT3]
#> 18: 178 [dx.doi.org/10.7908/C1X34WXV]
#> 19:                              <NA>
#> 20: 466 [dx.doi.org/10.7908/C1736QC5]
#> 21: 126 [dx.doi.org/10.7908/C1513XNS]
#> 22: 179 [dx.doi.org/10.7908/C13T9GN0]
#> 23: 498 [dx.doi.org/10.7908/C1Z037MV]
#> 24: 122 [dx.doi.org/10.7908/C1S46RDB]
#> 25: 247 [dx.doi.org/10.7908/C137785M]
#> 26: 290 [dx.doi.org/10.7908/C1J67GCG]
#> 27: 393 [dx.doi.org/10.7908/C1C828SM]
#> 28: 147 [dx.doi.org/10.7908/C1S1820D]
#> 29: 496 [dx.doi.org/10.7908/C16W99KN]
#> 30: 120 [dx.doi.org/10.7908/C15T3JZ6]
#> 31: 248 [dx.doi.org/10.7908/C1C828T2]
#> 32:  57 [dx.doi.org/10.7908/C1PC31W8]
#> 33:  80 [dx.doi.org/10.7908/C1S1821V]
#>                              Firehose

# Load Straight to Memory
tcga_load_cohort_mutations('GBM')
#> # A tibble: 69,853 × 11
#>    Sample   Gene  Chromosome Start_Position Ref   Alt   MutationType HGVSp_Short
#>    <fct>    <chr> <chr>               <dbl> <chr> <chr> <fct>        <chr>      
#>  1 TCGA-02… JAKM… 10              133967449 C     T     Silent       p.D723D    
#>  2 TCGA-02… FAT3  11               92570936 G     A     Silent       p.P3444P   
#>  3 TCGA-02… NOS1  12              117768962 C     A     5'Flank      .          
#>  4 TCGA-02… MYH6  14               23858709 G     T     Silent       p.R1291R   
#>  5 TCGA-02… WDR72 15               53998200 A     T     Silent       p.S342S    
#>  6 TCGA-02… GNPTG 16                1412529 C     T     Silent       p.T201T    
#>  7 TCGA-02… ILF3  19               10789305 C     T     Silent       p.N192N    
#>  8 TCGA-02… PEX14 1                10690182 G     A     3'UTR        .          
#>  9 TCGA-02… NR1I3 1               161206281 C     T     Silent       p.A25A     
#> 10 TCGA-02… TGM6  20                2413386 T     C     3'UTR        .          
#> # ℹ 69,843 more rows
#> # ℹ 3 more variables: GeneFirstLetter <chr>, Disease <chr>, Silent <chr>

# Connect to dataset and filter based on our interests (less memory intensive)
tcga_open_mutation_datasets() |>
  dplyr::filter(Disease == "GBM", Silent == FALSE) |>
  dplyr::collect()
#> # A tibble: 46,413 × 11
#>    Sample   Gene  Chromosome Start_Position Ref   Alt   MutationType HGVSp_Short
#>    <fct>    <chr> <chr>               <dbl> <chr> <chr> <fct>        <chr>      
#>  1 TCGA-02… TACC2 10              123810032 C     T     Missense_Mu… p.T38M     
#>  2 TCGA-02… PANX3 11              124489539 G     A     Missense_Mu… p.R296Q    
#>  3 TCGA-02… SPI1  11               47380512 G     T     Missense_Mu… p.P127T    
#>  4 TCGA-02… NAAL… 11               89868837 C     T     Missense_Mu… p.R65C     
#>  5 TCGA-02… MTER… 12              107371855 A     G     Missense_Mu… p.L213S    
#>  6 TCGA-02… BTBD… 12              108012011 G     A     Missense_Mu… p.E770K    
#>  7 TCGA-02… SLC2… 12                7980269 C     T     Missense_Mu… p.R252Q    
#>  8 TCGA-02… SLC2… 12                8082458 C     T     Missense_Mu… p.R228Q    
#>  9 TCGA-02… EML1  14              100363606 G     A     Missense_Mu… p.A287T    
#> 10 TCGA-02… AKAP6 14               33290999 A     G     Missense_Mu… p.D1327G   
#> # ℹ 46,403 more rows
#> # ℹ 3 more variables: GeneFirstLetter <chr>, Disease <chr>, Silent <chr>
```

## Other packages

If interested in MAF files please see the TCGAmutations package
