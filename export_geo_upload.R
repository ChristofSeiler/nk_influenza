# extract normalized counts for upload to GEO

library("DESeq2")

# monocytes
load("~/Box Sync/Lisa/RNAseq/Monocyte/tophat/publication_ready_workflow/dds.Rdata")
counts_normalized_monocytes = counts(dds, normalized = TRUE)
counts_unnormalized_monocytes = counts(dds, normalized = FALSE)
write.csv(counts_normalized_monocytes, file = "counts_normalized_monocytes.csv")
write.csv(counts_unnormalized_monocytes, file = "counts_unnormalized_monocytes.csv")

# NK cells
load("~/Box Sync/Lisa/RNAseq/NK cell/tophat/publication_ready_workflow/dds.Rdata")
counts_normalized_nkcells = counts(dds, normalized = TRUE)
counts_unnormalized_nkcells = counts(dds, normalized = FALSE)
write.csv(counts_normalized_nkcells, file = "counts_normalized_nkcells.csv")
write.csv(counts_unnormalized_nkcells, file = "counts_unnormalized_nkcells.csv")
