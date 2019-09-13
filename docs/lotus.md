# Lotus 1.6 documentation

### Main parameters

Please provide at least 3 arguments:
 * **-i** [input fasta / fastq / dir]
 * **-o** [output dir]
 * **-m/-map** [mapping file]

### Pipeline options

 - **-check_map** 
 [mapping file] only checks mapping file and exists
 - **-q** 
 [input qual file] (empty in case of fastq or directory)
 - **-barcode** 
 [file path] to fastq formated file with barcodes (this is a processed mi/hiSeq format)]
 - **-s** 
  [sdm option file], defaults to "sdm_options.txt" in current dir
 - **-c** 
  [lOTUs.cfg] config file with program paths]
 - **-p** 
  [sequencing platform] :454, miSeq, hiSeq, PacBio
 - **-t** 
  [temporary directory]
 - **-threads** 
  [number of threads] to be used, _default 1_
 - **-UP** 
   - `1` use UPARSE, _default_
   - `0` use otupipe,
 - **-tolerateCorruptFq** 
   - `1`: continue reading fastq files, even if single entries are incomplete (e.g. half of qual values missing). _default_ 
   - `0`: Abort lotus run, if fastq file is corrupt.  
 - **-custContamCheckDB** 
  This option checks in analogy to the phiX filter step in a custom DB (e.g. mouse genome, needs to be fasta format), for contaminant OTUs that are more likely to derrive from this genome than e.g. bacteria. Example: `-custContamCheckDB mouse.fna` (_default: empty_)
 - **-amplicon_type** 
   - **SSU**: small subunit (16S/18S) _default_
   - **LSU**: large subunit (23S/28S)
   - **ITS**: fungal ITS region
 - **-keepTmpFiles** 
   - `1` save extra tmp files like chimeric OTUs or the raw blast output in extra dir; 
   - `0` don't save these, _default_
 - **-saveDemultiplex** 
   - `1` Saves all demultiplexed & filtered reads in gzip format in the output directory (can require quite a lot of diskspace). 
   - `2` Only saves quality filtered demultiplexed reads and continues LotuS run subsequently. 
   - `3` Saves demultiplexed file into a single fq, saving sample ID in fastq/a header. 
   - `0` No demultiplexed reads are saved. _default_
 - **-highmem** 
   - `1` : highmem mode which has much faster excecution speed but can require substantial amounts of ram (e.g. hiSeq: ~40GB). _default_
   - `0`: deactivates this, reducing memory requirements to < 4 GB

###  Taxonmomy options 

 - **-TaxOnly** 
  skip most of the lotus pipeline and only run a taxonomic classification on a fasta file (provided via `-i` (could be an OTU fasta).
 - **-redoTaxOnly** 
   - `1` only redo the taxonomic assignments (useful for replacing a DB used on a finished lotus run), 
   - `0` normal lotus run, _default_
 - **-rdp_thr** 
  [Confidence threashold] for RDP, _default 0.8_
 - **-utax_thr** 
  [Confidence threashold] for UTAX, default 0.8]
 - **-LCA_frac** 
  [fraction] min fraction of reads with identical taxonomy. _default 0.9_
 - **-keepUnclassified** 
   - `1` includes unclassified OTUs (i.e. no match in RDP/Blast database) in OTU and taxa abundance matrix calculations; 
   - `0` does not take these OTU's into account, _default_
 - **-simBasedTaxo** 
   - `0` default: use RDP
   - `1` or `blast`: use Blast; 
   - `2` or `lambda`: use LAMBDA to search against a 16S reference database for taxonomic profiling of OTUs; 
   - `3` or `utax`: use UTAX with custom databases. 
 - **-useBestBlastHitOnly** 
   - `1` don't use LCA (last common ancestor) to determine most likely taxnomic level, instead just use the best blast hit (not recommended). 
   - `0`: (default) LCA algorithm
 - **-refDB** 
   - `GG` greengenes (only SSU available),  _default_
   - `SLV` Silva LSU (23/28S) or SSU (16/18S), 
   - `HITdb` (SSU, human gut specific), 
   - `PR2` (LSU spezialized on Ocean environmentas), 
   - `UNITE` (ITS fungi specific), 
   - `beetax` (bee gut specific database and tax names). Decide which reference DB will be used for a similarity based taxonomy annotation,
   - Databases can be combined, with the first having the highest prioirty. E.g. `PR2,SLV` would first use PR2 to assign OTUs and all unaasigned OTUs would be searched for with SILVA, given that `-amplicon_type LSU` was set.
 - **-tax4refDB** 
  in conjunction with a custom fasta file provided to argument `-refDB`, this file contains for each fasta entry in the reference DB a taxonomic annotation string, with the same number of taxonomic levels for each, tab separated.  
 - **-greengenesSpecies** 
   - `1`: Create greengenes output labels instead of OTU (to be used with greengenes specific programs such as BugBase). 
   - `0`: Disable the feature _default_
 - **-tax_group** 
   - `bacteria`: bacterial 16S rDNA annnotation _default_
   - `fungi`: fungal 18S/23S/ITS annotation. 
 - **-itsextraction** 
   - `1`: use ITSx to only retain OTUs fitting to ITS1/ITS2 hmm models _default_
   - `0`: deactivate
 - **-itsx_partial** 
   - `0-100`: parameters for ITSx to extract partial (%) ITS regions as well; 0: deactivate; Default=0]


### OTU clustering options 
 
 - **-CL/-clustering** 
   - `1` use UPARSE **default**, 
   - `0` use otupipe (deprecated), 
   - `2` use swarm and 
   - `3` use cd-hit
 - **-id** 
   clustering threshold for OTU's, _default 0.97_
 - **-swarm_distance** 
   clustering threshold for OTU's when using swarm clustering, _default 1_
 - **-chim_skew** 
   skew in chimeric fragment abundance (uchime option), _default 2_
 - **-derepMin** 
   minimum size of dereplicated clustered, one form of noise removal. Can be complex terms like `10:1,3:3` (meaning at least 10x in 1 sample or 3x in 3 different samples.) _Default 1_. 
Can also be a custom fasta formatted database: in this case provide the path to the fasta file as well as the path to the taxonomy for the sequences using `-tax4refDB`. See also online help on how to create a custom DB.
 - **-count_chimeras** 
   - `T`: count chimeric reads into their estimated original OTUs, 
   - `F`: do nothing. Default F]
 - **-deactivateChimeraCheck** 
   - `0`: do OTU chimera checks  _default_
   - `1`: no chimera Check at all. 
   - `2`: Deactivate deNovo chimera check. 
   - `3`: Deactivate ref based chimera check.
 - **-readOverlap** 
   the maximum number of basepairs that two reads are overlapping, _default 300_
 - **-flash_param** 
   custom flash parameters, since this contains spaces the command needs to be in parentheses: e.g. `-flash_param "-r 150 -s 20"`. Note that this option completely replaces the default -m and -M flash options (_i.e._ need to be reinserted, if wanted)
 - **-endRem** 
   DNA sequence, usually reverse primer or reverse adaptor; all sequence beyond this point will be removed from OTUs. This is redundant with the "ReversePrimer" option from the mapping file, but gives more control (e.g. there is a probelm with adaptors in the OTU output), _default ""_
 - **-xtalk** 
   - `1` check for crosstalk; note that this requires in most cases 64bit usearch, 
   - `0` don't. _default_
