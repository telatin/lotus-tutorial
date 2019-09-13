### Notes

#### Demultiplexing

 *  454 Data
 
 sdm -map map.txt -i_fna Anh.1.fna,Anh.2.fna -o_demultiplex sdm/ -log sdm/log
 
 
#### Lotusing

* 454 Data

~/lotus_pipeline/lotus.pl -i ori/ -m map.txt   -o lotus_sdm -c /home/metagenomics2019/lotus_pipeline/lOTUs.cfg  -s 454_sdm.txt -simBasedTaxo 2

~/lotus_pipeline/lotus.pl -i demux/ -m map.txt -o lotus -c /home/metagenomics2019/lotus_pipeline/lOTUs.cfg  -s 454_sdm.txt -simBasedTaxo 2
