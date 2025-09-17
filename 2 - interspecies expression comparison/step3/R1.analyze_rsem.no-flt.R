# Ming-an Sun, 2020-12-09
rm(list = ls())
require(plyr)
library(magrittr)
library(ExprX)
library(pheatmap)
library(biomaRt)
library(edgeR)
library(DESeq2)
library(ggplot2)
library(RColorBrewer)
library(patchwork)  
##### custom functions
setwd("E:/fanhairui/03.Placent/ducui/sun.eg/")

## get ribisomal RNA gene IDs
get_rp_gene_id <- function(orth_data){
  rp_gene_idx <- union(
    grep("^RP[SL]\\d", orth_data[[1]][,2], ignore.case = TRUE),
    grep("^RP[SL]\\d", orth_data[[2]][,2], ignore.case = TRUE)
  )
  c(orth_data[[1]][,1][rp_gene_idx], orth_data[[2]][,1][rp_gene_idx])
}

## calculated normalized TMM values
nrm_tpm <- function(m){
  m.cpm = cpm(m)
  nrm.factor <- calcNormFactors(object = m.cpm, method = "TMM")
  m.nrm = t(t(m.cpm)/as.vector(nrm.factor))
  return(m.nrm)
}

## match data with order kept
match_data <- function(d, id){
  d[match(id, row.names(d)),]
}

##### read TPM files
#hsa = read.table("../hsa.merged_tpm.txt", header = T, row.names = 1)
#mml = read.table("../mml.merged_tpm.txt", header = T, row.names = 1)
#mmu = read.table("../mmu.merged_tpm.txt", header = T, row.names = 1)
Bos_taurus = read.table("./tpm/Bos_taurus.merged_tpm.txt", header = T, row.names = 1)
Canis_lupus_familiaris = read.table("./tpm/Canis_lupus_familiaris.merged_tpm.txt", header = T, row.names = 1)
Dasypus_novemcinctus = read.table("./tpm/Dasypus_novemcinctus.merged_tpm.txt", header = T, row.names = 1)
Equus_caballus = read.table("./tpm/Equus_caballus.merged_tpm.txt", header = T, row.names = 1)
Homo_sapiens = read.table("./tpm/Homo_sapiens.merged_tpm.txt", header = T, row.names = 1)
Loxodonta_africana = read.table("./tpm/Loxodonta_africana.merged_tpm.txt", header = T, row.names = 1)
Macaca_mulatta = read.table("./tpm/Macaca_mulatta.merged_tpm.txt", header = T, row.names = 1)
Mus_musculus = read.table("./tpm/Mus_musculus.merged_tpm.txt", header = T, row.names = 1)
Sus_scrofa = read.table("./tpm/Sus_scrofa.merged_tpm.txt", header = T, row.names = 1)
Monodelphis_domestica = read.table("./tpm/Monodelphis_domestica.merged_tpm.txt", header = T, row.names = 1)

#hsa.d <- hsa
#mml.d <- mml
#mmu.d <- mmu
Bos_taurus.d = Bos_taurus 
Canis_lupus_familiaris.d = Canis_lupus_familiaris 
Dasypus_novemcinctus.d = Dasypus_novemcinctus 
Equus_caballus.d = Equus_caballus 
Homo_sapiens.d = Homo_sapiens 
Loxodonta_africana.d = Loxodonta_africana 
Macaca_mulatta.d = Macaca_mulatta 
Mus_musculu.d = Mus_musculus 
Sus_scrofa.d = Sus_scrofa 
Monodelphis_domestica.d = Monodelphis_domestica 

#colnames(hsa.d) %>% sub("hsa.","Human.",.)   %>% sub("_trimmed.*$", "", .) %>% sub("_rep","_",.) -> colnames(hsa.d)
#colnames(mml.d) %>% sub("mml.","Macaque.",.) %>% sub("_trimmed.*$", "", .) %>% sub("_rep","_",.) -> colnames(mml.d)
#colnames(mmu.d) %>% sub("mmu.","Mouse.",.)   %>% sub("_trimmed.*$", "", .) %>% sub("_rep","_",.) -> colnames(mmu.d)

##### get 1:1 ortholog info

