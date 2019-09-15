# Using Lotus

## What you need

 * *Input sequences*: a set of sequences (coming from a metabarcoding experiment)
 * A *mapping file*: spreadsheet  with some information about each sample

Sometimes, especially when downloading public datasets (that can be quite outdated), we need to _manipulate_ the raw input in order to be able to process it.
An example is the demultiplexing of a sequencing run using a set of molecular barcodes. Lotus ships its own tool to perform the demultiplexing (sdm, for "simple demultiplexer").

The spreadsheet, usually referred to as _mapping file_, is the glue that links our reads to relevant information (e.g. a sample name, the treatment, ...)

For this tutorial Lotus was already installed in the ~/lotus_pipeline/ directory.

## Preparing a mapping file

A very _generic metadata_ file can be a simple tab-separated text file with this content:

|#SampleID |  Facility |Diet   |Fac_Diet |Cholic_acid  |Muricholic_acid |
|----------|----------|--------|---------|-------------|----------|
|13xSPFxCD  |  SPF     |CD      |SPF_CD   |342.5568553  |1026.617105 |
|14xSPFxCD  |  SPF     |CD      |SPF_CD   |227.437574   |1436.135551 |
|15xSPFxCD  |  SPF     |CD      |SPF_CD   |20.17057537  |862.6286804 |

What is missing from this generic metadata file to be a _mapping file_, is the path to the reads (i.e. their filename and relative position). In Lotus the required column is called **fastqFile**.

## Running Lotus

To run Lotus (see [the full documentation](../docs/lotus.md)) you need at least:
```
lotus.pl -i INPUT_DIR -o OUTPUT_DIR -m MAPPING_FILE [-c CONFIGURATION_FILE]
```

 * You can find a generic Lotus configuration file inside the Lotus installation directory (it's called `lOTUs.cfg`).
 * Lotus will begin using [sdm](../docs/sdm.md) for the demultiplexing, quality filtering and dereplication, hence you can supply a `-s sdm_config.txt` file to customize its behaviour. Note that, again, you'll find generic sdm files (for 454, MiSeq, HiSeq) in the Lotus installation directory.

## Customizing the parameters

1. Try changing the default clustering algorithm from USEARCH to swarm
1. Try using a [custom database](../workshop/customdb.md) (beeTax) for instead of the default (GreenGenes)

## Tuning parameters almost towards ASV (Amplicon Sequence Variant) 

Now rerun Lotus, but try to optimize for a lot of small, hard defined OTUs 
(that might correspond to something like strain level). 

 * Which clustering algorithm might be suitable? 
 * Which clustering cutoffs make sense? 

## "I feel lucky" taxonomic assignments

Now we want to assign every OTU sequence to a database target – and we don’t care about false positive assignments! 
Of course this is per se wrong, but in some cases you just want to know what the best hit would be, 
even if it is only 90% similar to your OTU sequence. 

[LotuS](../docs/lotus.md) provides several options that allow tweaking towards more lenient assignments. 
Find all options related to this and try to create the most extreme case with these options, 
by reassigning the taxonomy again as in the previous step.
