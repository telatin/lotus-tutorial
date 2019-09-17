### Notes

#### Demultiplexing 454

```
# Go to the datasets/454 data directory first! 
# change "sdm" to the path to the program, if neede
mkdir demux/
sdm -map map.txt -i_path ./ -o_demultiplex demux/ -log demux/LOG -o_fna demux/all.fna
``` 

:bulb: Note that the _demux/all.fna_ is the typical input file that Qiime was using as input

If you also want to dereplicate:


```
sdm -map map.txt -i_path ./ -o_demultiplex demux/ -log demux/LOG -o_fna demux/all.fna \
  -o_dereplicate demux/derep.fas -dere_size_fmt 0 -min_derep_copies 2
```
#### Demultiplexing MiSeq
```
# Go in the datasets/miseq dir first! 
# change "sdm" to the path to the program, if needed
mkdir demux/
sdm -i A739F.sm.1.fq,A739F.sm.2.fq -i_MID_fastq A739F.sm.mid.fq -paired 2 \
 -o_demultiplex demux/ -log demux/LOG- -map miSeqMap.sm.txt
```
#### Running Lotus with 454 Data

```
# Go to the datasets/454 data directory first! 
# Change "lotus.pl" with the relative or absolute PATH to lotus.pl
mkdir lotus_output
lotus.pl -i ori/ -m map.txt   -o lotus_output -c path/to/lOTUs.cfg  -s 454_sdm.txt -simBasedTaxo 2
```

#### Running Lotus with MiSeq Data
The directory containing lotus.pl also contains _lOTUs.cfg_ and _sdm\_miSeq.txt_: change the command accordingly :)
```
# Go in the datasets/miseq dir first! 
# Change "lotus.pl" with the relative or absolute PATH to lotus.pl
mkdir lotus_output
~/lotus_pipeline/lotus.pl -i demux/ -m map.txt -o lotus_output -c (...)/lOTUs.cfg  -s  (...)/sdm_miSeq.txt -simBasedTaxo 2
```