# unmark the following lines to get updated ortholog annotation
#hsa2mmu.orth <- ortholog_match("Human",   "Mouse")
#hsa2mml.orth <- ortholog_match("Human",   "Macaque")
#mml2mmu.orth <- ortholog_match("Macaque", "Mouse")

#saveRDS(hsa2mmu.orth, "hsa2mmu.orth.rds")
#saveRDS(hsa2mml.orth, "hsa2mml.orth.rds")
#saveRDS(mml2mmu.orth, "mml2mmu.orth.rds")

#hsa2mmu.orth <- readRDS("hsa2mmu.orth.rds")
hsa2mml.orth <- readRDS("./07.hs2mmulatta.orth.rds")
#mml2mmu.orth <- readRDS("mml2mmu.orth.rds")

##### filter orthologs

##### get 1:1:1 orthologs among 3 species
sp3.hom = read.table("./Species10_ortholog.txt", header = T)

##### merge hsa, mml and mmu data for further analysis

tri.1t1 = cbind(
  match_data(Homo_sapiens.d, sp3.hom[,1]),
  match_data(Bos_taurus.d, sp3.hom[,2]),
  match_data(Canis_lupus_familiaris.d, sp3.hom[,3]),
  match_data(Dasypus_novemcinctus.d, sp3.hom[,4]),
  match_data(Equus_caballus.d, sp3.hom[,5]),
  match_data(Loxodonta_africana.d, sp3.hom[,6]),
  match_data(Monodelphis_domestica.d, sp3.hom[,7]),
  match_data(Macaca_mulatta.d, sp3.hom[,8]),
  match_data(Mus_musculu.d, sp3.hom[,9]),
  match_data(Sus_scrofa.d, sp3.hom[,10])

)
#colnames(tri.1t1) %>% sub("hsa.", "Human_", .) %>% sub("mml.", "Macaque_", .) %>% sub("mmu.", "Mouse_", .) ->colnames(tri.1t1)

nrow(tri.1t1)
#[1] 8941
#write.table(tri.1t1, file = "Species10_raw_tpm.tri.1t1.txt", row.names = TRUE, col.names = TRUE, sep = "\t", quote = FALSE)
tri.1t1 = read.table("./Species10_raw_tpm.tri.1t1.txt", header = T, row.names = 1)
nrow(tri.1t1)
#[1] 8933

#tri.1t1.flt = tri.1t1[apply(tri.1t1, 1, max)>=1,]
#nrow(tri.1t1.flt)
#write.table(tri.1t1.flt, file = "Species10_raw_tpm.tri.1t1.flt.txt", row.names = TRUE, col.names = TRUE, sep = "\t", quote = FALSE)

#tri.1t1.flt = read.table("./Species10_raw_tpm.tri.1t1.flt-2.txt", header = T, row.names = 1)
#[1] 6156
## normalize TPM by TMM method
tri.1t1.flt = tri.1t1
tri.1t1.flt.nrm = nrm_tpm(tri.1t1.flt)

tri.1t1.flt.plus <- tri.1t1.flt
tri.1t1.flt.nrm.plus <- nrm_tpm(tri.1t1.flt.nrm)
row.names(tri.1t1.flt.plus) <- mapvalues(
  row.names(tri.1t1.flt.plus), 
  from = hsa2mml.orth$human$GeneID, 
  to = paste0(hsa2mml.orth$human$GeneID, ":", hsa2mml.orth$human$GeneName)
  )
row.names(tri.1t1.flt.nrm.plus) <- mapvalues(
  row.names(tri.1t1.flt.nrm.plus), 
  from = hsa2mml.orth$human$GeneID, 
  to = paste0(hsa2mml.orth$human$GeneID, ":", hsa2mml.orth$human$GeneName)
)

#write.table(tri.1t1, file = "Species10_raw_tpm.txt", row.names = TRUE, col.names = TRUE, sep = "\t", quote = FALSE)
#write.table(tri.1t1.flt.plus, file = "Species10_raw_tpm.flt.txt", row.names = TRUE, col.names = TRUE, sep = "\t", quote = FALSE)
write.table(tri.1t1.flt.nrm.plus, file = "Species10_nrm_tpm.txt", row.names = TRUE, col.names = TRUE, sep = "\t", quote = FALSE)

