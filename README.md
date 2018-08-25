# Code to Reproduce Results

This is the code repository to reproduce all major figures in our manuscript:

* L. Kronstad, C. Seiler, R. Vergara, S. Holmes, and C. Blish <br>
  Differential Induction of IFN-α and Modulation of CD112 and CD54 Expression Govern the Magnitude of NK Cell IFN-γ Response to Influenza A Viruses <br>
  The Journal of Immunology, 2018 <br>
  10.4049/jimmunol.1800161

## Installation

```{bash}
make install
```

## Gene Mapping

Using STAR.

```{bash}
make mapping
```

Using tophat.

```{bash}
make indexing
make mapping_tophat
```

## Differential Analysis and Network Analysis

This will run two R markdown files: DESeq2.Rmd and NetworkAnalysis.Rmd.

```{bash}
make da_monocyte
make da_nk
```
