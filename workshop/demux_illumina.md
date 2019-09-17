# Undemultiplexed Illumina MiSeq run

In the **datasets/miseq** directory you'll find a non demultiplexed Illumina run, where the barcode (index) is saved in a dedicated FASTQ file 
(with the _.mid._ infix).

Use [sdm](../docs/sdm.md) to perform the demultiplexing.

_NOTE:_ This is a very small subsample of the original dataset and it's only proposed to test the demultiplexing procedure

## Demultiplexing procedure

 * In your _datasets/miseq_ folder you have a `miseq.txt` file: this is an _option file_ that contains common parameters for MiSeq runs. Check it with `less -S miseq.txt`
 * You also have a `miSeqMap.sm.txt`: this is the _mapping file_
 * With the help of the **sdm** documentation you should able to try issuing your command, in case have a look at the bottom of this page.
 

## Understanding the "undemultiplexed" format

 * Using the `head` or `less` commands, check that the three files (.1 , .2, .mid) are linked by the sequence ID
 * Using `wc` check that the three files have the same number of lines
 * Using `less`, check the structure of the _mapping file_
 




