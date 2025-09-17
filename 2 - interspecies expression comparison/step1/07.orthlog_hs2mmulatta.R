# 清除环境中的所有对象
rm(list = ls())

# 设置工作目录
data_dir <- "E:/fanhairui/03.Placent/ducui/ducui"
setwd(data_dir)

# 加载 ExprX 包
library(ExprX)

# 定义元数据文件的路径
hs2mm_meta_file <- file.path(data_dir, "mmulatta_metatable.csv")

# 生成 ExprX 数据集
hs2mm.data <- make_ExprX_dataset(hs2mm_meta_file)

# 匹配直系同源基因
hs2mm.orth <- ortholog_match("human", "macaque")
saveRDS(hs2mm.orth, "./07.mmulatta/07.hs2mmulatta.orth.rds")

# 读取保存的直系同源基因数据
hs2mm.orth <- readRDS(file = "./07.mmulatta/07.hs2mmulatta.orth.rds")

# 输出结构信息以检查数据
str(hs2mm.orth)

# 按基因类型和染色体汇总基因信息
hs2mm.orth.genetype <- summarize_ortholog_gene(hs2mm.orth, group = "genetype")
head(hs2mm.orth.genetype)
hs2mm.orth.chrom <- summarize_ortholog_gene(hs2mm.orth, group = "chrom")
head(hs2mm.orth.chrom)

# 过滤直系同源基因数据
hs2mm.orth.flt <- ortholog_filter(
  hs2mm.orth,
  genetype_include = "protein_coding",  # 只包括蛋白编码基因
  chrom_exclude = c("X", "Y", "MT")     # 排除 X, Y, MT 染色体上的基因
)
#Original gene number: 19957
#Filtered gene number: 15778
# 检查过滤前后的基因数量
print(dim(hs2mm.orth[[1]]))  # 过滤前的数量
#[1] 17140     4
print(dim(hs2mm.orth.flt[[1]]))  # 过滤后的数量
#[1] 15726     4
write.csv(hs2mm.orth.flt, file ="./07.mmulatta/hs2mmulatta.orth.inf.csv",row.names = FALSE)
#head(hs2mm.orth.flt)

# 将表达数据与过滤后的同源基因数据合并
hs2mm.data <- ortholog_expression_merge(
  expr_data = hs2mm.data,
  orth_data = hs2mm.orth.flt
)
head(hs2mm.data)
#Number of ortholog pairs absent from expr_data
#human:	20
#mouse:	29
#Original  ortholog number: 15726
#Discarded ortholog number: 37
#Resulted  ortholog number: 15689

library(edgeR)
hs2mm.data <- ortholog_expression_normalize(
  expr_data = hs2mm.data,method = "TMM"
)

#head(hs2mm.data)
library(RankProd)
hs2mm.deg <- ortholog_expression_compare(
  hs2mm.data,method = "RankProd", p_adjust = "fdr"
)

hs2mm.deg <- hs2mm.deg[order(hs2mm.deg$P_value),]
head(hs2mm.deg)
# Determine significant differential genes (human>mouse) based on p-values and log2foldChange
hs2mm.hsHigh <- subset(hs2mm.deg,subset = log2foldChange > 1 & P_value < 0.05)
head(hs2mm.hsHigh)
# Determine significant differential genes (human<mouse) based on p-values and log2foldChange
hs2mm.mmHigh <- subset(hs2mm.deg,subset = log2foldChange < -1 & P_value < 0.05)
head(hs2mm.mmHigh)

# Save significant differential genes
write.csv(hs2mm.hsHigh, file = "./07.mmulatta/hs2mm_hsHigh.csv", row.names = FALSE)
write.csv(hs2mm.mmHigh, file = "./07.mmulatta/hs2mm_mmHigh.csv", row.names = FALSE)
write.csv(hs2mm.deg, file ="./07.mmulatta/hs2mm.all_gene.inf.csv",row.names = FALSE)

# Generate MA-plot
svg("./07.mmulatta/07.mmulatta.MA.svg")
ortholog_expression_plot(
  hs2mm.deg, "MA",
  main = "Placenta", xlim = c(0,120000), ylim = c(-18,18)
)
dev.off()

# Generate Volcano-plot
svg("./07.mmulatta/07.mmulatta.Volcano.svg")
ortholog_expression_plot(
  hs2mm.deg, "volcano",
  main = "Placenta", xlim = c(-18,18), ylim = c(0, 3)
)
dev.off()
