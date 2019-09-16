# Undemultiplexed Illumina MiSeq run

In the **datasets/miseq** directory you'll find a non demultiplexed Illumina run, where the barcode (index) is saved in a dedicated FASTQ file 
(with the _.mid._ infix).

Use [sdm](../docs/sdm.md) to perform the demultiplexing.

_NOTE:_ This is a very small subsample of the original dataset and it's only proposed to test the demultiplexing procedure

## Understanding the "undemultiplexed" format

 * Using the `head` or `less` commands, check that the three files (.1 , .2, .mid) are linked by the sequence ID
 * Using `wc` check that the three files have the same number of lines
 * Using `less`, check the structure of the _mapping file_
 
