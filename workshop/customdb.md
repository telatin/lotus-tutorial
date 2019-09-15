# Creating a custom taxonomical database

A taxonomical database consists of two parts:
 * A multifasta file with the reference sequcences
 * The taxonomical rank of each sequence (usually in the format _d:Bacteria,p:Firmicutes_...)
 
Sometimes you can have a multifasta file with the annotation:

```
>A000001;tax=d:Bacteria,p:Bacteroidetes;c:Bacteroidia,o:Bacteroidales,g:Bacteroides
ACACGACGTACGTAGCTAGCTGATCGATCGTAGCTAGCTGAC
ACGTAGCTAGGATCGATCGTACGTAGCTGATCGATCGATCGA
>A000002;tax=d:Bacteria,p:Firmicutes,c:Clostridia,o:Clostridiales,f:Lachnospiraceae,g:Roseburia
ACACGACGTAGGTAGCTAGCTGATCGATCGTAGCTAGCTGAC
ACGTAGCTAGGATCGATCTAACCCAGCTGATCGATCGATCGA
```

It is more common to have two separate files: one with the sequences (FASTA) and one with the taxonomy in a two-columns tabula format like:

```
A000001   d:Bacteria,p:Bacteroidetes;c:Bacteroidia,o:Bacteroidales,g:Bacteroides
A000002   d:Bacteria,p:Firmicutes,c:Clostridia,o:Clostridiales,f:Lachnospiraceae,g:Roseburia
```

## The "bee microbiome" database

The community of "bee researchers" have a long tradition of taxonomical classification of bacteria that does't completely match the classification found in commonly used databases like GreenGenes. They compiled their own database (BeeTax) that you can find in the **workshop/bee_db** folder.

A nice feature of Lotus it the ease of use of custom datasets (see [documentation](../docs/lotus.md)): can you run a Lotus analysis using this database instead of GreenGenes?
