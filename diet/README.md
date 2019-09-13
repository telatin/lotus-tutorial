# Analysis of 16S data with lOTUs

## Introduction

We are going to analyze raw data from a 16S experiment using the [lOTUs pipeline](http://psbweb05.psb.ugent.be/lotus) (see the [paper](https///microbiomejournal.biomedcentral.com/articles/10.1186/2049-2618-2-30)).


## Dataset

We'll use the 16S reads from the paper [Gut barrier impairment by high<E2><80><90>fat diet in mice depends on housing conditions](https///onlinelibrary.wiley.com/doi/full/10.1002/mnfr.201500775) (Mueller 2015). The raw data can be downloaded from [ENA](https///www.ebi.ac.uk/ena/data/view/PRJEB13041).

### Metadata

This is a fraction of the metadata (we'll focus on Diet, where **CD** is Control Diet and **HFD** is High Fat Diet):

 | #SampleID | Facility | Diet | Facility_Diet | Cholic_acid | Muricholic_acid |
 | --------- | -------- | ---- | ------------- | ----------- | -----------------
 | 13.SPF.CD | SPF      | CD   | SPF_CD        | 342.5568553 | 1026.617105       | 
 | 14.SPF.CD | SPF      | CD   | SPF_CD        | 227.4375746 | 1436.135551       | 
 | 15.SPF.CD | SPF      | CD   | SPF_CD        | 20.17057537 | 862.6286804       | 
 | 16.SPF.CD | SPF      | CD   | SPF_CD        | 65.58988185 | 1139.587569       | 

### How many reads? How good?

To start we need to check the sequencing depth (how many reads per sample), and the overall quality of the sequencing reads.

A common tool to perform this analysis is [FastQC](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/), that produces a full report for generic NGS output (mainly whole genome sequencing). For amplicons a lot of sections will not be very useful (e.g. overrepresented *k*-mers are totally expected!).


