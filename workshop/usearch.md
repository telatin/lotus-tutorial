# Analysis with USEARCH

The goal of this simplified analysis it to make easier to inspect all the intermediate files produced by a typical 16S analysis.

## Prepare the reads
Usearch will work on uncompressed reads so:

```
cd datasets/diet
gunzip *.gz
```

First we merge the R1 and R2 (pair ends), and in the same step we relabel the reads using the filename as identifier (this is the special meaning of @).

The second command will perform a quality filter.
```
usearch -fastq_mergepairs *R1*.fastq -relabel @ -fastqout merged.fq
usearch -fastq_filter merged.fq -fastq_maxee 0.7 -relabel filt -fastaout filt.fa
```
:bulb: How many filtered sequences are present in total?

## OTU picking

Now first we dereplicate the reads (find the uniques), and second we use the uniques to identify the Amplicon Sequence Variants (ASV), or Zero-radius OTUs, as USEARCH calls them:

```
usearch -fastx_uniques filt.fa -relabel uniq -sizeout -fastaout uniq.fa
usearch -unoise3 uniq.fa -zotus otus.fa
```
:bulb: Can you replicate the same dereplication using *sdm*?

:bulb: How many ASVs (OTUs, ZOTUs..) were identified?

## Prepare the OTU table
For this step we need to map all the input reads against the OTUs. Since we relabeled the reads in merged.fq, we can:

```
# Generate OTU table
usearch  -otutab merged.fq -zotus otus.fa -otutabout zotutab.txt

# Get statistics on the table
usearch -otutab_stats otutable.txt -output report.txt

# Rarefy the table at 1000 reads to have comparable numbers
usearch -otutab_rare otutab.txt -sample_size 1500 -output otutab_norm.txt
```

