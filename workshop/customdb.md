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

