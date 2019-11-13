# TRGN-510-Final-Project

## Description  
This repository is for my final project in TRGN 510. The purpose of this project is to compare the gene expression quantification with regard to Acute Lymphoblastic Leukemia using diverging barcharts. Different subgroups and/or phases can be selected with UI elements.   

## Datasets
The data is from [GDC Data Portal of NIH](https://portal.gdc.cancer.gov) including clinical data and gene expression quantification: 


* [Phase 2](https://portal.gdc.cancer.gov/projects/TARGET-ALL-P2): [Gene expression quantification](https://portal.gdc.cancer.gov/repository?facetTab=files&filters=%7B%22op%22%3A%22and%22%2C%22content%22%3A%5B%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22cases.project.project_id%22%2C%22value%22%3A%5B%22TARGET-ALL-P2%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.analysis.workflow_type%22%2C%22value%22%3A%5B%22HTSeq%20-%20Counts%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.data_category%22%2C%22value%22%3A%5B%22Transcriptome%20Profiling%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.data_type%22%2C%22value%22%3A%5B%22Gene%20Expression%20Quantification%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.experimental_strategy%22%2C%22value%22%3A%5B%22RNA-Seq%22%5D%7D%7D%5D%7D&searchTableTab=files)

* [Phase 3](https://portal.gdc.cancer.gov/repository?facetTab=files&filters=%7B%22op%22%3A%22and%22%2C%22content%22%3A%5B%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22cases.project.project_id%22%2C%22value%22%3A%5B%22TARGET-ALL-P3%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.data_category%22%2C%22value%22%3A%5B%22Clinical%22%5D%7D%7D%5D%7D&searchTableTab=files): [Gene expression quantification](https://portal.gdc.cancer.gov/repository?facetTab=files&filters=%7B%22op%22%3A%22and%22%2C%22content%22%3A%5B%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22cases.project.project_id%22%2C%22value%22%3A%5B%22TARGET-ALL-P3%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.analysis.workflow_type%22%2C%22value%22%3A%5B%22HTSeq%20-%20Counts%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.data_category%22%2C%22value%22%3A%5B%22Transcriptome%20Profiling%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.experimental_strategy%22%2C%22value%22%3A%5B%22RNA-Seq%22%5D%7D%7D%5D%7D&searchTableTab=files)

The clinical data is in Excel spreadsheets (.xlsx). Gene expression quantification is two-column pure text. Thirty samples will be analyzed in each phase and each sex.

## Proposed Analysis  

shiny: Shiny is an R package that makes it easy to build interactive web apps straight from R. 

ggplot2: ggplot2 is a system for declaratively creating graphics, based on The Grammar of Graphics. You provide the data, tell ggplot2 how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

plotly: Plotly is an R package for creating interactive web-based graphs via the open source JavaScript graphing library plotly.js.

Calculate the relative differences of gene expression between the selected group and the average. Visualize the difference with heat map.

## Proposed Timeline & Major Milestones 
#### Milestone 1 (11/13/19): 
Download and extract data. 
Experiment with diverging barcharts.

#### Milestone 2 (11/20/19): 
Implement cross-selection.
Finalize user interface.
Adjust raw data some more.

#### Milestone 3 (11/27/19): 
Debug and optimize code.
Deploy application on the cloud.

## User Interface 
User interface will roughly look like this [demo](https://shiny.rstudio.com/gallery/telephones-by-region.html).
The select list input controls will be on the left side, so the users can pick patients of different sexes and phases. The heat map will be on the right side.
