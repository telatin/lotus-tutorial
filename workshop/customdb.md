# Creating a custom taxonomical database

## What is a *taxonomical database*?

A taxonomical database consists of two parts:
 * A multi fasta file with the reference sequcences
 * The taxonomical rank of each sequence (usually in the format _d:Bacteria,p:Firmicutes_...)
 
Sometimes you can have a multifasta file with the annotation (in this case the multifasta alone can be considered a database). 
This is an example in the [USEARCH](https://drive5.com/usearch/manual/tax_annot.html) format:

```
>A000001;tax=d:Bacteria,p:Bacteroidetes;c:Bacteroidia,o:Bacteroidales,g:Bacteroides
ACACGACGTACGTAGCTAGCTGATCGATCGTAGCTAGCTGAC
ACGTAGCTAGGATCGATCGTACGTAGCTGATCGATCGATCGA
>A000002;tax=d:Bacteria,p:Firmicutes,c:Clostridia,o:Clostridiales,f:Lachnospiraceae,g:Roseburia
ACACGACGTAGGTAGCTAGCTGATCGATCGTAGCTAGCTGAC
ACGTAGCTAGGATCGATCTAACCCAGCTGATCGATCGATCGA
```

It is more common to have two separate files:
one with the sequences (FASTA) and
one with the taxonomy in a two-columns format like:

```
#ID       Taxonomy
A000001   d:Bacteria,p:Bacteroidetes;c:Bacteroidia,o:Bacteroidales,g:Bacteroides
A000002   d:Bacteria,p:Firmicutes,c:Clostridia,o:Clostridiales,f:Lachnospiraceae,g:Roseburia
```

## The "bee microbiome" database

The community of "bee researchers" have a long tradition of taxonomical classification of bacteria
that does't completely match the classification found in commonly used databases like GreenGenes.
They compiled their own database (BeeTax) that you can find in the [**workshop/bee_db** folder](https://github.com/telatin/lotus-tutorial/tree/master/datasets/bee_db).

A nice feature of Lotus it the ease of use of custom datasets (see [documentation](../docs/lotus.md)).

1) Can you identify the required sequences and taxonomy annotations in the "Bee_DB" directory?
2) Can you prepare a Lotus-friendly database out of those files?
