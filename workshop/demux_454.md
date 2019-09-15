# Demultiplexing a 454 run

454 Runs were barcoded using a molecular identifier (MID) that was in the same read with the target sequence 
(Illumina on the other hand now uses different sequencing primers for the indexes).

In the **workshop/454** folder you'll find a run performed in Raes lab. To perform the demultiplexing of ancient dataset you need to know what
molecular identifier (MID) was associated with each sample, producing a mapping file like this (full file [here](../datasets/454/map.txt)):
```
#SampleID	BarcodeSequence	LinkerPrimerSequence	fnaFile	qualFile
bl9	ACGAGTGCGT	CCGTCAATTCMTTTRAGT	Anh.1.fna	Anh.1.qual
bl10	ACGCTCGACA	CCGTCAATTCMTTTRAGT	Anh.1.fna	Anh.1.qual
bl11	AGACGCACTC	CCGTCAATTCMTTTRAGT	Anh.1.fna	Anh.1.qual
bl12	AGCACTGTAG	CCGTCAATTCMTTTRAGT	Anh.1.fna	Anh.1.qua
```

As you can see, the dataset has the typical 454 format of sequences in FASTA format (.fna) and quality scores in a separate file (.qual).

## Demultiplexing with sdm

The folder contains both the [mapping file](../datasets/454/map.txt) and a demo [454 option](../datasets/454/454_sdm.txt) file for [sdm](../docs/sdm.md).

1. Perform the demultiplexing using `sdm`
1. Try editing the 454_sdm.txt chaging the stringecy of barcode (i.e. errors allowed): can you rescue more sequences?
