# Using Lotus

## What you need

 * *Input sequences*: a set of sequences (coming from a metabarcoding experiment)
 * A *mapping file*: spreadsheet  with some information about each sample

Sometimes, especially when downloading public datasets (that can be quite outdated), we need to _manipulate_ the raw input in order to be able to process it.
An example is the demultiplexing of a sequencing run using a set of molecular barcodes. Lotus ships its own tool to perform the demultiplexing (sdm, for "simple demultiplexer").

The spreadsheet, usually referred to as _mapping file_, is the glue that links our reads to relevant information (e.g. a sample name, the treatment, ...)

## Preparing a mapping file

A very generic metadata file can be like:

#SampleID     |  Facility        Diet    Facility_Diet   Cholic_acid     Muricholic_acid
--------------|-------------------------------------------------------------------------------------------
13xSPFxCD     |  SPF     CD      SPF_CD  342.5568553     1026.617105
14xSPFxCD     |  SPF     CD      SPF_CD  227.4375746     1436.135551
15xSPFxCD     |  SPF     CD      SPF_CD  20.17057537     862.6286804
16xSPFxCD     |  SPF     CD      SPF_CD  65.58988185     1139.587569
19xSPFxHFD    |  SPF     HFD     SPF_HFD 755.6828012     2157.201043
21xSPFxHFD    |  SPF     HFD     SPF_HFD 258.5543231     1316.12489
22xSPFxHFD    |  SPF     HFD     SPF_HFD 839.0187497     2324.535538
24xSPFxHFD    |  SPF     HFD     SPF_HFD 850.7323605     1001.782492

## Running Lotus