png(file="Fig.sp10_tpm_distr.png", width = 15000, height = 7000, res = 600)
par(mar=c(15,4,1,1), mfrow=c(2,2))
barplot(apply(tri.1t1.flt,2,sum), las = 2, ylab="Total TPM", main="Before TMM normalization")
barplot(apply(tri.1t1.flt.nrm,2,sum), las = 2, ylab="Total normalized TPM", main="After TMM normalization")
boxplot(log10(tri.1t1.flt+1), las=2, ylab="log10(normalized TPM)", main="Before TMM normalization")
boxplot(log10(tri.1t1.flt.nrm+1), las=2, ylab="log10(normalized TPM)", main="After TMM normalization")
dev.off()

## correlation based on different distance matrix
tri.1t1.flt.nrm.dst = as.dist(1-cor(log10(tri.1t1.flt.nrm+1), method = "p"))

tri.ann <- data.frame(
  row.names = colnames(tri.1t1.flt.nrm),
  Species = sub("\\..*$","",colnames(tri.1t1.flt.nrm)),
  Tissue = colnames(tri.1t1.flt.nrm) %>% sub("^[^\\.]*\\.","",.) %>% sub("_.*$","",.)
)
col7 = brewer.pal(7, "Set1")
tri.ann.color = list(
  Species = c(Human = col7[1], Macaque = col7[5], Mouse = col7[3]),
  Tissues = c(Placenta = col7[1], Brain = col7[2], Heart = col7[3], Kidney = col7[4], Liver = col7[5], Testis = col7[6])
)

png(file = "Fig.sp10_cor_heatmap.full.png", width = 6400, height = 6000, res = 300)
pheatmap(
  cor(log10(tri.1t1.flt.nrm+1), method = "p"),
  cluster_rows = hclust(tri.1t1.flt.nrm.dst),
  cluster_cols = hclust(tri.1t1.flt.nrm.dst), 
  annotation_row = tri.ann,
  annotation_col = tri.ann,
  annotation_colors = tri.ann.color,
  display_numbers = TRUE,
  number_format = "%.2f"
)
dev.off()

png(file = "Fig.sp10_cor_heatmap.png", width = 6400, height = 5400, res = 600)
pheatmap(
  cor(log10(tri.1t1.flt.nrm+1), method = "p"),
  cluster_rows = hclust(tri.1t1.flt.nrm.dst),
  cluster_cols = hclust(tri.1t1.flt.nrm.dst), 
  annotation_row = tri.ann,
  annotation_col = tri.ann,
  annotation_colors = tri.ann.color,
  labels_row = sub("_.*$","",colnames(tri.1t1.flt.nrm)),
  labels_col = sub("_.*$","",colnames(tri.1t1.flt.nrm))
)
dev.off()

## PCA analysis
cnt.data = round(as.matrix(tri.1t1.flt.nrm), 0)
samples  = colnames(cnt.data)
tissue   = sub("^[^\\.]+\\.","",samples) %>% sub("_.*$","",.)
species  = sub("\\..*$", "", samples)
col.data = data.frame(
  Tissue = factor(tissue),
  Species = factor(species)
)

dds <- DESeqDataSetFromMatrix(countData = cnt.data, colData = col.data, design = ~ Species)
dds <- estimateSizeFactors(dds)
# also normalized by TMM, thus set normalized as FALSE
se = SummarizedExperiment(
  log10(counts(dds, normalized=FALSE) + 1),
  colData = colData(dds)
)
pca.data <- plotPCA(DESeqTransform(se), intgroup = c("Tissue", "Species"), returnData = TRUE, ntop=500)
percent.var = round(100*attr(pca.data, "percentVar"))

png(file = "Fig.sp10_pca_plot.png", width = 3200, height = 2200, res = 600)
ggplot(pca.data, aes(PC1, PC2, color=Tissue, shape=Species)) +
  theme_bw() + 
  theme(legend.position = "right", legend.direction = "vertical") +
  geom_point(size = 3, alpha = I(0.8)) +
  xlab(paste0("PC1: ", percent.var[1], "% variance")) +
  ylab(paste0("PC2: ", percent.var[2], "% variance"))
dev.off()


